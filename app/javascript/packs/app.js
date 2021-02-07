// let’s enable Bootstrap tooltips and popovers (if any exist on this page)

import {Tooltip, Popover} from 'bootstrap'

function enableBootstrapFeatures() {
    const tooltips = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    const popovers = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));

    console.log(`Bootstrap init: tooltips found: ${tooltips.length}, popovers found: ${popovers.length}`);

    tooltips.map(t => new Tooltip(t));
    popovers.map(p => new Popover(p));
}

document.addEventListener("turbolinks:load", enableBootstrapFeatures);