
PImage img;

float x= 60;
float y= 440;
int radius= 45;
int bodyHeight= 160;
int neckHeight= 70;

float easing= 0.02;

void setup() {
  background(255);
  size(395, 500);
  smooth();
  img = loadImage("jetsons4.jpg");
strokeWeight(8);
ellipseMode (RADIUS);
}

void draw() {
  drawRobot(300, 420);
  drawRobot(200, 420);
  
}





void drawRobot(int x, int y) {
   // background(255);
 //image(img, 0, 0);
 int targetX = mouseX;
x += (targetX - x) * easing;
  if (mousePressed) {
    neckHeight= 16;
    bodyHeight= 90;
  } else {
    neckHeight = 70;
    bodyHeight = 160;
  }
  
  float ny = y - bodyHeight - neckHeight - radius;
  
//background(100, 0, 200);

  
// Neck
stroke(102);
line(x+2, y-bodyHeight, x+2, ny);
line(x+12, y-bodyHeight, x+12, ny);
line(x+22, y-bodyHeight, x+22, ny);


//antennae
strokeWeight(4);
stroke(255, 255, 0);
line(x +12, ny, x-18, ny-99); //left antennae
line(x +12, ny, x + 46, ny-99); //right antennae

//old code
//ellipse(264, 377, 33, 33); //orb
//fill(0); //set fill to black
//rect(219, 257, 90, 120); //main rectangle
//fill(102); //set fill to grey
//rect(219, 274, 90, 6); //grey stripe

//body
noStroke(); //disable stroke
fill(240, 0, 0); //set fill to red
ellipse(x, y-33, 33, 33); //orb
fill(0); //set fill to black
rect(x-45, y-bodyHeight, 90, bodyHeight-33); //main rectangle
fill(102); //set fill to grey
rect(x-45, y-bodyHeight+20, 90, 6); //grey stripe

//old code
////head
//fill(0); //set fill to black
//ellipse(276, 155, 45, 45); //head
//fill(255); //set fill to white
//ellipse(288, 150, 14, 14); //large eye
//fill(0); //set fill black
//ellipse(288, 150, 3, 9); //pupil

// Head
fill(0);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(x+24, ny-6, 14, 14);
fill(0);
ellipse(x+24, ny-6, 3, 9);
}

