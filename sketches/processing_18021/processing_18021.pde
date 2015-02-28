
   //canvas size
int sizeX = 200;
int sizeY = 200;
  //ellipse variables
int circleX = 57;
int circleY = 50;
int circleW = 5;
int circleH = 5;
float diam = int(random(30,45));
  //triangle variables
int triangleA = 57;
int triangleB = 70;
int triangleC = 60;
int triangleD = 73;
int triangleE = 54;
int triangleF = 73;
  //rectangle variables
int rectX = 70;
int rectY = 40;
int rectW = 60;
int rectH = 30;
  // line variables
int lineA = 57;
int lineB = 73;
int lineC = 57;
int lineD = 113;
int colorR = 173;
int colorG = 141; 
int colorB = 149;
  //background color variables
float r = random (0,255);
float g = random (0,255);
float b = random (0,255);
float a = random (0,255);

void setup () {
  size (sizeX,sizeY);
  background (159,175,160);
  smooth();
  }
 void draw () {
  
   //balloons change size each time sketch is played
fill (colorR,colorG,colorB);
stroke (colorR,colorG,colorB);
line (lineA,lineB,lineC,lineD);
fill (255,mouseX,mouseY);
stroke (255,mouseX,mouseY);
ellipse (circleX,circleY,diam,diam);
triangle (triangleA,triangleB,triangleC,triangleD,triangleE,triangleF);
  
  //balloon 2
fill (colorR,colorG,colorB);
stroke (colorR,colorG,colorB);
line (lineA-7,lineB-8,lineC-7,lineD);
fill (mouseX,mouseY,255);
stroke (mouseX,mouseY,255);
ellipse (circleX-7,circleY-10,diam,diam);
triangle (triangleA-7,triangleB-10,triangleC-7,triangleD-9,triangleE-7,triangleF-9);

  //head
fill (126,44,242);
stroke (126,44,242);
ellipse (circleX+43,circleY-15,circleW+55,circleH+30);
rect (rectX,rectY,rectW,rectH);
  
  //eyes change size depending on mouse location
if (mouseX < width/3) {
   fill(0);
   stroke(255);
   ellipse (circleX+28,circleY-5,circleW,circleH);
   ellipse (circleX+58,circleY-5,circleW,circleH);  
} else if (mouseX < 2*width/3) {
   fill(255);
   stroke(255);
   ellipse (circleX+28,circleY-5,circleW+4,circleH+4);
   ellipse (circleX+58,circleY-5,circleW+4,circleH+4);
   fill(0);
   noStroke();
   ellipse (circleX+28,circleY-5,circleW+1,circleH+1);
   ellipse (circleX+58,circleY-5,circleW+1,circleH+1);
} else {
   fill(255);
   stroke(255);
   ellipse (circleX+28,circleY-5,circleW+7,circleH+7);
   ellipse (circleX+58,circleY-5,circleW+7,circleH+7);
   fill(0);
   noStroke();
   ellipse (circleX+28,circleY-5,circleW+4,circleH+4);
   ellipse (circleX+58,circleY-5,circleW+4,circleH+4);
}

  //body
fill(126,44,242);
stroke (126,44,242);
rect (rectX-3,rectY+40,rectW+6,rectH+40);

  //arms
quad (67,93,67,113,52,120,45,102);
quad (133,93,155,102,148,120,133,113);

  //feet
rect (rectX,rectY+110,rectW-40,rectH-10);
rect (rectX+40,rectY+110,rectW-40,rectH-10);

  //heart expands depending 
if (mouseX < width/2) {
   fill(242,27,34);
   stroke (242,27,34);  
   ellipse (circleX+55,circleY+45,circleW,circleH);
   ellipse (circleX+61,circleY+45,circleW,circleH);
   triangle (triangleA+52,triangleB+26,triangleC+59,triangleD+25,triangleE+61,triangleF+32);
   } 
else {
   fill(242,27,34);
   stroke (242,27,34);  
   ellipse (circleX+55,circleY+45,circleW+3,circleH+3);
   ellipse (circleX+63,circleY+45,circleW+3,circleH+3);
   triangle (triangleA+51,triangleB+28,triangleC+64,triangleD+25,triangleE+62,triangleF+32);
   }
 }
 
  // background color shift when press mouse
void mousePressed () {
  background (r,g,b,a);
  } 
void mouseReleased () {
  background (211,102,193);
  }
       
                
