var logos = 33;
var $d = document;
var $logo = $d.querySelector('.js-logo');
var logoHeight = 333;
var position = 1;

function randomLogoPosition () {
    return Math.floor(Math.random() * logos);
}

function setLogo () {
    $logo.style['background-position'] = `0 ${(randomLogoPosition() * -logoHeight) + 50}px`;
}

setLogo();

document.addEventListener('click', setLogo);
