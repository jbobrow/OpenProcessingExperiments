
float i = 0;

void setup() {
  background(0);
  size(800, 800);
  frameRate(100);
}
void draw() {
  //background(255);
i=i+0.01;
float posicionX = 300*sin(i);
float posicionY = 300*cos(i);
 
float otraPosicionX = 50*sin(i*15);
float otraPosicionY = 50*cos(i*15);
float grueso = 30;
//fill(0,40,120,10);
//noStroke();
stroke(0,80,147,110);
noFill();
  ellipse((width/2)+posicionX, (width/2)+posicionY, mouseY/2, mouseX/2);
 //fill(0,80,200,10);
 noFill();
 //noStroke();
// stroke(0,40,100,100);
 //ellipse((width/2)+posicionX+otraPosicionX, (width/2)+posicionY+otraPosicionY, mouseY/2, mouseX/2);
}
void mousePressed() {
  noLoop();
}
