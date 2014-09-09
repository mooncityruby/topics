/**
 * JQuery has an interesting approach to nil (or null).
 * In many cases in other languages, execution branches due to the
 * presence or absence of a value.
 */

if(outputAdapter) {
    outputAdapter.call(output);
} else {
    // NOOP
}

/**
 * But in JQuery, you nearly always interact with collections. Why?
 * 
 * Because whether you have a collection of 0, or 1, or 24, you always
 * know you have a collection, which can be operated iteratively.
 */

$.each( $('.some-class'), function(index, domElement) {
    console.log("This can be run 0 or more times!");
});
