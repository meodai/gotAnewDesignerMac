const logos = 33;
const $d = document;
const $logo = $d.querySelector('.js-logo');
const logoHeight = 333;
let position = 1;

setInterval(() => {
    if (position < logos) {
        position++;
    } else {
        position = 1;
    }
    console.log(`0 ${(position - 1) * -logoHeight}px`)
    $logo.style['background-position'] = `0 ${((position - 1) * -logoHeight) + 50}px`
},2000);
