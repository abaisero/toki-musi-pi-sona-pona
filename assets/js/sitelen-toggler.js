(() => {
  'use strict'

  document.addEventListener("DOMContentLoaded", function() {

    const checkboxes = {
      indent: document.getElementById("indent"),
      sitelen: document.getElementById("sitelen-checkbox"),
      sitelen_linja: document.getElementById("sitelen-linja-checkbox"),
      sitelen_kulupu: document.getElementById("sitelen-kulupu-checkbox"),
    }

    function getTPCheckboxesBools() {
      return {
        indent: checkboxes.indent.checked,
        sitelen: checkboxes.sitelen.checked,
        sitelen_linja: checkboxes.sitelen_linja.checked,
        sitelen_kulupu: checkboxes.sitelen_kulupu.checked,
      }
    }

    checkboxes.indent.addEventListener("change", function() {
      setStoredTPBool('indent', checkboxes.indent.checked);
      setDocumentTPAttribute('indent', checkboxes.indent.checked);
    });

    checkboxes.sitelen.addEventListener("change", function() {
      setStoredTPBool('sitelen', checkboxes.sitelen.checked);
      setDocumentTPAttribute('sitelen', checkboxes.sitelen.checked);
      updateCheckboxes(getTPCheckboxesBools());
    });

    checkboxes.sitelen_linja.addEventListener("change", function() {
      setStoredTPBool('sitelen-linja', checkboxes.sitelen_linja.checked);
      setDocumentTPAttribute('sitelen-linja', checkboxes.sitelen_linja.checked);
    });

    checkboxes.sitelen_kulupu.addEventListener("change", function() {
      setStoredTPBool('sitelen-kulupu', checkboxes.sitelen_kulupu.checked);
      setDocumentTPAttribute('sitelen-kulupu', checkboxes.sitelen_kulupu.checked);
    });

  });
})()

