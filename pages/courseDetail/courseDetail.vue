<template>
  <view>
    <!--展示介绍图片-->
    <view class="image_box">
      <image src="https://zhoukaiwen.com/img/loginImg/head.png" mode="scaleToFill" class="image_size" />
      <view class="name_box">
        <view>{{ course.name }}</view>
      </view>
    </view>
    <!--展示教学班-->
    <scroll-view scroll-x="true" @scroll="scroll" style="width: 100%;overflow: hidden;white-space: nowrap;">
      <view class="scroll-view_H">
        <uni-table>
          <uni-tr>
            <uni-th width="30" align="center">教学班</uni-th>
            <uni-th width="30" align="center">上课时间</uni-th>
            <uni-th width="30" align="center">上课地点</uni-th>
            <uni-th width="30" align="center">已选/容量</uni-th>
            <uni-th width="30" align="center">操作</uni-th>
            <uni-th width="30" align="center">查看详情</uni-th>
          </uni-tr>
          <uni-tr v-for="(item1, index1) in item.teachingClassesList" :key="index1">
            <uni-td>{{ item1.className }}</uni-td>
            <uni-td>{{ item1.classTime }}</uni-td>
            <uni-td>{{ item1.classroom }}</uni-td>
            <uni-td>{{ item1.selectedNum }}/{{ item1.capacity }}</uni-td>
            <uni-td>
              <button class="choose" @click="selectCourse(item.course.courseCode, index, index1, item1.id)"><text
                  class="button_text">选课</text></button>
            </uni-td>
            <uni-td>
              <button class="choose" @click="ToDetail(item.course.courseCode)"><text
                  class="button_text">查看详情</text></button>
            </uni-td>


          </uni-tr>
        </uni-table>
      </view>
    </scroll-view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      course: {},//课程详情
      courseCode: "",//课程代码
      teachingList: [],//教学班
      idOption: 0,//是否已选
    };
  },

  onLoad(options) {
    this.courseCode = options.courseCode;
    this.getCourseByCode();
  },
  methods:
  {

    getCourseByCode() {
      let that = this;

      this.$courseRequest({
        url: '/course/' + that.courseCode,
        method: "GET",
      }).then(res => {
        console.log(res.data.data.course);
        that.course = res.data.data.course;
        that.teachingList = res.data.data.teachingClassesList
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.image_box {
  width: 100%;
  margin: 15rpx 0;
  background-color: white;
  height: 650rpx;
  -webkit-box-shadow: 2px 2px 10px rgb(230, 234, 239);
}

.image_size {
  width: 100%;
}

.name_box {
  margin-top: 10rpx;
  font-size: 24px;
  font-weight: bolder;
}

.text_box {

  background-color: white;
  margin-bottom: 40rpx;
  padding: 20rpx 15rpx;
  -webkit-box-shadow: 2px 2px 10px rgb(227, 231, 235);
}

.text_size {
  font-size: 18px;
}

.bottom {
  -webkit-box-shadow: 2px 2px 10px rgb(227, 231, 235);
  width: 100%;
  position: fixed;
  left: 1rpx;
  right: 10rpx;
  bottom: calc(var(--window-bottom) + 20px);
  z-index: 1030;
  margin-bottom: 10rpx;

}

.button_box {
  font-size: 28rpx;
  background: #2796f2;
  color: #fff;
  height: 90rpx;
  line-height: 90rpx;
  border-radius: 50rpx;
  font-weight: bold;
}

.mb-10 {
  margin-bottom: 10px;
}
</style>