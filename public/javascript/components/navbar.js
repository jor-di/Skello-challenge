const initNavbar = () => {
  const banner = document.querySelector('.banner');
  if (banner == null) {
  const navbar = document.querySelector('.navbar-ch');
  navbar.classList.remove('navbar-absolute');
  navbar.classList.add('navbar-background');
  };
}

export default initNavbar;
