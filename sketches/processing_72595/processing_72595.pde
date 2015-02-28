
boolean doidraw = false;
int diam = 200;

void setup() {
  size(400,400);
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
    drawacircle(mouseX-20,mouseY,diam/3);
    drawacircle(mouseX+20,mouseY,diam/3);
    drawacircle(mouseX+10,mouseY+10,diam/4);
    drawacircle(mouseX-10,mouseY-10,diam/4);
    drawacircle(mouseX+10,mouseY-10,diam/4);
    drawacircle(mouseX-10,mouseY+10,diam/4);
    drawacircle(mouseX,mouseY-20,diam/3);
    drawacircle(mouseX,mouseY+20,diam/3);
    diam = diam - 20;
    if (diam < -0) {
     diam = 200; 
    }  
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    doidraw = !doidraw;
    }
}

void drawacircle(int centx, int centy, int circlesize) {
  stroke(0);
  fill(random(100,255),random(0),random(100,250));
  ellipse(centx,centy,circlesize,circlesize);
}
