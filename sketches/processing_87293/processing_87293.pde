
//Copyright Yaakov Lyubetsky / ylyubets@andrew.cmu.edu / Januray 24th, 2013
//Homework #4 - Processing for the Arts

//The random letters follow your mouse as you move it around
//Clicking creates random lines in all directions that all meet at the mouse

//Hitting space changes the background to a random color, and also
//generates random points of a random color

//Hitting 'x' changes the location of the letters to a random x,y position

float x, y, wd, ht, easingCoef;
PFont font;

void setup()
{
   size(400, 400);
  x = 1;
  y = height * .5;
  wd = width * .2;
  ht = height * .2;
  
  font = loadFont("Futura-ExtraBold-48.vlw");  
  easingCoef = .1;
  frameRate(15);
  background(0);
  noStroke();
  smooth();
}

void draw()
{
   fill(0, 30);
   rect(0, 0, width, height);
   
   float distX = mouseX - x;
   float distY = mouseY - y;
   
   x = x + (distX * easingCoef);
   y = y + (distY * easingCoef);
   
   int ci = int(random(65, 90));
   char c = char(ci);
   
   fill(200, 0, 0);
   textFont(font, random(x,y));
   text(c, x, y);
   
   //if(keyPressed) saveFrame("hw4.jpg");
}

void mousePressed()
{
   if(mousePressed == true)
   {
     stroke(134, 7, 7);
     strokeWeight(3);
     for(int i = 0; i < 30; i++)
     {
       line(random(width), random(height), mouseX, mouseY);
       line(mouseX, mouseY, random(width), random(height));
     }
   }
}

void keyPressed()
{
  if(key == ' ')
  {
    background(random(255), random(255), random(255));
    for(int i = 0; i < 50; i++)
     {
       fill(random(255), random(255), random(255));
       point(random(width),random(height));
     }
  } 
  if(key == 'x')
  {
     x = random(width);
     x = random(height); 
  }
}
