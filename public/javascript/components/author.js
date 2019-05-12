const initAuthor = () => {
  const author = document.querySelector('#author');
  if (author ==null) {
    return
  }
  fetch('https://uinames.com/api/?ext&region=france')
      .then(response => response.json())
      .then((data) => {
        author.innerHTML = `<i class="fas fa-signature"></i> ${data.name} ${data.surname}`;
        author.insertAdjacentHTML('afterEnd', ' - ');
      })
}

export default initAuthor;
