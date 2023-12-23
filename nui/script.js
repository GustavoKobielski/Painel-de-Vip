$(document).ready(function() {
    window.addEventListener("message", function(event) {
        if (event.data.action) {
            Vip = true
            $('.container').show();
            resetFormFields();
        } else {
            $('.container').hide();
        }
    });

    $('#enviar-btn').click(() => {
        if (Vip) {
            let id = $("#input-id").val()
            let money = $("#input-money").val()
            let vehicle = $("#input-vehicle-spawn").val()
            let group = $("#input-group-name").val()
            $.post("http://Lak_vip/sendInformations", JSON.stringify({ id, money, vehicle, group }))
        }
    });
});

function resetFormFields() {
    $("#input-id").val("");  // Valor padrão para o ID
    $("#input-money").val("0");  // Valor padrão para a quantidade de dinheiro
    $("#input-vehicle-spawn").val("");  // Valor padrão para o veículo
    $("#input-group-name").val("");  // Valor padrão para o grupo VIP
}

$(document).keyup(function(event) {
    if (Vip == true) {
        if (event.which === 27) {
            $('.container').hide();
            $.post("http://Lak_vip/closeVipNui", true)
        }
    }
    
});






