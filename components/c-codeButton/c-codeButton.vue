<template>
  <view class="yanzhengcode" @click="getPhoneCode()" :disabled="BtnSms">{{smsTip}}</view>
</template>

<script>
export default {
  name:"cButton",
  props: {
    phoneNum: {
      type: String,
      default: ""
    },
    type: {
      type: Number,
      default: 1
    },
    isCheck: {
      type: Boolean,
      default: false
    },
    isNew: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      smsTip: "发送验证码",
      count: 60, //当前倒计时
      BtnSms: false, //控制验证码按钮是否可用
      timer: "", //定时器名称
    };
  },
  methods: {
    //获取手机验证码
    getPhoneCode() 
    {
      if (!/^1[3456789]\d{9}$/.test(this.phoneNum)) 
      {
        uni.showToast({
          title: '请检查手机号是否填写正确!',
          icon: 'none'
        })
      }
      else
      {
          this.getSmsCode();
      }
    },

    //发送验证码
    getSmsCode()
    {
      //占位
      console.log("调用了发送验证码函数");
      this.countDownTimer();
    },

    //验证码计数
    countDownTimer()
    {
      this.BtnSms = true;
      this.smsTip = this.count + "秒后重新获取";
      this.timer = setInterval(() =>{
        this.count -= 1;
        if(this.count>0)
        {
          this.smsTip = this.count + "秒后重新获取";
        }
        else
        {
          this.BtnSms = false;
          this.smsTip = "获取验证码";
          this.count = 60;
          clearInterval(this.timer);
        }
      },1000);
    }


  }
}
</script>

<style lang="scss" scoped>
.yanzhengcode {
  width: 98px;
  height: 32px;
  border-radius: 4px;
  background-color: #075cef;
  color: #fff;
  position: absolute;
  border: 0;
  right: 4px;
  top: 22px;
  text-align: center;
  text-decoration: none;
  line-height: 24px;
  font-size: 13px;
  z-index: 3
}

.el-table {
  padding: 0;
}

</style>