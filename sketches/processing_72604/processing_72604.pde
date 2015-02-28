
boolean doidraw = false;
int diam = 200;

void setup() {
  size(700,700);
  background(0);
  noStroke();
  while(doidraw) {
  drawacircle(200,200,diam);
  drawacircle(200,200,diam/2);
  diam = diam - 20;
  }
}

void draw() {
  if(doidraw) {
//    drawacircle(mouseX-20,mouseY,diam/3);
//    drawacircle(mouseX+20,mouseY,diam/3);
    drawacircle(mouseX-10,mouseY+10,diam/3);
    drawacircle(mouseX-10,mouseY-10,diam/3);
    drawacircle(mouseX+10,mouseY-10,diam/3);
    drawacircle(mouseX+10,mouseY+10,diam/3);
    diam = diam - 20;
    if (diam < -200) {
     diam = 200; 
    }  
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    doidraw = !doidraw;
    }
}

float noiseScale=0.01;

void drawacircle(int centx, int centy, int circlesize) {
  stroke(0);
  float noiseVal = noise((mouseX)*noiseScale, mouseY*noiseScale);
  fill(noiseVal*255,random(0),0);
  ellipse(centx,centy,circlesize,circlesize);
}
