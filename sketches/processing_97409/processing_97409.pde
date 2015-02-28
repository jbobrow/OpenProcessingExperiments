
int frame;
int drawpoint;
int numpoints=1000;
float x[]=new float[numpoints];
float y[]=new float[numpoints];
 
 void A(){
  noStroke();
  fill(255, 178, 217);
  quad(60,55, 90,55, 120,150, 30,150);
  fill(214,255,255);
  triangle(75, 73, 100,150, 50, 150);
  fill(255, 178, 217);
  rect(60, 95, 30, 20);
}

void T(){
  strokeCap(ROUND);
  noStroke();
  fill(67, 116, 217);
  rect(200, 55, 100, 30);
  rect(240, 55, 30, 130);
}

void plus(){
  noStroke();
  fill(209, 178, 255);
  rect(110, 120, 100, 20);
  rect(150, 70, 20, 100);
}

void setup(){
  size(800,800);
}
 
void mousePressed(){
  drawpoint=0;
}
 
void mouseDragged(){
  x[drawpoint]=mouseX;
  y[drawpoint]=mouseY;
  drawpoint+=2;
}
 
void draw(){
  frame++;
  background(240,255,255);
  noStroke();
  for(int i=1; i<drawpoint; i+=5){
    if(!mousePressed){
      float phase= frame/i;
      x[i]=x[i]+sin(phase)+random(-15,15);
      y[i]=y[i]+tan(phase)+random(-20,20);
      translate(x[i], y[i]);
      scale(2);
  A();
  T();
  translate(75,55);
  scale(0.5);
  plus();
    }}
}
