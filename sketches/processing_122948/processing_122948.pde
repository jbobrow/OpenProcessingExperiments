
// Ejemplo multi-pantalla

int pantalla = 1; // SELECTOR DE PANTALLA

void setup() {
    size(400,400);
    textSize(20);
    //frameRate(5);
    noLoop();
}

void draw() {
    background(0);
    fill(255);
    switch(pantalla) { // DESPLIEGA PANTALLA CORRESPONDIENTE
        case 1:
            text("MENU",50,50);        
            break;
        case 2:
            text("DEMO",100,150);                
            break;
        case 3:
        default:
            text("AYUDA",150,250);        
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
