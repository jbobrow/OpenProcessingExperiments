
float kv;
float x;
float y;
 
float r;
float g;
float b;
float a;
 
float ktv;
float w;
float z;

float dotX = 2000;
float dotY = 2000;

float R;
float G;
float B;
 
void setup ()
{
  size (400, 400);
  background (255, 75, 100);
  smooth ();
  frameRate (30);
  kv = 200;
  x = 120;
  y = 200;
}
 
void draw ()
{
   if (mousePressed) {
     r = random (255);
     g = random (10);
     b = random (255);
     a = random (10,100);
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
  
  dotX = (mouseX-dotX)/7 + dotX;
  dotY = (mouseY-dotY)/7 + dotY;
  fill(R);
  ellipse(dotX,dotY,20,20);
  fill(G);
  ellipse(dotY,dotX,30,30);
  
  fill(R);
  ellipse(dotX/2,dotY/2,10,10);
  fill(G);
  ellipse(dotY/2,dotX/2,10,10);

}

void keyPressed (){
  if (key == ' ');
  {
   background (215, 255, 220);
  } 
}
  
