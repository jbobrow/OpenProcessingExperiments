
//This sketch creates an interactive shape/color animation by
//changing the scale/color of two simple polygons (4-branch stars).
//Oscillations are introduced using an elementary combination
//of trigonometric function and the use of mouseX and mouseY.

//Interactive controls are:

//Start & Stop => (simple mouse click) - It needs approx. 2 seconds to start !!!
//Mouse pos.   => The position of the mouse pointer influences the geometry of the drawing
//'e' or 'E'   => Erase/reset function 
//"b' or 'B'   => Change the color of the background to black
//'w' or 'W'   => Change the color of the background to white
//'s' or 'S'   => Saving of a Screenshot controlled by keyPressed ('s' or 'S')
//                The screenshot is saved as screenshot.png in the sketch folder
//                (Please remind that You need first to save the sketch in a new folder)

//Thank you for your review. (xberthet@gmail.com)

//Global variables
int x=200,z=0;
float y=0.1;
boolean xaxis=false;

//Setup function
void setup() {
  size(1000,600);
  background(255);
  smooth();
  frameRate(60);
}

//Draw function
void draw() {

  if (xaxis) {
  scale(cos(y)-sin(y) + 2*tan(y), -cos(x)+ sin(y) + (3)*tan(y));
  fill(int(random(255)),int(random(255)),int(random(255)), 37);
  noStroke();
  
  //Shape 1: 4-branches star
  beginShape();
  vertex(mouseX,z);
  vertex(z+200,mouseX+100);
  vertex(z+400,z);
  vertex(mouseY+300,z+200);
  vertex(x+200,x+300);
  vertex(z,z+400);
  vertex(z+100,z+200);
  endShape(CLOSE); 
  
  //Shape 2: 
  beginShape();
  vertex(x,mouseX);
  vertex(x+20,x+10);
  vertex(x+400,mouseY);
  vertex(x+300,x+200);
  vertex(x+400,mouseX+400);
  vertex(x+200,x+300);
  vertex(mouseY,x+400);
  vertex(x+100,x+200);
  endShape(CLOSE);
  
//variation of the y variable controlling the scaling process.
//actualized 60 times per second (see "frameRate")
  y-=0.02;
}
}

//Start & stop of animation controlled by mousePressed
void mousePressed() {
  xaxis = ! xaxis;
  y+=0.02;
}

//Keyboard inputs
//Screenshot controlled by keyPressed ('s' or 'S')
//Erase/reset function controlled by pressing the'e' or 'E'
//Change the color of the background to black("b' or 'B') or white ('w' or 'W')
void keyPressed() {
  if (key=='s' || key=='S') saveFrame("screenshot.png");
  if (key=='e' || key=='E') {
    xaxis=false;
    background(0);
  }
  if (key=='b' || key=='B') background(0);
  if (key=='w' || key=='W') background(255); 
}
//End of code
