<template>
  <div class="home">
    <h1>欢迎来到菌类网二代</h1>
    <p>这是一个基于Vue3和Node.js的线上菌类产品交易平台</p>
    <div class="actions">
      <router-link to="/login" class="btn">登录</router-link>
      <router-link to="/register" class="btn">注册</router-link>
    </div>
  </div>
</template>

<script setup>
// Home组件
</script>

<style scoped>
.home {
  text-align: center;
  padding: 100px 20px;
}

h1 {
  color: #333;
  margin-bottom: 20px;
}

p {
  color: #666;
  margin-bottom: 40px;
  font-size: 18px;
}

.actions {
  display: flex;
  justify-content: center;
  gap: 20px;
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