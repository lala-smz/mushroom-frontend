<template>
  <div class="not-found">
    <h1>404</h1>
    <h2>页面不存在</h2>
    <p>您访问的页面不存在或已被删除</p>
    <router-link to="/" class="btn">返回首页</router-link>
  </div>
</template>

<script setup>
// NotFound组件
</script>

<style scoped>
.not-found {
  text-align: center;
  padding: 100px 20px;
}

h1 {
  font-size: 100px;
  color: #4CAF50;
  margin-bottom: 20px;
}

h2 {
  color: #333;
  margin-bottom: 20px;
}

p {
  color: #666;
  margin-bottom: 40px;
  font-size: 18px;
}

.btn {
  padding: 10px 20px;
  background-color: #4CAF50;
  color: white;
  text-decoration: none;
  border-radius: 5px;
  font-weight: bold;
  transition: background-color 0.3s;
}

.btn:hover {
  background-color: #45a049;
}
</style>