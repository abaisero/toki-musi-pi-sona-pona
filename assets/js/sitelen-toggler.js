(() => {
  'use strict'

  document.addEventListener("DOMContentLoaded", function() {

    const checkboxes = {
      sitelen: document.getElementById("sitelenToggler"),
      ligatures: document.getElementById("sitelenLigaturesToggler"),
      ligatures_extra: document.getElementById("sitelenLigaturesExtraToggler"),
    }

    function getTPTogglers() {
      return {
        sitelen: checkboxes.sitelen.checked,
        ligatures: checkboxes.ligatures.checked,
        ligatures_extra: checkboxes.ligatures_extra.checked,
      }
    }

    checkboxes.sitelen.addEventListener("change", function() {
      setStoredTPToggler('sitelen', checkboxes.sitelen.checked);
      initializeTogglers(getStoredTPTogglers());
      setDocumentTPScript(convertTPTogglersToTPScript(getTPTogglers()));
    });

    checkboxes.ligatures.addEventListener("change", function() {
      setStoredTPToggler('ligatures', checkboxes.ligatures.checked);
      initializeTogglers(getStoredTPTogglers());
      setDocumentTPScript(convertTPTogglersToTPScript(getTPTogglers()));
    });

    checkboxes.ligatures_extra.addEventListener("change", function() {
      setStoredTPToggler('ligatures-extra', checkboxes.ligatures_extra.checked);
      initializeTogglers(getStoredTPTogglers());
      setDocumentTPScript(convertTPTogglersToTPScript(getTPTogglers()));
    });

  });
})()

