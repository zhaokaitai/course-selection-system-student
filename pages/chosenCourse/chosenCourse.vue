<template>
  <view class="container">
    <!--已选课程列表展示-->
    <view>
      <!--课程详细信息和退课按钮-->
      <uni-table>
        <uni-tr>
          <uni-th width="30" align="center">教学班</uni-th>
          <uni-th width="30" align="center">上课教师</uni-th>
          <uni-th width="30" align="center">上课地点</uni-th>
          <uni-th width="30" align="center">已选/容量</uni-th>
          <uni-th width="30" align="center">操作</uni-th>
        </uni-tr>
        <uni-tr v-for="(item, index) in courseClass" :key="index">
          <uni-td>{{ item.class }}</uni-td>
          <uni-td>{{ item.teacher }}</uni-td>
          <uni-td>{{ item.classroom }}</uni-td>
          <uni-td>{{ item.chosen }}/{{ item.volume }}</uni-td>
          <uni-td><button class="choose" @click=""><text class="button_text">选课</text></button></uni-td>
        </uni-tr>
      </uni-table>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {

    };
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
</style>