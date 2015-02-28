
/* Creation and Computation
 Chapter 1
 Jessica Knox
 September 20, 2011
 this is the final sketch that I submitted for Assigment 3*/


//variables for colour of each large rectangle

float rec1r = 147;
float  rec1g = 147;
float rec1b = 255;

float rec2r = 233;
float rec2g = 139; 
float rec2b = 222;  

float rec3r = 242;
float rec3g = 188;
float rec3b = 34;

float rec4r = 33; 
float rec4g = 243;  
float rec4b = 208;   

float cirCol = 190;

//variables for colour of square in centre
float rec0r = 255;
float rec0g = 0;
float rec0b = 0;

void setup() {
  size(600, 600);
  smooth();
  frameRate(40);

}


void draw () {

  background(190);
  //the display will be set as follows as a diamond structure
  displayCol (147, 147, 255, 233, 139, 222, 242, 188, 34, 33, 243, 208); 

  //in the upper right hand quadrant, pressing on the mouse will set off the randomization of colour in the diamond
  if (mouseX > width/2 && mouseY < height/2 && mousePressed) {
    frameRate(4);
    displayCol (random(255), random(255), random(255), random(255), random(255), random(255), random(255), random(255), random(255), random(255), random(255), random(255));
  }
  frameRate(40);

  //in the ,  pressing on the mouse will spin the square in the centre
  if (mouseX < width/2 && mouseY < height/2 && mousePressed) {
    displayRot (300,229,370,300,300,370,229,300);
  }

if (mouseX < width/2 && mouseY > height/2 && mousePressed) {
  background(190);
  frameRate(1); 
  for (int y = 0; y < height; y+=5) {
   stroke (0); 
   line(0,y,width,y); }
   for (int x = 0; x < width; x+=5) {
   stroke (0); 
   line(x,0,x,height); }
   strokeWeight(4);
   stroke (255);
    displayCol (147, 147, 255, 233, 139, 222, 242, 188, 34, 33, 243, 208);
  }
  
}
void displayCol (float rec1r, float rec1g, float rec1b, float rec2r, float rec2g, float rec2b, float rec3r, float rec3g, float rec3b, float rec4r, float rec4g, float rec4b) {

  //variables coordinates of shape locations

  int centX = width/2;
  int centY = height/2;  

  //these are the concentric diamonds on the outside

  fill (rec1r, rec1g, rec1b);
  quad (centX, 0, width, centY, centX, height, 0, centY);

  fill (rec2r, rec2g, rec2b);
  quad (centX, height/12, width-width/12, centY, centX, height-height/12, width/12, centY);

  fill (rec3r, rec3g, rec3b);
  quad (centX, height/6, width-width/6, centY, centX, height-height/6, width/6, centY);

  fill (rec4r, rec4g, rec4b);
  quad (centX, height/4, width-width/4, centY, centX, height-height/4, width/4, centY);

  //this diamond had to be precisely measured to touch the circle in the centre

  fill(255, 0, 0);
  rectMode (CENTER);
  rect(centX, centY, width/6, height/6);


  //this is the circle in the centre
  noStroke (); 
  fill (190);
  ellipseMode (CENTER);
  ellipse (centX, centY, width/6, height/6);

  //and now for those four weird shapes that appear near the centre circle
  //the locations are measured to closest whole number from their precise location, then with a -1 or +1 for select points because the stroke was bleeding into the red diamond
  stroke (255);
  strokeWeight (4);
  line (282, 246, 282, 215);
  line (246, 282, 215, 282);
  line (282, 215, 215, 282);

  line (318, 246, 318, 215);
  line (354, 282, 384, 282);
  line (318, 215, 384, 282);

  line (354, 318, 384, 318);
  line (318, 353, 318, 384);
  line (384, 318, 318, 384);

  line (282, 353, 282, 384);
  line (246, 318, 215, 318);
  line (282, 384, 215, 318);

  strokeWeight (0);
} 

void displayRot(int a,int b,int c,int d,int e,int f,int g,int h) {

  //variables coordinates of shape locations

  int centX = width/2; 
  int centY = height/2;  
  

  //variables for colour of square in centre
  rec0r = 255;
  rec0g = 0;
  rec0b = 0;
  //these are the concentric diamonds on the outside

  fill (rec1r, rec1g, rec1b);
  quad (centX, 0, width, centY, centX, height, 0, centY);

  fill (rec2r, rec2g, rec2b);
  quad (centX, height/12, width-width/12, centY, centX, height-height/12, width/12, centY);

  fill (rec3r, rec3g, rec3b);
  quad (centX, height/6, width-width/6, centY, centX, height-height/6, width/6, centY);

  fill (rec4r, rec4g, rec4b);
  quad (centX, height/4, width-width/4, centY, centX, height-height/4, width/4, centY);

  //this diamond had to be precisely measured to touch the circle in the centre

  fill(255, 0, 0);
  quad (300,229,370,300,300,370,229,300);


  //this is the circle in the centre
  noStroke (); 
  fill (190);
  ellipseMode (CENTER);
  ellipse (centX, centY, width/6, height/6);

  //and now for those four weird shapes that appear near the centre circle
  //the locations are measured to closest whole number from their precise location, then with a -1 or +1 for select points because the stroke was bleeding into the red diamond
  stroke (255);
  strokeWeight (4);
  line (282, 246, 282, 215);
  line (246, 282, 215, 282);
  line (282, 215, 215, 282);

  line (318, 246, 318, 215);
  line (354, 282, 384, 282);
  line (318, 215, 384, 282);

  line (354, 318, 384, 318);
  line (318, 353, 318, 384);
  line (384, 318, 318, 384);

  line (282, 353, 282, 384);
  line (246, 318, 215, 318);
  line (282, 384, 215, 318);

  strokeWeight (0);
} 



