
//Copyright Yaakov Lyubetsky / ylyubets@andrew.cmu.edu / Januray 22nd, 2013
//Homework #3 - Processing for the Arts

//variables
float x, y, wd, ht, easingCoef;
PFont font;
//function definitions
void setup()
{
  size(400, 400, P3D);
  x = 1;
  y = height * .5;
  wd = width * .2;
  ht = height * .2;
  
  easingCoef = .1;
  
  font = loadFont("Futura-ExtraBold-48.vlw");  
  
  frameRate(15);
  background(255, 189, 64);
}

void draw()
{
   fill(255, 189, 64, 30);
   rect(0, 0, width, height);
   
   float distX = mouseX - x;
   float distY = mouseY - y;
   
   x = x + (distX * easingCoef);
   y = y + (distY * easingCoef);
   float z = random(1, 100);
   float r = random(0, 2);
   float s = random(1,30);
   
   fill(255, 249, 64);
   
    lights();
    translate(x, y, z);
    rotateY(r);
    box(s);
   
   if(keyPressed) saveFrame("hw3_v2.jpg");
}

