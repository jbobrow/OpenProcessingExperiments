
int x = 0; 
void setup() {
  size(1240, 700);
  background(255);
  smooth();
}
void draw() {
  
  if (keyPressed && (key == CODED)) { 
    if (keyCode == RIGHT) { // si la tecla right es apretada pasa lo de abajo
     
     x++;
   translate (frameCount , 400); // traslada la figura
  rotate (radians(frameCount)); // rota la figura en los parametro entre ()
  float sclSize = cos(radians(frameCount*3.5)); // variable float sclSize
  scale (map(sclSize, -1, 1, .5, 1)); // agranda o achica figura por sus vertices segun parametro en ()
  drawFigure(); // dibuja figura
    }
  }
}
  
  void drawFigure() {
    stroke(random(200), 200); // borde figura
    fill(0,0,30,20); // relleno figura
  beginShape(); // empieza a dibujar figura
  vertex(30, 150); // vertices
  vertex(60, 180);
  vertex(30, 150);
  vertex(60, 110);
  vertex(60,110);
  vertex(120,110);
  vertex(160,150);
  vertex(120,180);
  vertex(120,180);
  vertex(60,180);
  endShape(); // termina figura
}

void mousePressed() { // si el mouse es apretado en color de fondo es blanco
  background(255);
}



  

  
  


 
  




