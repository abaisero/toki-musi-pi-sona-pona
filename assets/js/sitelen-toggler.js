(() => {
  'use strict'

  document.addEventListener("DOMContentLoaded", function() {
    const checkbox = document.getElementById("sitelenToggler");

    checkbox.addEventListener("change", function() {
      setDocumentSitelen(checkbox.checked);
      setStoredSitelen(checkbox.checked);
    });
  });
})()

