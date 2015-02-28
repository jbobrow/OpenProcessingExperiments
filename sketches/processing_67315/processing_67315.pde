
float r = 0;
float g = 0;
float b = 0;
float a = 255;



//set floating points (with z for P3D)
float x;
float y;
float z;

float x1;
float y1;
float z1;



float x2;
float y2;
float z2;

//set speeds
int xSpeed = 20;
int ySpeed = 20;
int zSpeed = 30;


int xSpeed1 = 10;
int ySpeed1 = 10;
int zSpeed1 = 30;


int xSpeed2 = 25;
int ySpeed2 = 30;
int zSpeed2 = 30;



void setup() {
  //size(800, 500);
  smooth();
  
  //scale window to screen
  size(screen.width - 10, screen.height - 50);
  //colorMode(HSB, 100, 100, 100, 100);
  background(100);
  stroke(frameCount);
  strokeWeight(2);
  strokeJoin(ROUND);
  frameRate(100);
}

void draw() {

  //transparent layer
  noStroke();
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);



  //draw triangle
  stroke(r, g, b, a);
  fill(0, 150, 0, 100);
  triangle(x, y, x1, y1, x2, y2);



// move
  x += xSpeed;
  y += ySpeed;
  z += zSpeed;

  x1 += xSpeed1;
  y1 += ySpeed1;
  z1 += zSpeed1;

  x2 += xSpeed2;
  y2 += ySpeed2;
  z2 += zSpeed2;


  //point0
  if (x > width || x < 0)
    xSpeed *= -1;
  if (y > height || y < 0)
    ySpeed *= -1;

  //point1

    if (x1 > width || x1 < 0)
    xSpeed1 *= -1;
  if (y1 > height || y1 < 0)
    ySpeed1 *= -1;

  //point2

  if (x2 > width || x2 < 0)
    xSpeed2 *= -1;
  if (y2 > height || y2 < 0)
    ySpeed2 *= -1;
}



//extra functionalities



void keyPressed() {
  // reset background to black
  if (key == 'b') 
    background(0, 0, 0);

//save pdf
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.pdf");
}

//reset triangle coordinates and grow
void mousePressed (){
 if (mousePressed == true) {
    x = mouseX;
    y = mouseY;
     x1 = mouseX;
    y1 = mouseY;
     x2 = mouseX;
    y2 = mouseY;
  } else {
    
  }
 
} 

 
//timestamp
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}


