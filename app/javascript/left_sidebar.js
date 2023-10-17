document.addEventListener('DOMContentLoaded', function() {
    const toggleButton = document.getElementById('toggleEvents');
    const userEvents = document.getElementById('userEvents');
  
    toggleButton.addEventListener('click', function() {
      if (userEvents.style.display === 'none' || userEvents.style.display === '') {
        userEvents.style.display = 'block';
      } else {
        userEvents.style.display = 'none';
      }
    });
  });