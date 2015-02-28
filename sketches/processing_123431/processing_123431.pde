
int counter;
int pantalla = 1; // SELECTOR DE PANTALLA
 
void setup() {
    size(400,400);
    
    noLoop();
}
 
void draw() {
    background(0);
    fill(255);
    switch(pantalla) { // DESPLIEGA PANTALLA CORRESPONDIENTE
        case 1:
            text("AYUDA",50,50);       
            break;
        default:
       
    size(500,300);
        
            text("El programa te da un numero de cargas al azar,",20,50);
text("en la pantalla aparecen cargas amarillas y una carga fija azul",20,60);
text("El usuario debe realizar los cálculos necesarios,primeramente ",20,70);
text("deberá obtener la distancia, que será la hipotenusa",20,80);
text("de la distancia de la ultima carga a la carga fija teniendo:",20,90);
text("√(〖dy〗^2+〖dx〗^2 )",20,110);
text("Siendo dy, distancia y dx distancia en x ",20,130);
text("Después solo se tiene que aplicar la formula, que se encuentra en la pantalla:",20,140);
text("E=  Kq/d^2",20,160);
 
text("Siendo K una constante igual a 8.99x109 nm2/C2 ",20,180);
text("q es la carga que es constante en este problema de 1µc",20,190);
text("d la distancia",20,200);
 
text("Después de que el usuario realice sus cálculos",20,220);
text("tiene la opción de elegir entre 4 posibles respuestas",20,230);
text("para darse cuenta si su resultado fue correcto.",20,240);
             
            break;
            
             
    }
}
 
void mouseClicked() {
    switch(pantalla) { // CAMBIA PANTALLA SEGUN ACCION DEL MOUSE
        case 1:
            pantalla = 2; // redraw() if noLoop
            redraw();
            break;
        case 2:
            pantalla = 3;
            // redraw();
            break;
        case 3:
            pantalla = 1;
            // redraw();
            break;
    }
}

