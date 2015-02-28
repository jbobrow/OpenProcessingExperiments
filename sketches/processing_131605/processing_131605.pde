
float x = 100; // x location of square
float y = 0;  //  y location of square

float speed = 0; // speed of square
float gravity = 0.1;

ellipse(90,90,10,10);
ellipse(1,5,10,10);


boolean button = false;


int x = 100;
int y = 100;
int w = 50;
int h = 75;



void setup() {

size(500,500);
}


 
 void draw() {
  if (button) {
    background(random(390),0,0);
    stroke(0,random(200),0);
    strokeWeight(random(10));
    frameRate(5);
   } else { 
     background(0,random(125),0);
     stroke(random(100),0,0);
     strokeWeight(random(10));
     frameRate(5);
   }
   fill(175);
   rect(x,y,w,h);
  }
  void mousePressed() {
   if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
   button = !button;
   }
  }
  
  void draw() {
  ellipse(90,100,100,100);
  

