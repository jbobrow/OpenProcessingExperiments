
//click and creat bubbles

PShape clouds1;
PShape clouds2;
PShape clouds3;
PShape clouds4;
PShape bubble;
float speed = 1;
float i1;
float i2;
float i3;
float i4;//clouds speed

Bubble[] bubbles = new Bubble[1000];
int i;

void setup() {
  size(800,600);
  smooth();
  clouds1 = loadShape("clouds1.svg");
  clouds2 = loadShape("clouds2.svg");
  clouds3 = loadShape("clouds3.svg");
  clouds4 = loadShape("clouds4.svg");
  bubble = loadShape("bubble.svg");
}

void mousePressed() {
  bubbles[i++] = new Bubble(bubble,mouseX,mouseY);
}
  

void draw() {
  background(109,199,220);
  i1+=speed;
  i2+=speed;
  i3+=speed;
  i4+=speed;

  if(i1>width+1700) {
    i1=-1000;
  }
  if(i2>width-200) {
    i2=-600;
  }
  if(i3>width+600) {
    i3=-1600;
  }
  if(i4>width+1700) {
    i4=-2500;
  }

  shape(clouds1,i1*0.3,-20);
  shape(clouds2,i2*0.9,0);
  shape(clouds3,i3*0.5,70);
  shape(clouds4,i4*0.2,10);

  for(int a = 0; a<i;a++){
    bubbles[a].display();
  }
}
  
  class Bubble{
    int x;
    float y;
    PShape bubble;
    float easing = random(0.1,1);
    
    Bubble(PShape b, int tempX, float tempY){
      bubble = b;
      x = tempX;
      y = tempY;
    }
    
    void display(){
     shape(bubble, x,y);
     if(mouseY<height){
      y = y-easing;
     }
     
    }
    
}

