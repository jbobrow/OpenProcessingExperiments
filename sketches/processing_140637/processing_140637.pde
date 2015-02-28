
// 18-03-14
// Bichejo
void setup() {
  size (500, 500);
  background(255);
  rectMode(CENTER);
  stroke(0);
  //frameRate(1);
}

void draw () {
//background(255);
  noStroke();
  dibujaCuadrados(random(500), random(500), random(255), random(255), random(255));
  if (mousePressed){
  dibujaCuadrados(mouseX, mouseY, 127, 0, 100);
  }
  
  
  alien(0);
}

void dibujaCuadrados (float x, float y, float r, float g, float b ) {
  fill(r,g,b);

  rect (x, y, 50, 50);
  rect (x +100, y, 50, 50);
  rect (x, y+100, 50, 50);
  rect (x +100, y + 100, 50, 50);
}

void alien (color cuerpo){
  
fill (cuerpo); //gris
rect (100,100, 20,20);//Cuerpo
fill (cuerpo); //gris
rect (100,120, 20,20);
fill (cuerpo); //gris
rect (100,140, 20,20);

fill (cuerpo);// blanco
ellipse (100, 60, 70,70);// Cabeza

fill (cuerpo); // negro
ellipse (80, 60, 20,40);//ojo izquierdo
ellipse (120, 60, 20,40);//ojo derecho

line (90,150, 80,170); // pata izquierda
line (110,150, 120,170); // pata izquierda


}
