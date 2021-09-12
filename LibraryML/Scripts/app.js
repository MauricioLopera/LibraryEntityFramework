
//Collapsible
document.addEventListener('DOMContentLoaded', function () {
    let elems = document.querySelectorAll('.collapsible');
    let options = {}
    let instances = M.Collapsible.init(elems, options);
});
//DropDownList
document.addEventListener('DOMContentLoaded', function () {
    var elems = document.querySelectorAll('select');
    let options = {}
    var instances = M.FormSelect.init(elems, options);
});
//Modals
document.addEventListener('DOMContentLoaded', function () {
    let elems = document.querySelectorAll('.modal');
    let options = {
        dismissible: false
    }
    let instances = M.Modal.init(elems, options);
});


//abre collapsible
function abreColapse(indice) {
    //obtenemos los collapsible existentes en la pagina
    let elems = document.querySelectorAll('.collapsible');
    //obtenemos la instancia de la fila seleccionada
    var instance = M.Collapsible.getInstance(elems[indice]);

    //obtenemos el estado actual
    let estado = document.getElementById('newl');
    //obtengo objetos del boton
    let icobt = document.getElementById('iconl');
    let txtbt = document.getElementById('textn');

    //abrimos o cerramos el colapse el collapsible
    if (estado.value === '1') {
        instance.open();
        //actualizamos estado
        estado.value = '0';
        //modificamos boton
        icobt.innerHTML = 'close';
        txtbt.innerHTML = 'Cancelar';
    } else {
        instance.close();
        //actualizamos estado
        estado.value = '1';
        //modificamos boton
        icobt.innerHTML = 'add_circle_outline';
        txtbt.innerHTML = 'Nuevo';
    }
}

//abre ventana Modal
function abrirModal(pos) {
    let elems = document.querySelectorAll('.modal');
    let instance = M.Modal.getInstance(elems[pos]);

    instance.open();

    document.getElementById('modl').value='0';
}