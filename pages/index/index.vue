<template>
	<!--页面-->
	<view class="container">

		<!--查看查询条件的按钮-->
		<view class="button_box">
			<button class="query_button" @click="toggle('left')"><text class="button_text">选择课程的筛选条件</text></button>
		</view>

		<!--课程展示-->
		<view class="course_box"><!--后面使用循环-->
			<!--使用uni-ui的折叠组件，折叠详情-->
			<uni-collapse v-for="(item, index) in showCourse" :key="index">
				<uni-collapse-item :title="item.course.name">
					<!--课程详细信息和选课按钮-->
					<uni-table>
						<uni-tr>
							<uni-th width="30" align="center">教学班</uni-th>
							<uni-th width="30" align="center">教学班id</uni-th>
							<uni-th width="30" align="center">上课时间</uni-th>
							<uni-th width="30" align="center">上课地点</uni-th>
							<uni-th width="30" align="center">已选/容量</uni-th>
							<uni-th width="30" align="center">操作</uni-th>
						</uni-tr>
						<uni-tr v-for="(item1, index1) in item.teachingClassesList" :key="index1">
							<uni-td>{{ item1.className }}</uni-td>
							<uni-td>{{ item1.id }}</uni-td>
							<uni-td>{{ item1.teacher }}</uni-td>
							<uni-td>{{ item1.classroom }}</uni-td>
							<uni-td>{{ item1.selectedNum }}/{{ item1.capacity }}</uni-td>
							<uni-td>
								<button class="choose" @click="selectCourse(item1.id)"><text class="button_text">选课</text></button>
							</uni-td>
						</uni-tr>
					</uni-table>
				</uni-collapse-item>

			</uni-collapse>
		</view>


		<!--popup弹出层-->
		<view>
			<uni-popup ref="popup" background-color="#fff">
				<!--搜索栏-->
				<view><uni-search-bar v-model="searchValue" @confirm="searchCourse" /></view>
				<!--课程类别筛选条件-->
				<view class="pop-content">
					<uni-section class="mb-10" title="课程类别" type="line" titleFontSize="20px"
						titleColor="#333"></uni-section>
					<uni-data-checkbox v-model="queryCondition.subject" :localdata="collegeSubject" />
				</view>
				<!--学院筛选条件-->
				<view class="pop-content">
					<uni-section class="mb-10" title="学院" type="line" titleFontSize="20px"
						titleColor="#333"></uni-section>
					<uni-data-checkbox v-model="queryCondition.college" :localdata="courseCollege"
						@change="changeCollege" />
				</view>
				<!--专业筛选条件-->
				<view class="pop-content">
					<uni-section class="mb-10" title="专业" type="line" titleFontSize="20px"
						titleColor="#333"></uni-section>
					<uni-data-checkbox v-model="queryCondition.subject" :localdata="collegeSubject" />
				</view>


			</uni-popup>
		</view>

	</view>

</template>

<script>
export default {
	data() {
		return {
			studentNumber:"",//学号
			searchValue: "",//搜索框输入的值
			type: "",//弹出层参数
			queryCondition://查询条件
			{
				college: "",//学院
				subject: "",//专业
				courseName: "",//课程名称(搜索框用)
				courseType: ""//课程类别
			},
			collegeValue: 0,//学院字段值（用于根据学院筛选专业）
			//从后端获取的所有课程列表
			course: [],
			//展示在前台的课程列表
			showCourse:[],
			//年级单选框
			courseYear: [
				{
					text: "2026",
					value: 2026
				},
				{
					text: "2025",
					value: 2025
				},
				{
					text: "2024",
					value: 2024
				},
				{
					text: "2023",
					value: 2023
				},
				{
					text: "2022",
					value: 2022
				},
				{
					text: "2021",
					value: 2021
				},
			],
			//学院选择框
			courseCollege: [
				{
					text: "管理科学与信息工程学院",
					value: "管理科学与信息工程学院",
					cValue: 1
				},
				{
					text: "旅游学院",
					value: "旅游学院",
					cValue: 2
				}
			],
			//所有专业
			courseSubject: [
				{
					text: "网络工程",
					value: "网络工程",
					sValue: 1
				},
				{
					text: "软件工程",
					value: "软件工程",
					sValue: 1
				},
				{
					text: "旅游管理",
					value: "旅游管理",
					sValue: 2
				}
			],
			//筛选专业
			collegeSubject: [],

			//所有课程的教学班
			courseClass: [
				{
					class: "教学一班",
					teacher: "测试教师",
					classroom: "教室",
					chosen: 90,//已选人数
					volume: 95,//容量
					course_code: "GK_JK_001"
				},
				{
					class: "教学2班",
					teacher: "测试教师",
					classroom: "教室",
					chosen: 90,//已选人数
					volume: 95,//容量
					course_code: "GK_JK_002"
				}
			],
			//展示在前台的教学班
			showCourseClass:[]

		}
	},
	onLoad() {
		//接收存储的登陆数据
		uni.getStorage({
      			key:'studentNumber',
      			success:(res)=>{
        			this.studentNumber = res.data
      			},
    	});
		this.searchAllCourse();//加载全部课程
	},
	computed:{

		/**根据课程代码筛选教学班 */
		siftClass(code)
		{
			return this.courseClass.filter((item)=>{
				return item.course_code === code;
			})
		}
	},
	methods: {
		/**点击按钮弹出弹出层 */
		toggle(type) {
			this.type = type;

			this.$refs.popup.open(type)//从左边弹出
		},
		/**学院选择，调用筛选专业方法 */
		changeCollege(e) {
			console.log("e:", e);

			var sValue = e.detail.data.cValue;//拿到专业id
			this.chooseSubject(sValue);
			console.log(this.collegeSubject);
		},
		/**筛选学院包含的专业 */
		chooseSubject(value) {
			var that = this;
			var arr = [];
			that.courseSubject.map(item => {//遍历数据，拿到符合专业的存储下来
				if (item.sValue == value) {
					arr.push(item);
				}
			})
			that.collegeSubject = arr;
			console.log(that.collegeSubject);
			//滚动到顶部
			uni.pageScrollTo({
				duration: 0, //过渡时间必须为0，否则运行到手机会报错
				scrollTop: 0 //滚动到实际距离是元素距离顶部的距离减去最外层盒子的滚动距离（如res.top - data.top）
			})

		},
		/**查询 */
		searchCourse() {
			


			var searchValue = this.searchValue;//搜索值

			


			//关闭弹出层
			this.$refs.popup.close();

		},

		/**查询全部课程 */
		searchAllCourse() {
			let that = this;
			this.$courseRequest({
				url: "/course/list",
				method: "GET"
			}).then(res => {
				that.course = res.data.data;
				console.log(that.course);
				that.showCourse = res.data.data;
			}).catch(err => {
				console.log(err);
			})
		},

		/**选课 */
		selectCourse(id)
		{
			let that = this;
			console.log("选课");
			
			//后端选课接口
			this.$courseRequest({
				url:"/course/choose-course",
				method:"POST",
				data:
				{
					classId:id,
					studentNumber:that.studentNumber
				}
			}).then(res=>{
				console.log(res);
				
				/**提示选课成功 */
				uni.showToast({
					title: '选课成功！',
					icon: 'success',
					mask: true
				})
			}).catch(err=>{
				console.log(err);
				uni.showToast({
					title:'选课失败！',
					icon:'fail',
					mask:true
				})
			})

		}

		

	}
}
</script>

<style lang="scss">
.container {
	height: 100%;
}

.button_box

/**按钮盒子 */
	{
	background-color: #fff;
	padding: 10px 0;
}

.query_button

/**按钮样式 */
	{
	color: #fff;
	background-color: #075cef;
	width: 95%;
	height: 35px;
	margin: 0 5px;
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 0 0;
}

.button_text

/**按钮字体 */
	{
	color: #fff;
	font-size: 12px;
}

.mb-10

/**section样式 */
	{
	margin-bottom: 10px;
}

.pop-content

/**弹出框样式 */
	{
	width: 250px;
}

/**选课按钮样式 */
.choose {
	color: #fff;
	margin: 0 5px;
	border-radius: 5px;
	background-color: #075cef;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 0 15rpx;
}

/**课程列表view */
.course_box {
	margin-top: 5rpx;
}

.flex_box

/**flex样式 */
	{
	display: flex;
	flex-direction: row;
}

.table_box {
	display: flex;
	flex-direction: column;
	margin-left: 10rpx;
}
</style>
