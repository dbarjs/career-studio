<script setup lang="ts">
const career = ref<string>('Web Developer')
</script>

<template>
  <div class="flex">
    <UContainer>
      <UButton>Add {{ career }} element</UButton>
    </UContainer>
  </div>
</template>
