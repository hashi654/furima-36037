function input (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () =>{
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = parseInt(inputValue / 10)
    const totalProfit = document.getElementById("profit")
    totalProfit.innerHTML = parseInt(inputValue - (inputValue / 10))
  });
};

window.addEventListener('load', input)