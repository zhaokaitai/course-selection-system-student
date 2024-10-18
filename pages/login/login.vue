<template>
  <!--主体-->
  <view style="height:100vh;background: #fff;">
    <!--抬头标题-->
    <view class="img-a">
      <view class="t-b">
        您好，
        <br />
        欢迎使用，选课系统
      </view>
    </view>

    <!--登录-->
    <view class="login-view">
      <!--登录方式-->
      <view class="head-nav">
        <view :class="['inv-h', navIndex == 0 ? 'inv-h-se' : '']" @click="checkIndex(0)">账号密码登录</view>
        <view :class="['inv-h', navIndex == 1 ? 'inv-h-se' : '']" @click="checkIndex(1)">验证码登录</view>
      </view>
      <!--登录主体-->
      <view class="t-login">
        <!--账号密码-->
        <form class="cl" v-if="navIndex == 0">
          <view class="t-a">
            <text class="txt">学号</text>
            <input name="studentNumber" placeholder="请输入您的学号" maxlength="12" v-model="studentNumber" />
          </view>

          <view class="t-a">
            <text class="txt">密码</text>
            <input type="password" name="password" maxlength="18" placeholder="请输入您的密码" v-model="password" />
          </view>
          <view @click="ToRepassword()"><text class="passwordTxt">忘记密码?</text></view>
          <button @click="handleLogin()">登 录</button>
        </form>
        <!--验证码-->
        <form class="c1" v-if="navIndex == 1">
          <view class="t-a">
            <text class="txt">手机号</text>
            <input name="phone" placeholder="请输入您的手机号" maxlength="11" v-model="phone" />
          </view>

          <view class="t-a">
            <text class="txt">验证码</text>
            <view class="flex-code">
              <input name="code" placeholder="请输入您的验证码" v-model="code" class="input-code" />
              <c-codeButton :phoneNum="phone"></c-codeButton>
            </view>
          </view>

          <button @click="codeLogin()">登 录</button>

        </form>

      </view>
    </view>

  </view>
</template>

<script>
import CCodeButton from '../../components/c-codeButton/c-codeButton.vue';

export default {
  components: {
    CCodeButton
  },
  data() {
    return {
      studentNumber: "", //学号
      password: "", //密码
      phone: "", //手机号
      code: "", //验证码
      navIndex: 0, //选择的tab项
      tips: "发送验证码" //按钮标识
    };
  },
  methods: {
    //切换tab项
    checkIndex(index) {
      console.log(index);
      this.navIndex = index;
    },

    //账号密码登录
    handleLogin() {

      //账号密码
      let studentNumber = this.studentNumber;
      let studentPassword = this.password;
      console.log(studentNumber.length);
      //校验学号是否为12位
      if (studentNumber.length !== 12) {
        uni.showToast({
          title: '学号错误！',
          icon: 'error',
          mask: true
        })
      }
      else {
        //请求后端
        this.$courseRequest({
          url: "/student/login",
          method: 'POST',
          data: {
            studentNumber: studentNumber,
            studentPassword: studentPassword
          }
        }).then(res => {
          console.log(res);

          //校验错误
          if (res.data.data !== null) {
            //存储登录信息
            uni.setStorage({
              key: 'studentNumber',
              data: studentNumber,
              success: (result) => { },
              fail: (error) => { }
            });
            uni.setStorage({
              key:'userName',
              data:res.data.data.userName,
            });
            uni.setStorage({
              key:'phone',
              data:res.data.data.phone
            })

            //跳转主页
            uni.switchTab({
              url: '/pages/index/index',
            })

          } else {
            uni.showToast({
              title: '账号或密码错误！',
              icon: 'error',
              mask: true
            })
          }
        }).catch(err => {
          console.log(err);
        })
      }





    },

    //验证码发送
    sendcode() {
      console.log("发送验证码");
    },

    //验证码登录
    codeLogin() {
      console.log("验证码登录");

      let phone = this.phone;
      let smsCode = this.code;

      this.$courseRequest({
        url: '/student/loginByPhone',
        method: 'POST',
        data:
        {
          phone: phone,
          smsCode: smsCode
        }
      }).then(res => {
        console.log(res);
        let studentNumber = that.getStudentNumberByPhone(phone);
        //存储登录信息
        uni.setStorage({
          key: 'studentNumber',
          data: studentNumber,
          success: (result) => { },
          fail: (error) => { }
        });
        //跳转主页
        uni.switchTab({
          url: '/pages/index/index',
        })
      })

    },

    //根据电话获取学号
    async getStudentNumberByPhone(phone) {
      let studentNumber = "";

      await this.$courseRequest({
        url: '/student/' + phone,
        method: 'GET'
      }).then(res => {
        console.log(res);
      })

      return studentNumber;
    },


    ToRepassword()
    {
      uni.navigateTo({
        url:'/pages/rePassword/rePassword',
      })
    }

  }
};
</script>

<style lang="scss">
.img-a {
  width: 100%;
  height: 450rpx;
  background-image: url(https://zhoukaiwen.com/img/loginImg/head.png);
  background-size: 100%;
}

.t-b {
  text-align: left;
  font-size: 42rpx;
  color: #ffffff;
  padding: 130rpx 0 0 70rpx;
  font-weight: bold;
  line-height: 70rpx;
}

.login-view {
  width: 100%;
  position: relative;
  margin-top: -120rpx;
  background-color: #ffffff;
  border-radius: 8% 8% 0% 0;
}

.head-nav {
  margin: 20rpx auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: #CCCCCC;
}

.inv-h {
  font-size: 30upx;
  flex: 1;
  text-align: center;
  height: 100upx;
  line-height: 100upx;
}

.inv-h-se {
  color: #075cef;
  font-weight: bold;
  border-bottom: 6rpx solid #075cef;
}

.t-login {
  width: 600rpx;
  margin: 0 auto;
  font-size: 28rpx;
  padding-top: 80rpx;
}

.cl {
  zoom: 1;
}

.cl:after {
  clear: both;
  display: block;
  visibility: hidden;
  height: 0;
  content: '\20';
}

.txt {
  font-size: 32rpx;
  font-weight: bold;
  color: #333333;
}

.t-login button {
  font-size: 28rpx;
  background: #2796f2;
  color: #fff;
  height: 90rpx;
  line-height: 90rpx;
  border-radius: 50rpx;
  font-weight: bold;
}

.t-login input {
  height: 90rpx;
  line-height: 90rpx;
  margin-bottom: 50rpx;
  border-bottom: 1px solid #e9e9e9;
  font-size: 28rpx;
}

.t-login .t-a {
  position: relative;
}
.passwordTxt
{
  color:#075cef;
  font-size:18px;
}
</style>