<template>
  <view class="container">
    <!--已选课程列表展示-->
    <view>
      <!--课程详细信息和退课按钮-->
      <uni-table>
        <uni-tr>
          <uni-th width="30" align="center">教学班</uni-th>
          <uni-th width="30" align="center">上课地点</uni-th>
          <uni-th width="30" align="center">已选/容量</uni-th>
          <uni-th width="30" align="center">操作</uni-th>
        </uni-tr>
        <uni-tr v-for="(item, index) in courseList" :key="index">
          <uni-td>{{ item.className }}</uni-td>
          <uni-td>{{ item.classroom }}</uni-td>
          <uni-td>{{ item.selectedNum }}/{{ item.capacity }}</uni-td>
          <uni-td>
              <button class="exit" @click="dropCourse(item.classId)" type="warn"><text
                  class="button_text">退课</text></button>
            
            
          </uni-td>
        </uni-tr>
      </uni-table>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      courseList: [],//已选课程列表
      studentNumber: ""//学号
    };
  },
  onLoad(options) {
    //接收存储的登陆数据
    this.getStorageNumber();

    this.getStudentSchedule();
  },
  onShow() {
    //接收存储的登陆数据
    this.getStorageNumber();

    this.getStudentSchedule();
  },
  computed: {
    //计算教师名称
    computedTeacherName() {
      return async (id) => {
        let name = await this.getTeacherId(id);
        return name;
      }
    }
  },
  methods: {
    /**获取所有已选择的课程
     * 
     */
    getStudentSchedule() {

      let that = this;
      console.log(that.studentNumber);
      this.$courseRequest({
        url: "/learning-lesson",
        method: "GET",
        data: { studentNumber: that.studentNumber }
      }).then(res => {
        that.courseList = res.data.data;
      }).catch(err => {
        console.log(err);
      })
    },

    /**退课 */
    dropCourse(id) {
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
        //从列表中删除该课程
        let dropIndex = that.courseList.findIndex(item => {
          if (item.id === id) {
            return true;
          }
        });
        that.courseList.splice(dropIndex, 1);

        //提示退课成功
        uni.showToast({
          title: '退课成功!',
          icon: 'success',
          mask: true
        })

      })

    },

    //获取teacher名称
    async getTeacherId(id) {

      let name = "11"

      await this.$courseRequest({
        url: "/teacher/" + id,
        method: "GET",
      }).then(res => {
        name = res.data.teacherName;
      });
      return name;

    },

    getStorageNumber()
    {
      let value = uni.getStorageSync('studentNumber');
      this.studentNumber = value;
    }



  }
}
</script>

<style lang="scss">
.container {
  height: 100%;
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
  margin-left: 15rpx;
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

.button_text

/**按钮字体 */
  {
  color: #fff;
  font-size: 12px;
}

.forbidden {
  color: black;
  margin: 0 5px;
  border-radius: 5px;
  background-color: gray;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0 15rpx;
}
</style>