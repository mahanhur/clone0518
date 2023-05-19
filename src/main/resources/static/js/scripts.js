let item_get = {
    init: function () {
        $('.cart_btn').click(function () {
            let cust_id = $('.cust_id').val();
            let item_id = $(this).data('itemid');
            let cnt = null;
            $.ajax({
                url: '/addcart',
                data: {cust_id: cust_id, item_id: item_id, cnt: 1},
                success: function () {
                    if(cust_id != '') {
                        location.href="/item/allcart?id="+cust_id;
                    } else {
                        location.href="/login"
                    }
                },
                error:()=>{
                    alert("ajax에러")
                }
            });
        });
    }
};