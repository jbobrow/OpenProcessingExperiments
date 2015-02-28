
// Manel Lopez,1DAM, herramienta de dibujo
void setup() {
  size(200, 200);
  background(255);
  smooth();
}
 
void draw() {
  //Lapiz
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  //borrar
  if (keyPressed) {
    if (key == 's') {
      background(255);
    }
    //pintar color rojo
if (key == 'r') {
      stroke(255, 36, 36);
    }
    //pintar color azul
if (key == 'b') {
      stroke(2, 102, 222);
    }
    //pintar color amarillo
if (key == 'a') {
      stroke(250,230,0);

    }
    //marron
    if (key == 'm') {
      stroke(149, 78, 45);
    }
    //dibujar diamante de colores
if (key=='l'){
  
  stroke(int(random(255)),int(random(255)), int(random(255)) );
line(mouseX,mouseY,10,10);
line(mouseX,mouseY,200,200);

  }
  //negro
    if (key == 'n') {
      stroke(0);
    }
    //dibujar ellipse en medio para dibujar una cara
    if (key=='q'){
      ellipse (100,100,100,100);
}
}

}

