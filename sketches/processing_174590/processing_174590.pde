
void setup() {
  size(800, 600);
  background (255);
}
float xp= 0;
float yp= 0;
float xg= 3;
float yg=.5;
color b = #ffffff;
color n = #000000;
color q = #ff0000;
color w = #00cc00;
color a = #0000ff;
color s = #ff9000;
color z = #ffff00;
color x = #cc00ff;
void draw() {
  colorMode (RGB, 100);
  noFill();

  if (xp<0||xp>width) xg=-xg;
  if (yp<0||yp>height) yg=-yg;
  else yg += 3;
  xp+=xg;
  yp+=yg;
  for (int l=0; l<mouseX; l+=mouseY) {
    ellipse(xp, yp, l, l);
  } //shape
} //voiddraw

void keyPressed() {
  if (keyCode==UP) {  //random
    stroke(random(255), random(255), random(255));
  }
  if (key == 'b') { //Blanco
    stroke(b);
  }
  if (key == 'n') { //Negro 
    stroke(n);
  }
  if (key == 'q') { //Rojo
    stroke(q);
  }
  if (key == 'a') { //Azul
    stroke(a);
  }
  if (key == 'z') { //Amarillo
    stroke(z);
  }
  if (key == 'w') { //Verde
    stroke(w);
  }
  if (key == 's') { //Naranja
    stroke(s);
  }
  if (key == 'x') { //Morado
    stroke(x);
  }
  if (key=='p') {
    noLoop();
  }
  if (keyCode==DOWN) {
    strokeWeight(8);
  }
}//Key

void keyReleased() {
  if (key=='p') { 
    loop();
  }
  if (keyCode==DOWN) { //linea delgada
    strokeWeight(.5);
  }
}

///reset
void mouseClicked(){
setup();
}

