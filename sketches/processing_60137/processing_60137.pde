
float r= 400;
float g= 80;
float b= 80;
float radX= 200;
float radY= 200;

void setup() {
   colorMode (R, 600, 600, 600,100);
   size (600,600);
   background(0,20,20);
   smooth();
}

void draw(){
  ellipse (300,300,radX,radY);
}

void mousePressed() {
  radX=radX * 1.3;
  radY=radY * 1.3;
}

void keyPressed() {
  background (0);
  radX=200;
  radY=200; 
}

