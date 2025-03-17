const price = () => {

const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", function() {
  const price = Number(priceInput.value) 
  const tax = price * 0.1;
  const taxRounded = Math.floor(tax);
  const profit = price - taxRounded;
  
  addTaxDom.innerHTML = `¥${taxRounded}`; 
  profitDom.innerHTML = `¥${profit}`; 
})

};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price)