const initComments = () => {
  const comments = document.querySelectorAll('.card-comment');
  if (comments == null) {
    return
  }

  comments.forEach((comment) => {
    fetch('https://uinames.com/api/?ext&region=france')
      .then(response => response.json())
      .then((data) => {
        comment.insertAdjacentHTML('afterBegin', `<img src='${data.photo}' class="avatar-large"/>`);
        comment.querySelector('.card-comment-content')
        .insertAdjacentHTML('afterBegin', `<p><small>${data.name}</small></p>`);
      })
  });
}

export default initComments;
