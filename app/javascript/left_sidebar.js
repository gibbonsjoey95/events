// document.addEventListener('DOMContentLoaded', function() {
//   const toggleButton = document.getElementById('toggleEvents');
//   const userEvents = document.getElementById('userEvents');

//   toggleButton.addEventListener('click', function() {
//     userEvents.style.display = userEvents.style.display === 'none' ? 'block' : 'none';
//     toggleButton.classList.toggle('active');
//   });
// });

const toggleButton = document.getElementById('toggleEvents');
const userEvents = document.getElementById('userEvents');

toggleButton.addEventListener('click', function() {
  userEvents.style.display = userEvents.style.display === 'none' ? 'block' : 'none';
  toggleButton.classList.toggle('active');
});







