
PFont fontA;

void setup(){
size(800,600);
background (80);
smooth ();
fontA = loadFont ("ARBONNIE-12.vlw");
   textFont (fontA, 12);
}

void draw(){
float v = dist(mouseX,mouseY,pmouseX,pmouseY); // mide la velocidad del movimiento del mouse (distancia entre la posición actual y la anterior)
 if (mousePressed) {
   stroke (10,10);
 //println();
 fill (255);
 text ("BY BRYAN", mouseX, mouseY, pmouseX, pmouseY);
 //line(mouseX,mouseY,pmouseX,pmouseY);  // linea continua
 //ellipse (mouseX, mouseY, pmouseX, pmouseY);
}
}

// para borrar
void keyPressed(){ // cuando se oprime una tecla...
background(80); // pinta el fondo de blanco
}

