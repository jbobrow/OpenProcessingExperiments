

PFont oldstyle;
String twinkle = "twinkle";


float x, y;



void setup()
{
  size(500, 500);
  smooth();

  oldstyle = loadFont("OldStyle1HPLHS-25.vlw");
  textFont(oldstyle);
  textAlign(CENTER, CENTER);

  x=width/2;
  y=height/2;
}

void draw()
{  
   background(5);

  float distText = dist(x, y, mouseX, mouseY);

  if ((distText <= 60) && (mousePressed == true))
  { 
      
      fill(random(50,240));
      text(twinkle, x, y);
    }
 

  else
  {   fill(15);
      text(twinkle, x, y);
  }
}

void mouseReleased()
{
  fill(random(50,240));
      text(twinkle, x, y);
    }
  

