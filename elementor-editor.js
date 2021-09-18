/*
Snippet to check what event triggered in the Elementor editor panel
*/
elementor.on("all", function(e) { console.log(e); });
