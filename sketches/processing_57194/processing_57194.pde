
float x = 60;          // X-coordinate
float y = 440;         // Y-coordinate
int radius = 45;       // Head Radius
int bodyHeight = 160;  // Body Height
int neckHeight = 70;   // Neck Height
float easing = 0.02;
void setup() {
  size(360, 480);
  smooth();
  strokeWeight(12);
   
    ellipseMode(RADIUS);
}
void draw() {
   
  int targetX = mouseX;
  x += (targetX - x) * easing;
     
  if (mousePressed) {
    neckHeight = 16;
    bodyHeight = 90;
  } else {
    neckHeight = 70;
    bodyHeight = 160;
  }
   
  float ny = y - bodyHeight - neckHeight - radius;
   
  background(204);
 
// Neck
stroke(102);               //Set stroke to gray
line(x+2, y-bodyHeight, x+2, ny);
line(x+22, y-bodyHeight, x+22, ny);
 
//antennae
line(x+12, ny, x-50, ny-43);
line(x+12, ny, x+42, ny-99);
line(x+12, ny, x+78, ny+15);
 
//body
noStroke();                //disable stroke
fill(0, 255, 0);                  //set fill to gray
ellipse(x+20, y-33, 33, 33); //antigraviety orb
fill(0);                   //set fil to black
rect(x-45, y-bodyHeight, 120, bodyHeight-33);   //main body
fill(170, 0, 0);                 //set fill to red
rect(x-45, y-bodyHeight+17,120, 6);     //gray stripe


 
//head
fill(0, 0, 255);                   //set fill to black
ellipse(x+12, ny, radius, radius); //head
fill (255);                //set fill to white
ellipse(x+32, ny-6, 20, 20); //large eye
ellipse(x+0, ny-6, 13, 13); //2nd eyed
fill(255, 0, 0);                   // set fill to red
ellipse(x+24, ny-6, 3, 3);   //pupil1
ellipse(x+1, ny-6, 3, 3);   //pupil2
fill (255);                //set fill to white
ellipse( x+24, ny-6, 12, 14); //large eye
fill(0);                   // set fill to black
ellipse(x+24, ny-6, 3, 3);   //pupil


}


