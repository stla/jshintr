HTMLWidgets.widget({
  name: "jshintr",

  type: "output",

  factory: function (el, width, height) {
    // TODO: define shared variables for this instance
    const headers = [
      "line",
      "character",
      "evidence",
      "reason",
      "raw",
      "code",
      "scope",
      "id"
    ];
    function fillTable(errs) {
      const tbl = document.getElementById("jshintr-tblBody");
      for (let i = 0; i < errs.length; i++) {
        const tr = tbl.insertRow();
        const err = errs[i];
        for (const e of headers) {
          const td = tr.insertCell();
          if (e === "evidence") {
            const code = document.createElement("code");
            td.appendChild(code);
            code.appendChild(document.createTextNode(err[e].trimLeft()));
          } else {
            td.setAttribute("class", "jshintr-center");
            td.appendChild(document.createTextNode(err[e]));
          }
          //td.style.border = "1px solid black";
        }
      }
    }

    return {
      renderValue: function (x) {
        // TODO: code to render the widget, e.g.
        JSHINT(x.source, { esversion: 6 });
        let errs = JSHINT.errors;
        fillTable(errs);
        document.body.addEventListener("change", function (e) {
          let target = e.target;
          if (target.name === "jshintr-radio") {
            document.getElementById("jshintr-tblBody").innerHTML = "";
            JSHINT(x.source, { esversion: target.value });
            let errs = JSHINT.errors;
            fillTable(errs);
          }
        });
      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});
