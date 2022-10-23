function validardatos(){
 //let nombre=document.formulario.nombre.value;
 let nombre2=document.querySelector("#validationCustom01").value;
 console.log(nombre2); 

 //let lognombre=document.formulario.nombre.value.length;
 let lognombre=document.querySelector("#validationCustom01").value.length;
 console.log(lognombre);  
 if (lognombre>30){
    alert("El nombre debe ser menor a 30 caracteres");
 } 
 else alert("Registrado, Puede Ingresar Ahora!")
 document.location="login.html";
}

function validar(){
    let usuario=document.querySelector("#usuario").value
    let contrase\u00f1a=document.querySelector("#contraseña").value
    console.log(usuario+","+contrase\u00f1a)
    
    fetch ("http://localhost:8080/Persona/login?usuario="+usuario+"&contraseña="+contrase\u00f1a+"")
    .then(response => response.json())
    .then(data => {
        console.log(data)
        if(data.msj=="ok"){
            console.log("Puede ingresar al sistema")
            document.location="index.html"
        }
        else{
            alert(data.msj)
        }})
    }