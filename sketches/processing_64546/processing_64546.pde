
import processing.video.*;

Capture cam;

PGraphics topLayer;


int oldMouseX, oldMouseY;
color pen1, pen2;
int myPenWeight;
PFont bobsfont;
color c1, c2;
int aState;
int x1, y1;
int vX, vY;
int f1;
int mX, mY;
  
void setup() {
  size(600, 600);
  smooth();
  oldMouseX = 0;
  oldMouseY = 0;
  pen2 = color(0, 0, 0);
  c1 = color(255, 255, 255);
  c2 = color(0, 0, 0);

  cam = new Capture(this, 530, 380);

topLayer = createGraphics(width, height, g.getClass().getName());

  myPenWeight = 1;
  aState = 0;
  x1 = 20;
  y1 = 80;
  vX = 5;
  vY = 1;
  f1 = int(random(255));
  mX = 20;
  mY = 80;
}
  
void draw() {
  
    if (cam.available() == true) 
    cam.read();
    image(cam, 35, 130);
    
  fill(c2);
 
 text("LAPIZ", 15, 20);
 text("FONDO", 330, 20);
  strokeWeight(myPenWeight);
  stroke(pen2);
  if (mousePressed && mouseY > 66) {
    if (oldMouseX != mouseX || oldMouseY != mouseY) {
      line(mouseX, mouseY, oldMouseX, oldMouseY);
      
      topLayer.beginDraw();
  topLayer.noFill();
  topLayer.stroke( 255 );
  topLayer.endDraw();
  image( topLayer, 0, 0 );
    }
  }
  oldMouseX = mouseX;
  oldMouseY = mouseY;
  
     //COLORES DE LAPIZ
    //red button
    strokeWeight(1);
    stroke(0);
    fill(255, 0, 0);
    ellipse(100, 15, 20, 20);
    //black button
    fill(0);
    ellipse(75, 15, 20, 20);
    //blue button
    fill (0, 0, 255);
    ellipse (125, 15, 20, 20);
    //green button
    fill(0, 255, 0);
    ellipse(150, 15, 20, 20);
    //orange button
    fill(255, 140, 0);
    ellipse(175, 15, 20, 20);
    //yellow button
    fill (255, 255, 0);
    ellipse(200, 15, 20, 20);
    //purple button
    fill(148, 0, 211);
    ellipse(225, 15, 20, 20);
    
    //BOTON "?" de LAPIZ 
    fill(255);
    ellipse(250, 15, 20, 20);
    fill(0);
    text("?", 248, 22);
    //current color rect
    fill(pen2);
    rect(570, 5, 20, 20);
    
    //PRECIONAR COLORES DE LAPIZ 
    if (mousePressed && dist(75, 15, mouseX, mouseY) < 10) {
      pen2 = color(0, 0, 0);
    }
    else if (mousePressed && dist(mouseX, mouseY, 100, 15) < 10) {
      pen2 = color(255, 0, 0);
    }
    else if (mousePressed && dist(mouseX, mouseY, 125, 15) < 10) {
      pen2 = color(0, 0, 255);
    }
    else if (mousePressed && dist(mouseX, mouseY, 150, 15) < 10) {
      pen2 = color(0, 255, 0);
    }
    else if (mousePressed && dist(mouseX, mouseY, 175, 15) < 10) {
      pen2 = color(255, 140, 0);
    }
    else if (mousePressed && dist(mouseX, mouseY, 200, 15) < 10) {
      pen2 = color(255, 255, 0);
    }
    else if (mousePressed && dist(mouseX, mouseY, 225, 15) < 10) {
      pen2 = color(148, 0, 211);
    }
    else if (mousePressed && dist(mouseX, mouseY, 250, 15) < 10) {
      pen2 = color(random(255), random(255), random(255));
    }
    
    
    //BOTON BORRAR
    fill(0);
    stroke(0);
    rect(108, 35, 55, 20);
    fill(255);
    text("BORRAR", 110, 53);
    if (mousePressed && mouseX > 110 && mouseX < 160 && mouseY > 32 && mouseY < 57) {
      background(255);
      myPenWeight = 1;
      pen2 = color(0, 0, 0);
      aState = 0;
      c2 = color(0, 0, 0);
    }
  
    //CUADROS DE + Y -
    fill(255);
    strokeWeight(1);
    rect(60, 35, 20, 20);
    rect(85, 35, 20, 20);
    if (mousePressed && mouseX > 85 && mouseX < 105 && mouseY > 35 && mouseY < 55) {
      if (myPenWeight > 1) {
        myPenWeight --;
      }
    }
    //BOTON DE + Y -
    fill(0);
    text("+", 64, 50);
    text("-", 92, 50);
    if (mousePressed && mouseX > 60 && mouseX < 80 && mouseY > 35 && mouseY < 55) {
      myPenWeight ++;
    }
  
    //GOMA DE BORRAR
    fill(255, 128, 114);
    strokeWeight(1);
    quad(20, 40, 50, 40, 40, 50, 10, 50);
    if (mousePressed && mouseX > 10 && mouseX < 50 && mouseY > 40 && mouseY < 50) {
      myPenWeight ++;
      pen2 = c1;
    }
    
    
    //BOTONES DE COLOR DE FONDO
    
    fill(c2);
    //text("Fondo", 255, 22);
    
    //red background
    if (button(420, 255, 0, 0)) {
      fill(c1);
      stroke(0);
      c1 = color(255, 0, 0);
      rect(0, 65, 600, 600);
      //c2 = color(0, 0, 0);
    }
    //blue background
    if (button(445, 0, 0, 255)) {
      fill(c1);
      stroke(0);
      c1 = color(0, 0, 255);
      rect(0, 65, 600, 600);
      //c2 = color(0, 0, 0);
    }
    //black background
    if (button(395, 0, 0, 0)) {
      fill(c1);
      stroke(0);
      c1 = color(0, 0, 0);
      rect(0, 65, 600, 600);
      //c2 = color(255, 255, 255);
    }
    //green background
    if (button(470, 0, 255, 0)) {
      fill(c1);
      stroke(0);
      c1 = color(0, 255, 0);
      rect(0, 65, 600, 600);
      //c2 = color(0, 0, 0);
    }
    
    //BOTON RANDOM "?"
    if (button(495, 255, 255, 255)) {
      fill(c1);
      stroke(0);
      c1 = color(random (255), random (255), random (255));
      rect(0, 65, 600, 600);
      //c2 = color(0, 0, 0);
    }
    // BOTON ? DE FONDO
    fill(0, 0, 0);
    text("?", 493, 22);
    

    if (aState == 1) {
      fill(pen2);
      stroke(pen2);
      ellipse(x1, y1, 10, 10);
    }
    if ( x1 > width - 5 || x1 < 5) {
      vX *=-1;
    }
    if ( y1 > height - 5 || y1 < 71) {
      vY *=-1;
    }
    stroke(205, 201, 201);
    line(0, 65, 599, 65);
  }
  
  boolean button(int buttX, int buttR, int buttG, int buttB) {
    fill(buttR, buttG, buttB);
    strokeWeight(1);
    stroke(0);
    ellipse(buttX, 15, 20, 20);
    boolean hit = false;
    if (mousePressed && dist(buttX, 15, mouseX, mouseY) < 10) hit = true;
    return (hit);
  }


