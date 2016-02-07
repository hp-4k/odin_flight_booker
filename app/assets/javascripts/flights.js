$(function() {
  if (document.getElementById("passengers_dropdown")) {
    document.getElementById("passengers_dropdown").onchange = function() {
      if (document.getElementById("passengers_hidden")) {
        document.getElementById("passengers_hidden").value = this.value;
      }
    };
}
});