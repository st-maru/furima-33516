function pullDown() {

  const pullDownButton = document.getElementById("category")
  const pullDownParents = document.getElementById("pull-down")
  const pullDownChild = document.querySelectorAll(".pull-down-list")
  const pullDownString = document.getElementById("category-link")

  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })

  pullDownChild.forEach(function(list) {
    list.addEventListener('mouseover', function(){
      this.setAttribute("style", "background-color:#00BFFF")
    })
    list.addEventListener('mouseout', function(){
      this.removeAttribute("style", "background-color:#00BFFF;")
    })
  })

} window.addEventListener('load', pullDown)