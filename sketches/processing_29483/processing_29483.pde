
int xpos;
int ypos;
int interval;
int gradientWidth, gradientHeight;
float S;
float Y;
float O;
// medida
void setup() {
size(600,600);
background(0);
smooth();
 }
 
 void draw () {
   
      S = random (255);
      Y = random (255);
      O = random (255);
// define variable values
interval = 255/5;
// radial width/height
gradientWidth = gradientHeight = width;
//radial center pt
xpos = mouseX;
ypos = mouseY;
noStroke();
//create ellipses
fill(interval);
ellipse(xpos, ypos, gradientWidth, gradientHeight);
fill(interval*2);
ellipse(xpos, ypos, gradientWidth-interval, gradientHeight-interval);
fill(interval*3);
ellipse(xpos, ypos, gradientWidth-interval*2,gradientHeight-interval*2);
fill(interval*4);
ellipse(xpos, ypos, gradientWidth-interval*3,gradientHeight-interval*3);
fill(interval*5);
ellipse(xpos, ypos, gradientWidth-interval*4,gradientHeight-interval*4);
 }


void mousePressed(){

  background(S,Y,O);
   }

