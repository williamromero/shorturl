document.addEventListener("turbolinks:load", () => {
  const originalURL = document.querySelector('#link_original_url');
  let html = document.querySelector(".links-list");
  let shareBTN = [];
  let urlValue = "";

  originalURL.addEventListener("keypress", (e) => {
    e.preventDefault();
    if (e.target.value.length > 0) {
      urlValue = e.keyCode === 13 && e.target.value;
      let options = {
        headers: { "Content-Type": "application/json", },
        method: "POST",
        body: JSON.stringify({ original_url: urlValue, }),
      };
      fetch(e.target.parentElement.action, options)
        .then(function (response) { return response.json() })
        .then(function (data) {
          originalURL.value = "";
          html.innerHTML += `
            <div class="links">
              <div class="long-url">
                <i class="fas fa-share-alt-square tooltip" id="shareIcon" data-url="http://${location.host}/${data.link.slug}"></i>
                <a href="http://${location.host}/${data.link.slug}/info">${data.link.original_url}</a>
              </div>
              <div class="tiny-url"> <a href="/${data.link.slug}">http://${location.host}/${data.link.slug}</a> </div>            
            </div>
          `;
          setShareBTNS();
        });
      }
  });

  const shareBtnsListener = (shares) => {
    shares.forEach((elm) => {
      elm.addEventListener("click", async (e) => {
        await navigator.clipboard.writeText(e.target.dataset.url);
        alert('The shorturl is copied to clipboard.');
        // console.log(await navigator.clipboard.readText());
      });
    });
  }  

  const setShareBTNS = () => {
    shareBTN = Array.prototype.slice.call(document.querySelectorAll("#shareIcon"));
    shareBtnsListener(shareBTN);
  };

  originalURL && setShareBTNS();  

});
