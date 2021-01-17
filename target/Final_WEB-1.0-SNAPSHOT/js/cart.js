$('.input-counter input').change( function() {
  updateQuantity(this);
});
function numberWithCommas(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    return parts.join(".");
}
function add_to_cart(pid, pname, price)
{
    let cart = localStorage.getItem("cart");
    if(cart==null)
    {
        //no cart yet
        let products= [];
        let product={
           productId:pid,
           productName:pname,
           productQuantity:1,
           productPrice:price
        }
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        console.log("Product is added for the first time")
    }
    else{
        //cart is already present
        let pcart=JSON.parse(cart);
        
        let oldProduct=pcart.find((item)=> item.productId== pid)
        if(oldProduct)
        {
            //we have to increase the quantity
            oldProduct.productQuantity=oldProduct.productQuantity+1
            pcart.map((item)=>{
                if(item.productId == oldProduct.productId)
                {
                    item.productQuantity == oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart",JSON.stringify(pcart));
            console.log("Product quantity is increased")
        }else
        {
            //we have add the product
            let product={
                productId:pid,
                productName:pname,
                productQuantity:1,
                productPrice:price
            }
            pcart.push(product)
            localStorage.setItem("cart",JSON.stringify(pcart));
            console.log("Product is added")
        }
    }
 updateIconCart()
}


//update cart
function updateIconCart()
{
    let cartString=localStorage.getItem("cart");
    let cart=JSON.parse(cartString)
    if(cart==null || cart.length==0)
    {
        console.log("Cart is empty!!")
        $(".cart-items").html("0");
        var a = document.getElementById('view-cart'); //or grab it by tagname etc
        a.href = "cartempty.jsp"
         $(".checkout-btn").addClass('disabled');

    }
    else
    {
        $(".cart-items").html(`${cart.length}`);
        var a = document.getElementById('view-cart'); //or grab it by tagname etc
        a.href = "cart.jsp"
        var totalPrice=0;
        let table = `
            <table class="table-p">
            <tbody>
              <tr class="header-table">
                <td class="header-item">Item</td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Total price</td>
                    <td>Action</td>
                </tr>



            </tbody>
`;
        
        cart.map((item)=>{
    table+=`                                            
                    <!--====== Row ======-->
        <tr>
                        <td>
                <div class="table-p__box">
                    <div class="table-p__img-wrap">

                        <img class="u-img-fluid" src="images/product/electronic/product3.jpg" alt=""></div>
                    <div class="table-p__info">

                        <span class="table-p__name">

                            <a href="">${item.productName}</a></span>

                        <span class="table-p__category">

                            <a href="shop-side-version-2.html">Electronics</a></span>
                    </div>
                </div>
            </td>
            <td>

                <span class="prduct-price-cart table-p__price">${numberWithCommas(item.productPrice)}&#8363</span></td>
            <td>
                <div class="table-p__input-counter-wrap">

                    <!--====== Input Counter ======-->
                    <div class="input-counter">

                        <input id="myNumber" class="input-counter__text input-counter--text-primary-style" type="number" value="${item.productQuantity}" data-min="1" data-max="1000">

                    <!--====== End - Input Counter ======-->
                </div>
            </td>
            <td>

            <span class="table-p__price total-line-price">${numberWithCommas(item.productQuantity*item.productPrice)}&#8363</span></td>
            <td>
                <div class="table-p__del-wrap">

                    <a onclick="deleteItemFromcart(${item.productId})" class="far fa-trash-alt table-p__delete-link" href=""></a></div>
            </td>
        </tr>
        <!--====== End - Row ======-->
`
            totalPrice+=item.productPrice*item.productQuantity
            
            
            
            
            
        })
        console.log(numberWithCommas(totalPrice))
        table=table+`</table>`
        
         $(".table-responsive").html(table);
         
         cart.map((item)=>{
             table_total=`
             <tr>
                <td>GRAND TOTAL</td>
                <td>${numberWithCommas(totalPrice)}&#8363</td>
            </tr>
 `
         })
         $(".grand-total").html(table_total);
         $(".checkout-btn").removeClass('disabled');
    }
}

function deleteItemFromcart(pid)
{
    let cart= JSON.parse(localStorage.getItem('cart'));
    let newcart=cart.filter((item)=>item.productId != pid)
    
    localStorage.setItem('cart',JSON.stringify(newcart))
    
    updateIconCart();
}

function updateQuantity(quantityInput)
{
    console.log('test')
  /* Calculate line price */
  var productRow = $(quantityInput).parent().parent();
  var price = parseFloat(productRow.children('.prduct-price-cart').text());
  console.log(price)
  var quantity = $(quantityInput).val();
  console.log(quantity)
  var linePrice = price * quantity;
  
  /* Update line price display and recalc cart totals */
  productRow.children('.total-line-price').each(function () {
    $(this).fadeOut(fadeTime, function() {
      $(this).text(linePrice.toFixed(2));
      recalculateCart();
      $(this).fadeIn(fadeTime);
    });
  });  
}


updateIconCart()