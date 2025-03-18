const price = () => {

const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", function() {
  const price = Number(priceInput.value) 
  const tax = Math.floor(price * 0.1);
  const profit = Math.floor(price - tax);
  
  addTaxDom.innerHTML = `¥${tax}`; 
  profitDom.innerHTML = `¥${profit}`; 
})

};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price)