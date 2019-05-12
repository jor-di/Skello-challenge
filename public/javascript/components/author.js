const initAuthor = () => {
  const author = document.querySelector('#author');
  if (author ==null) {
    return
  }
  fetch('https://uinames.com/api/?ext&region=france')
      .then(response => response.json())
      .then((data) => {
        author.innerHTML = `${data.name} ${data.surname}`;
      })
}

export default initAuthor;
