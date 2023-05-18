function price() {
    const ItemPrice = document.getElementById("item-price");
    ItemPrice.addEventListener('keyup', () => {
        const AddTaxPrice = document.getElementById("add-tax-price");
        const Profit = document.getElementById("profit");
        const PriceNum = parseFloat(ItemPrice.value);
        const TaxNum = Math.floor(PriceNum * 0.1);
        const ProfitNum = PriceNum - TaxNum;
        
        if (ItemPrice.value === "") {
            AddTaxPrice.innerHTML = "";
            Profit.innerHTML = "";
        }
        if (/^[0-9]+$/.test(ItemPrice.value)) {
            AddTaxPrice.innerHTML = `${TaxNum.toLocaleString()}`;
            Profit.innerHTML = `${ProfitNum.toLocaleString()}`;
        } else {
            AddTaxPrice.innerHTML = "";
            Profit.innerHTML = "";            
        }
    })
}
window.addEventListener("load", price)