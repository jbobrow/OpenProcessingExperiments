
//============================
// Settings
//============================
final int breite = 20;
int i = 1;
int baseAngle;
color backgroundCol, strokeCol, fillCol;
//============================

void setup() {
  size(800, 500);
  colorMode(HSB, 360, 100, 100);  
  background(0);  //Background color
  smooth();
}

//Get new random int on each mouseclick
void mousePressed(){
  i = getIntRandom(1,4);
  resetCanva();
  //Hintergrund soll schwarz bleiben bei Rechtsklick
  if(mouseButton == RIGHT){
    background(0); //schwarz
    strokeWeight(1);
  }
}

void draw() {
  //strokeWeight(abs(mouseX-pmouseX));
  if(mousePressed){    
    switch(i){
      case 1:
        drawRect(mouseX, mouseY);
        break;
      case 2:
        drawEllipse(mouseX, mouseY);
        break;
      case 3:   
        drawTriangle(mouseX, mouseY);
        break;
    }
  }
}

void drawKreuz(int x, int y){
   line(x, y-3, x, y+3); 
   line(x-3, y, x+3, y);
}

void drawTriangle(int x, int y){
 triangle(x, y, x+breite, y-breite, x+2*breite, y);
}

void drawEllipse(int x, int y){
  ellipse(x, y, breite, breite);
}

void drawRect(int x, int y){
 rect(x, y-10, breite, breite); 
}

int getIntRandom(int start, int end){
  int j =  (int)random(start, end);
  return j;
}

void resetCanva(){
  strokeWeight(4);
  baseAngle = getIntRandom(0,360); //Grundfarbe setzen
  backgroundCol = color(baseAngle, 30, 50+random(50));
  strokeCol = color((baseAngle+120), 30, 50+random(50));
  fillCol = color((baseAngle+240), 30, 50+random(50));
  //60 modulo damit wird sichergestellt, dass es nur 1x im kreis läuft
  background(backgroundCol);
  stroke(strokeCol, 80);
  fill(fillCol, 80);
}
