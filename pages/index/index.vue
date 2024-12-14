<template>
	<!--页面-->
	<view class="container">

		<!--查看查询条件的按钮-->
		<view class="button_box">
			<view><uni-search-bar v-model="searchValue" @confirm="searchCourse" /></view>
		</view>

		<!--课程展示-->
		<view class="course_box"><!--后面使用循环-->
			<!--使用uni-ui的折叠组件，折叠详情-->
			<uni-collapse v-for="(item, index) in showCourse1" :key="index">
				<uni-collapse-item :title="item.course.name">
					<!--课程详细信息和选课按钮-->
					<scroll-view scroll-x="true" @scroll="scroll"
						style="width: 100%;overflow: hidden;white-space: nowrap;">
						<view class="scroll-view_H">
							<uni-table>
								<uni-tr>
									<uni-th width="30" align="center">教学班</uni-th>
									<uni-th width="30" align="center">上课时间</uni-th>
									<uni-th width="30" align="center">上课地点</uni-th>
									<uni-th width="30" align="center">已选/容量</uni-th>
									<uni-th width="30" align="center">开课学期</uni-th>
									<uni-th width="30" align="center">学分</uni-th>
									<uni-th width="30" align="center">操作</uni-th>
									<uni-th width="30" align="center">查看详情</uni-th>
								</uni-tr>
								<uni-tr v-for="(item1, index1) in item.teachingClassesList" :key="index1">
									<uni-td>{{ item1.className }}</uni-td>
									<uni-td>{{ item1.classTime }}</uni-td>
									<uni-td>{{ item1.classroom }}</uni-td>
									<uni-td>{{ item1.selectedNum }}/{{ item1.capacity }}</uni-td>
									<uni-td>{{ item1.currentTim }}{{item1.currentTerm}}学期</uni-td>
									<uni-td>{{ item.course.credit }}</uni-td>
									<uni-td>

										<button class="choose"
											@click="selectCourse(item.course.courseCode, index, index1, item1.id)"><text
												class="button_text">选课</text></button>

									</uni-td>
									<uni-td>
										<button class="choose" @click="ToPopup(index, 'bottom')"><text
												class="button_text">查看详情</text></button>
									</uni-td>


								</uni-tr>
							</uni-table>
						</view>
					</scroll-view>
				</uni-collapse-item>

			</uni-collapse>
		</view>


		<!--popup弹出层-->

		<view>
			<uni-popup ref="popup" background-color="#fff" type="left">
				<!--搜索栏-->
				
				<!--课程类别筛选条件-->
				<view class="pop-content">
					<uni-section class="mb-10" title="课程类别" type="line" titleFontSize="20px"
						titleColor="#333"></uni-section>
					<uni-data-checkbox v-model="queryCondition.character" :localdata="isCharacter" />
				</view>
				<!--学院筛选条件-->
				<view class="pop-content">
					<uni-section class="mb-10" title="学院" type="line" titleFontSize="20px"
						titleColor="#333"></uni-section>
					<uni-data-checkbox v-model="queryCondition.college" :localdata="courseCollege"
						@change="changeCollege" />
				</view>
			</uni-popup>

		</view>


		<view>
			<uni-popup ref="popup2" background-color="#fff" type="bottom">
				<view class="pop-content">
					<uni-section class="mb-10" title="课程描述" type="line" titleFontSize="20px"
						titleColor="#333"></uni-section>
					<view class="into_text">{{ showCourse1[courseIndex].course.courseIntroduction }}</view>
				</view>
				<view class="pop-content">
					<uni-section class="mb-10" title="课程大纲" type="line" titleFontSize="20px"
						titleColor="#333"></uni-section>
					<view class="into_text">{{ showCourse1[courseIndex].course.teacheringProgrammer }}</view>
				</view>

			</uni-popup>
		</view>

		

	</view>

</template>

<script>
export default {
	data() {
		return {
			studentNumber: "",//学号
			searchValue: "",//搜索框输入的值
			type: "",//弹出层参数
			queryCondition://查询条件
			{
				college: "",//学院
				subject: "",//专业
				courseName: "",//课程名称(搜索框用)
				courseType: "",//课程类别
				charater: ""
			},
			collegeValue: 0,//学院字段值（用于根据学院筛选专业）
			//从后端获取的所有课程列表
			course: [],
			//展示在前台的课程列表
			showCourse: [],
			showCourse1: [],
			courseIndex: 0,
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
					value: 1,
					cValue: 1
				},
				{
					text: "旅游学院",
					value: 2,
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
			showCourseClass: [],

			isCharacter:[//必修选修状态纽
				{
					text:"必修",
					value:"必修"
				},
				{
					text:"选修",
					value:"选修"
				}
			],
			

		}
	},
	onLoad() {
		//接收存储的登陆数据
		this.getStorageNumber();
		this.searchAllCourse();
		this.getAllStudentCourse();
	},
	onShow() {
		//接收存储的登陆数据
		this.getStorageNumber();
		this.searchAllCourse();
		this.getAllStudentCourse();
	},
	computed: {

		/**根据课程代码筛选教学班 */
		siftClass(code) {
			return this.courseClass.filter((item) => {
				return item.course_code === code;
			})
		},

		//计算

	},
	methods: {
		/**点击按钮弹出弹出层 */
		toggle(type) {
			console.log(this.showCourse1);
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
		async searchCourse() {

			var searchValue = this.searchValue;//搜索值

			//查询
			let queryCourse = "";
			if (searchValue) {
				queryCourse = this.course.filter(item => item.course.name.includes(searchValue));
			}




			this.showCourse1 = queryCourse;


			//关闭弹出层
			this.$refs.popup.close();

		},

		//
		showAllCourse() {
			this.searchAllCourse();
			this.getAllStudentCourse();//获取所有已选课程
		},

		/**查询全部课程 */
		async searchAllCourse() {
			let that = this;



			await this.$courseRequest({
				url: "/course/list",
				method: "GET"
			}).then(res => {
				that.course = res.data.data;

				that.showCourse = res.data.data;

			}).catch(err => {
				console.log(err);
			})



		},

		/**选课 */
		selectCourse(code, index, index1, id) {
			let that = this;
			console.log("选课");
			if (this.showCourse1[index].status === 1) {
				uni.showToast({
					title: '你选过了！',
					icon: 'error',
					mask: true
				})
			}
			else {
				//判断课程人数是否满了
				if (this.showCourse1[index].teachingClassesList[index1].selectedNum === this.showCourse1[index].teachingClassesList[index1].capacity) {
					uni.showToast({
						title: '满员了',
						icon: 'error',
						mask: true
					})
				}
				else {
					//后端选课接口
					this.$courseRequest({
						url: "/course/choose-course",
						method: "POST",
						data:
						{
							classId: id,
							studentNumber: that.studentNumber
						}
					}).then(res => {

						if (res.data === true) {
							/**提示选课成功 */
							uni.showToast({
								title: '选课成功！',
								icon: 'success',
								mask: true
							})
							/**选课人数+1 */
							let changeIndex = that.showCourse1.findIndex(item => {
								if (item.course.courseCode === code) {
									return true;
								}
							})

							this.showCourse1[changeIndex].teachingClassesList[index1].selectedNum += 1;
							this.showCourse1[changeIndex].status = 1;
						}
						else {
							uni.showToast({
								title: '选课失败！请检查先修课或是选课时间',
								icon: 'none',
								mask: true
							})
						}

					}).catch(err => {
						console.log(err);
						uni.showToast({
							title: '选课失败！',
							icon: 'fail',
							mask: true
						})
					})
				}
			}


		},

		//根据学院id拿到学院名称
		async getCollegeById(id) {
			let temp = "";

			await this.$courseRequest({
				url: '/college/' + id,
				method: 'GET'
			}).then(res => {
				console.log(res);
				temp = res.data.collegeName;
			})

			return temp;


		},

		//根据专业id拿到专业名称
		async getMajorById(id) {
			let temp = "";

			await this.$courseRequest({
				url: '/major/' + id,
				method: 'GET'
			}).then(res => {
				temp = res.data.majorName;
			});

			return temp;

		},

		//查看你是否选了这门课
		async getAllStudentCourse() {


			let that = this;
			let classIdList = [];

			await this.$courseRequest({
				url: "/learning-lesson",
				method: "GET",
				data: { studentNumber: that.studentNumber }
			}).then(res => {
				classIdList = res.data.data;
			});
			this.showCourse1 = this.showCourse;
			//赋值是否选课
			for (let i = that.showCourse1.length - 1; i >= 0; i--) {
				for (let j = 0; j < classIdList.length; j++) {
					if (that.showCourse1[i] && classIdList[j]) {
						if (that.showCourse1[i].course.courseCode === classIdList[j].courseCode) {
							that.showCourse1[i].status = 1;
							console.log("第" + i + "个课程" + that.showCourse1[i].course.courseCode + "，第" + j + "个选课" + classIdList[j].courseCode);
							break;
						}
						else {
							that.showCourse1[i].status = 0;
							console.log("111第" + i + "个课程" + that.showCourse1[i].course.courseCode + "，第" + j + "个选课" + classIdList[j].courseCode);
						}
					}
				}
			}




		},
		//跳转详情
		ToDetail(code) {
			console.log(code);

			uni.navigateTo({
				url: '/pages/courseDetail/courseDetail?courseCode=' + code,
			})
		},
		ToPopup(index, type) {
			this.type = type;
			this.courseIndex = index;
			this.$refs.popup2.open(type)//从左边弹出
		},
		getStorageNumber() {
			let value = uni.getStorageSync('studentNumber');
			this.studentNumber = value;


		},


		scroll() {

		},


		dropCourse(code, index, index1, id) {
			let that = this;
			console.log("退课");

			//后端退课接口
			this.$courseRequest({
				url: "/course/drop-course",
				method: "POST",
				data:
				{
					classId: id,
					studentNumber: that.studentNumber
				}
			}).then(res => {
				console.log(res);
				//
				let changeIndex = that.showCourse.findIndex(item => {
					if (item.course.courseCode === code) {
						return true;
					}
				})

				this.showCourse[changeIndex].teachingClassesList[index1].selectedNum -= 1;
				this.showCourse[changeIndex].status = 0;

				//提示退课成功
				uni.showToast({
					title: '退课成功!',
					icon: 'success',
					mask: true
				})

			})

		},

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

.exit

/**退课按钮样式 */
	{
	color: #fff;
	margin: 0 5px;
	border-radius: 5px;
	background-color: #075cef;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 0 15rpx;
}


//设置宽度，定义成弹性盒模式，并且不换行。
.scroll-view_H {
	width: 200%;
	display: flex;
	flex-wrap: nowrap;
}

.into_text {
	text-indent: 2em;
}
</style>
