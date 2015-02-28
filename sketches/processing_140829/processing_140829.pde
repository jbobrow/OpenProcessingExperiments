
/** <strong>Figuras de Lissajous</strong>
 * H. Spencer - 2007<br/>
 * <br/>
 * 'a' - 'z' controlan perÌodo en X<br/>
 * 's' - 'x' controlan perÌodo en Y<br/>
 */

void setup() {
  defineVariables();
  size(800, 800);
  font = loadFont("font.vlw");
  pixel = loadFont("pixel.vlw");
  tit = loadFont("tit.vlw");
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
  frameRate(30);
}

void draw() {
  theta += inc; // incremento negativo constante del ángulo

  // identidad circular
  x = cos(theta*py)*rx; // x pos del punto
  y = sin(theta*px)*ry; // y pos del punto

  background(255);
  grilla(cx, cy, rx, ry); // dibuja la grilla
  grilla(cx, cy-2*ry, rx, ry);
  grilla(cx + 2*rx, cy, rx, ry);
  puntoVerde(cx, cy);

  seno(cx+rx, cy); // dibuja la proyección del seno en y
  coseno(cx, cy - ry); // dibuja la proyección del coseno en x
  lissajous(cx, cy);
  dibujaEjes();

  fill(verde);
  textFont(font, 16);
  text("x = cos(at)r, y = sin(bt)r\na:b = "+px+":"+py, 2.6*rx, cx);
  textFont(pixel, 8);
  fill(verde, 150);
  text("las teclas 'a' y 'z' modifican 'a'\n y 's' y 'x' modifican el valor de 'b'\n\ntheta = "+theta, 2.6*rx, 1.3*cx);
  textFont(tit, 48);
  text("Lissajous", 2.6*rx, cx*0.6);
}

void grilla(float xpos, float ypos, float rx, float ry){
  pushMatrix();
  translate(xpos,ypos);
  noFill();
  stroke(verdeOscuro,100);
  strokeWeight(1);
  rect(0,0, 2*rx, 2*ry);
  line(-1.1*rx,0, 1.1*rx, 0);
  line(0, -1.1*ry, 0, 1.1*ry);
  //ellipse(0, 0, 2*r, 2*r);
  stroke(verdeOscuro,20);
  for (int i = int(-ry); i < ry; i += int(ry/10)){
    line(-rx, i, rx, i);
    //line(i, -r, i, r);
  }
  popMatrix();
}

void puntoVerde(float xpos, float ypos){
  pushMatrix();
  translate(xpos, ypos);
  noFill();
  stroke(verde);
  line(0,0, x,y);
  fill(verde);
  ellipse (x, y, rx/30, rx/30);// dibuja el punto que se mueve

  // la estela:
  // primero hay que mover todos los valores del [] a la izquierda
  for(int i = 1; i < largoEstela; i++){
    estela[i-1][0] = estela[i][0];
    estela[i-1][1] = estela[i][1];
  }
  //hay que poner un valor nuevo al final del []
  estela[largoEstela-1][0] = x;
  estela[largoEstela-1][1] = y;

  //dibujar la estela:
  if(dibujaEstela){
    for(int i = 1; i < largoEstela; i++){
      stroke(verde, float(i)/largoEstela * 255);
      strokeWeight(3);
      line(estela[i-1][0],estela[i-1][1],estela[i][0],estela[i][1]);  
    }
  }
  popMatrix();
  strokeWeight(1);
}

void seno(float xpos, float ypos){
  stroke(verde, 170);
  pushMatrix();
  translate(xpos,ypos);
  stroke(verde);
  noFill();
  beginShape();
  for (float i = 0; i < 2*rx; i++){
    y = sin(theta*px+(i/(ry/PI)))*ry;
    vertex(i , y);
  }
  endShape();
  popMatrix();
}

void coseno(float xpos, float ypos){
  stroke(verde, 170);
  pushMatrix();
  translate(xpos,ypos);
  stroke(verde);
  noFill();
  beginShape();
  for (float i = 0; i < 2*ry; i++){
    x = cos(theta*py+(i/(rx/PI)))*rx;
    vertex(x , i - 2*ry);
  }
  endShape();
  popMatrix();
}

void lissajous(float xpos, float ypos){
  pushMatrix();
  translate(xpos, ypos);
  beginShape();
  for(float i = 0; i < TWO_PI; i+=TWO_PI/1000){
    lx = rx * cos(py*i);
    ly = ry * sin(px*i);
    stroke(verde,130);
    vertex(lx,ly);
  }
  endShape();
  popMatrix();
}

void dibujaEjes(){
  pushMatrix();
  translate(cx,cy);
  line(x,y, rx, y);
  line(x,y, x, -ry);
  popMatrix();
}

/*
void borraCola(){
 for(int i = 0; i < largoEstela; i++){
 estela[i][0] = x;
 estela[i][1] = y;
 }
 }
 *//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void keyPressed(){
  if (key == 'a'){
    px++;
  }
  if (key == 'z'){
    px--;
  }
  if (key == 's'){
    py++;
  }
  if (key == 'x'){
    py--;
  }
  
  if (key == 'g'){
    rx++;
  }
  if (key == 'b'){
    rx--;
  }
  if (key == 'h'){
    ry++;
  }
  if (key == 'n'){
    ry--;
  }
    if (key == 'e'){
    dibujaEstela = !dibujaEstela;
  }
  if (key == ' '){
    defineVariables(); // reset
  }
  //borraCola();
}

// variables
int w, h;
float cx, cy; // centrox, centroy
int px, py; // perÌodos de onda 'x' e 'y'
int largoEstela; 
float x, y, r, rot, theta, rx, ry, lx, ly, inc;
PFont font, pixel, tit; // fuentes
color verde, verdeOscuro; //colores
float[][] estela;// puntos de la estela
boolean dibujaEstela;
void defineVariables(){
  w = 800;
  h = 800;
  //r = float(w)/5;
  rx = float(w)/5;
  ry = float(w)/5;
  cx = 1.5*rx;
  cy = h - cx;
  theta = 0;
  px = 1;
  py = 1;
  lx = 0;
  ly = 0;
  inc = 0.025;
  verde = color(0);
  verdeOscuro = color(0);
  largoEstela = 80;
  dibujaEstela = true;
  estela = new float[largoEstela][2];
  for(int i = 0; i < largoEstela; i++){
  estela[i][0] = r;
  estela[i][1] = 0;
  }
}



