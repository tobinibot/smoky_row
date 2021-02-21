import autoComplete from '@tarekraafat/autocomplete.js'

document.addEventListener("turbolinks:load", enableAutoCompletes);

function enableAutoCompletes() {
    if (document.getElementById('new-donation')) {
        console.log('Initializing donor autocomplete');

        new autoComplete({
            data: {                              // Data src [Array, Function, Async] | (REQUIRED)
                src: [
                    {name: "Tobin", id: 1},
                    {name: "Joel", id: 2},
                    {name: "Daniel", id: 3},
                    {name: "Reid", id: 4},
                    {name: "Hannah", id: 5},
                    {name: "Holly", id: 6}
                ],
                key: ["name"],
                cache: false
            },
            placeHolder: "Food & Drinks...",     // Place Holder text                 | (Optional)
            selector: "#donor-auto-complete",           // Input field selector              | (Optional)
            observer: true,                      // Input field observer | (Optional)
            threshold: 3,                        // Min. Chars length to start Engine | (Optional)
            debounce: 300,                       // Post duration for engine to start | (Optional)
            searchEngine: "strict",              // Search Engine type/mode           | (Optional)
            resultsList: {                       // Rendered results list object      | (Optional)
                container: source => {
                    source.setAttribute("id", "food_list");
                },
                destination: "#donor-auto-complete",
                position: "afterend",
                element: "ul"
            },
            maxResults: 5,                         // Max. number of rendered results | (Optional)
            highlight: true,                       // Highlight matching results      | (Optional)
            resultItem: {                          // Rendered result item            | (Optional)
                content: (data, source) => {
                    source.innerHTML = data.match;
                },
                element: "li"
            },
            noResults: (dataFeedback, generateList) => {
                // Generate autoComplete List
                generateList(autoCompleteJS, dataFeedback, dataFeedback.results);
                // No Results List Item
                const result = document.createElement("li");
                result.setAttribute("class", "no_result");
                result.setAttribute("tabindex", "1");
                result.innerHTML = `<span style="display: flex; align-items: center; font-weight: 100; color: rgba(0,0,0,.2);">Found No Results for "${dataFeedback.query}"</span>`;
                document.querySelector(`#${autoCompleteJS.resultsList.idName}`).appendChild(result);
            },
            onSelection: feedback => {             // Action script onSelection event | (Optional)
                console.log(feedback.selection);
            }
        })
    }
}

