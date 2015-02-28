
// FLAPPY BIRD VER. 0.2
// ALBERTO@ACM.ORG
// EJERCICIO: ABRIR/CERRAR PICO

boolean pico = true; //.2 GLOBAL

void mouseClicked() { //.2 CLICK MOUSE
    pico = !pico;
};

void setup() {
  size(400,400);  
}


void draw() {

    background(0, 217, 255);
    translate(mouseX-185, mouseY-110);
    //scale(0.5);    

    stroke(80);
    strokeWeight(8);

    fill(232, 232, 28); // CUERPO
    ellipse(215,200,221,200);
    
    pushMatrix();
        rotate(radians(15));
        fill(255,255,255,250);
        ellipse(185,140,180,90); // ALAS
    popMatrix();
    
    pushMatrix();
        point(240,220);
        if (pico==true) { //.2 ABRIR/CERRAR PICO
            translate(240,220);
            rotate(radians(25)); // ABRIR
        } else {
            translate(240,220);
            rotate(radians(13)); // CERRAR
        }
        fill(230, 140, 30);
        ellipse(50,0,100,30); // PICO
    popMatrix();
    
    pushMatrix();
        rotate(radians(55));
        fill(255);
        ellipse(300,-152,100,60); // OJO
    popMatrix();
    
    fill(230, 140, 30);
    arc(310,230,140,50,radians(-170),radians(20),PIE); // PICO SUPERIOR
    
    fill(80);
    ellipse(315,170,30,40); // IRIS
    
}
