
float x = 60; // x-coordinate
float y = 460; // y-coordinate
int radius = 50; //head
int bodyHeight = 160;
int neckHeight = 50; // Neck Height
float easing = 0.05;
void setup (){
size(400,500);
smooth();
strokeWeight(2);
ellipseMode(RADIUS);
}
void draw (){
  int targetX= mouseX;
  x += random (-.5, 2);
  y += random (-2, 2);
  if (keyPressed) {
    neckHeight = 30;
    bodyHeight = 60;
  }
  
  float ny=y-bodyHeight-neckHeight-radius;
 
  //body
stroke(1);
fill(150);
ellipse(x, y-33, 33, 33);
fill(0);
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(102);
rect(x-45, y-bodyHeight+17, 90, 6);
//middle
stroke (3);
fill (200, 120, 130);
rect (x-13,y-300, 30, 90);
//head and neck
stroke (15);
fill (250,10,50);
ellipse (x+2, ny-6, 14, 14);
line(x+2, y-bodyHeight, x+2, ny);
//eyes
fill(0);
ellipse(x-4, ny-62, 3, 3);
ellipse(x+9, ny-62, 3, 3);
//arms
stroke(10);
fill(30);
line(x-35,ny,x-7,ny-15);
line (x+50, ny, x-11, ny);

}

