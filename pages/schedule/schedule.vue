<template>
  <view>
    <ly-curriculumtable :weekTableState="true" :weekTableNumber="weekNumbers" :controlWeek="controlWeek"
      :timetableType="timetableType" :timetables="timetables" :startdDate="startdDate" :weekButton="weekButton"
      @nextWeekClick="nextWeekClick" @lastWeekClick="lastWeekClick" @courseClick="courseClick"
      @weekSelectClick="weekSelectClick" @weekOpenClick="weekOpenClick">

    </ly-curriculumtable>
  </view>
</template>
<script>
import Timetable from '../../components/ly-curriculumtable/ly-curriculumtable.vue';

export default {
  components: {
    Timetable
  },
  data() {
    return {
      weekNumbers: 20,//一共显示几周
      controlWeek: 1,//显示的第几周
      weekButton: true,//开启上一周下一周按钮
      startdDate: '', //开始时间  默认为当前时间
      timetables: [
        ['', '', '', '', '', '', '', '', '', '', '', '', ''],
        ['', '', '', '', '', '', '', '', '', '', '', '', ''],
        ['', '', '', '', '', '', '', '', '', '', '', '', ''],
        ['', '', '', '', '', '', '', '', '', '', '', '', ''],
        ['', '', '', '', '', '', '', '', '', '', '', '', ''],
      ],
      timetableType: [
        { index: '1', name: '08:00\n08:40' },
        { index: '2', name: '08:50\n09:30' },
        { index: '3', name: '09:40\n10:20' },
        { index: '4', name: '10:30\n11:15' },
        { index: '5', name: '11:25\n12:10' },
        { index: '6', name: '14:00\n14:40' },
        { index: '7', name: '14:50\n15:30' },
        { index: '8', name: '15:45\n16:20' },
        { index: '9', name: '16:30\n17:15' },
        { index: '10', name: '17:25\n18:10' },
        { index: '11', name: '19:00\n19:40' },
        { index: '12', name: '19:50\n20:30' },
        { index: '13', name: '20:40\n21:25' },],//上课时间表
      courseList: [],//课程列表

      weekData: [//日期
        { index: '1', name: "周一" },
        { index: '2', name: "周二" },
        { index: '3', name: "周三" },
        { index: '4', name: "周四" },
        { index: '5', name: "周五" },
        { index: '6', name: "周六" },
        { index: '7', name: "周日" },
      ],
      studentNumber:""

    }
  },
  onLoad(options) {
    this.getStorageNumber();
    this.getStudentSchedule();

  },
  onShow(options) {
    this.getStorageNumber();
    this.getStudentSchedule();
  },
  methods: {
    courseClick(re) {
      console.log(re)
    },
    nextWeekClick(e) {
      console.log("下一周", e)
    },
    lastWeekClick(e) {
      console.log("上一周", e)
    },
    weekOpenClick() {
      console.log("点击了第几周")
    },
    weekSelectClick(e) {
      console.log("您选择了", e)
    },

    /**获取学生选的课程 */
    getStudentSchedule() {
      this.courseList = [];

      let that = this;

      this.$courseRequest({
        url: "/learning-lesson",
        method: "GET",
        data: { studentNumber: that.studentNumber }
      }).then(res => {
        that.courseList = res.data.data;
        console.log(that.courseList);

        /**将课程时间抽离出来 */
        let courseStartTime = '';//课程开始时间
        let courseEndTime = '';//课程结束时间
        let courseDay = '';//课程日期
        that.courseList.forEach((item, index) => {
          console.log(item.classTime);

          //1.提取课程开始时间和结束时间
          courseStartTime = item.classTime.substring(3, 8);
          courseEndTime = item.classTime.substring(9, 14);
          courseDay = item.classTime.substring(0, 2);

          //2.根据开始时间和结束时间算出是第几节课
          let startNum = that.includeStartTime(courseStartTime);
          let endNum = that.includeEndTime(courseEndTime);
          let dayNum = that.includeWeekData(courseDay);

          let result = endNum - (startNum - 1);

          //3.将课程存入数组中
          that.timetables[dayNum - 1].splice(startNum - 1, result, ...Array(result).fill(item.className));
          console.log(that.timetables);


        });


      }).catch(err => {
        console.log(err);
      })
    },

    //匹配开始上课时间
    includeStartTime(courseStartTime) {
      let num = '';
      this.timetableType.forEach(item => {

        if (item.name.includes(courseStartTime)) {
          num = item.index;
        }

      })
      return num;
    },

    //匹配上课结束时间
    includeEndTime(courseEndTime) {
      let num = '';
      this.timetableType.forEach(item => {

        if (item.name.includes(courseEndTime)) {
          num = item.index;
        }

      })
      return num;
    },

    //匹配上课是周几
    includeWeekData(courseDay) {
      let num = '';
      this.weekData.forEach(item => {
        if (item.name.includes(courseDay)) {
          num = item.index;
        }
      })
      return num;
    },

    toggle(type) {
      console.log(course.name);

      //获取课程名称
    },
    getStorageNumber() {
      let value = uni.getStorageSync('studentNumber');
      this.studentNumber = value;
    }


  },
}
</script>
<style lang="scss"></style>