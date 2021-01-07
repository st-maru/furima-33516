window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;

      // 販売手数料の表示
      const addTaxDom = document.getElementById("add-tax-price");
      const TaxPrice = Math.floor(inputValue * 0.1)
      addTaxDom.innerHTML = TaxPrice.toLocaleString()

      // 販売利益の表示
      const addProfitDom = document.getElementById("profit");
      const ProfitPrice = inputValue - TaxPrice
      addProfitDom.innerHTML = ProfitPrice.toLocaleString()
  })
});
