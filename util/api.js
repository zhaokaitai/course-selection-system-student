//封装后端接口
import { courseRequest } from "./request";

//学号登陆
export const handleLogin = (params) =>{
    return courseRequest({
        url:'/student/login',
        method:'POST',
        data:params
    })
}
