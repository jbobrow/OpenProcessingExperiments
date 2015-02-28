
float x=150;
float y=400;
float easing = 0.2;
int feetX1 = 128;
int feetX2 = 173;
int feetY = 565;



void setup() {
size (300,600);
smooth();
rectMode(CENTER);
}



void draw() {
  
float speed = dist(mouseX, mouseY, pmouseX, pmouseY);


  background (204);
x = mouseX;  
y = mouseY;
x += (y - x) *easing;

if (speed > 50 && speed < 600) {
  background (243, 247, 12);
}
  
  else if (speed > 0 && speed < 50){
  background (255);
  }
  

//body
fill (246, 255, 0);
rect (x+2, y+55, 92, 100);

//head
fill (245, 255, 0);
rect (x+0.5, y-10, 103, 85); 

//ears
fill (245, 255, 0);
triangle (x-52, y-105, x-7, y-50, x-52, y-48);
triangle (x+53, y-105, x+15, y-48, x+53, y-50);

//eyes
fill (0); //blackparts
ellipse (x-20, y-20, 30, 30);
ellipse (x+20, y-20, 30, 30);
fill (255); //whiteparts
ellipse (x-17, y-28, 6, 6);
ellipse (x-12, y-22, 6, 6);
ellipse (x-19, y-22, 4, 4);

ellipse (x+23, y-28, 6, 6);
ellipse (x+28, y-22, 6, 6);
ellipse (x+21, y-22, 4, 4);

//dots
fill (255, 0, 0);
ellipse (x-42, y+5, 15, 15);
ellipse (x+43, y+5, 15, 15);

//arms
line (x-45, y+35, x-55, y+50);
line (x+48, y+35, x+58, y+50);

//legs
line (x-22, y+105, feetX1, feetY);
line (x+23, y+105, feetX2, feetY);

//feet
line (128, feetY, 113, feetY);
line (173, feetY, 158, feetY);

//nose
point (x, y);

//mouth
fill (142, 47, 0);
arc (x, y+7.5, 15, 10, 0, PI);

//eardetail
fill (0);
triangle (x-52, y-105, x-27, y-75, x-52, y-75);
triangle (x+53, y-105, x+33, y-75, x+53, y-75);


}



