// let’s enable Bootstrap tooltips and popovers (if any exist on this page)

import {Tooltip, Popover} from 'bootstrap'

document.addEventListener("turbolinks:load", () => {
    console.log('Enabling Bootstrap tooltips and popovers…');

    const tooltips = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    const popovers = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));

    console.log(`Tooltips found: ${tooltips.length}, Popovers found: ${popovers.length}`);

    tooltips.map(t => new Tooltip(t));
    popovers.map(p => new Popover(p));
});

// console.log('setting up tooltips…')
//
// const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
//
// console.log('')
//
// const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
//     return new bootstrap.Tooltip(tooltipTriggerEl)
// });