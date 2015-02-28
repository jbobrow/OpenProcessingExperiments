
float x = 160;
float y = 480;
int bodyHeight = 250;
int neckHeight = 20;
int radius = 50;



void setup() {
  
  size(720, 720);
  smooth();
  strokeWeight(1);
  ellipseMode(RADIUS);
  frameRate (5);
}
  

  
  
 void draw() {
   
  float r = random (0, 255);
  float g = random (0, 255);
  float b = random (0, 255);
  background(r, g, b);
  
 
   int targetX = mouseX;
  
   if (mousePressed) {
     neckHeight = 170;
     bodyHeight = 180;
   } else {
     neckHeight = 20;
     bodyHeight = 250;
   }
  
  myDrawRobot(100);
  myDrawRobot(200);
  myDrawRobot(300);
  myDrawRobot(400);
 } 
 
 
  
void myDrawRobot (int x) {

  

    float ny = y - bodyHeight - neckHeight - radius;
   
    //neck
    strokeWeight(3);
    fill(255);
    line(x, ny-30, x, y-bodyHeight+50);

    //head
    strokeWeight(1);
    fill(255);
    ellipse(x, ny-30, radius, radius);
    //blue eye
    fill(62, 194, 219);
    ellipse(x+20, ny-30, 30, 30);
    //black eye
    fill(0);
    ellipse(x+20, ny-30, 10, 10);
    //orange eye
    fill(242, 114, 15);
    ellipse(x+20, ny-30, 5, 5);
    //two white eye
    fill(245, 168, 235);
    ellipse(x-30, ny-20, 2.5, 2.5);
    ellipse(x-30, ny-30, 2.5, 2.5);

    //antennae
    strokeWeight(3);
    line(x-80, ny-30, x-50, ny-30);
    line(x+50, ny-30, x+80, ny-30);

    //body
    fill(242, 114, 15);
    strokeWeight(1);
    rect(x-80, y-bodyHeight+50, 160, bodyHeight-80);
    //bottom
    fill(62, 194, 219);
    arc(x, y-30, 80, 80, 0, radians(180));
    //white belt
    fill(255);
    rect(x-80, y-80, 160, 20);
}



 


  


