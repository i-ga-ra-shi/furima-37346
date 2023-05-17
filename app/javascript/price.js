function price() {
    const ItemPrice = document.getElementById("item-price");
    ItemPrice.addEventListener('keyup', () => {
        const AddTaxPrice = document.getElementById("add-tax-price");
        const Profit = document.getElementById("profit");
        const TaxNum = Math.floor(ItemPrice.value * 0.1).toLocaleString();
        const ProfitNum = (parseInt(ItemPrice.value) - parseInt(TaxNum)).toLocaleString();
        AddTaxPrice.innerHTML = `${TaxNum}`;
        Profit.innerHTML = `${ProfitNum}`;
    })
}


window.addEventListener("load", price)