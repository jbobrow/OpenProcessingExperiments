
/* Keya Vadgama
YSDN 
Winter 2012
Reference: http://www.openprocessing.org/sketch/50651
*/
float kv;
float x;
float y;
 
float r;// colors for bubbles when mouse is clicked
float g;
float b;
float a;
 
float ktv;
float w;
float z;

float dotX = 2000;
float dotY = 2000;

float R;// colors for mirroring circles
float G;
float B;
 
void setup ()
{
  size (400, 400);
  background (215, 255, 220);
  smooth ();
  frameRate (30);
  kv = 200;
  x = 120;
  y = 200;
}
 
void draw ()
{
   if (mousePressed) { //if mouse is pressed randomly sized and coloured circles will appear
     r = random (255);
     g = random (255);
     b = random (255);;
     a = random (255);
     ktv = random (200);
     w = random (width);
     z = random (height);
     noStroke ();
     fill (r, g, b, a);
     ellipse (w, z, ktv, ktv);
   }
 
     R = (255);
     G = (0);
     B = (255);
     noStroke();
  
      dotX = (mouseX-dotX)/7 + dotX;//black and white dotted paths will follow mouse movements and mirror eachother
      dotY = (mouseY-dotY)/7 + dotY;
      fill(R);
      ellipse(dotX,dotY,20,20);
      fill(G);
      ellipse(dotY,dotX,30,30);
        
}

void keyPressed (){ //when space bar is pressed background clears to this color and restarts animation
  if (key == ' ');
  {
   background (215, 255, 220);
  } 
}
  
