
PShape mocalogo;


void setup()
{
 size (800, 800);
smooth();
noFill();
frameRate(5);
colorMode(HSB, 360, 80, 50);
noLoop();

mocalogo = loadShape("moca_logo.svg");
}

void draw()
{
 background(360);
  for (int x=0; x< width; x+=160) 
  {
    for (int y=0; y<height; y+=100) 
    {
 color c1 = color(random(0, 100), 80, 50);
// color c2 = color(random(200, 360), 100, 100); // I want the color scheme to change when mouse is pressed
 logo (x, y, c1);
  
    }
  }
}


void logo (float x, float y,  color c1)
{
 pushMatrix();
translate(x, y);
stroke(c1, 255);
strokeWeight(2);
mocalogo.disableStyle();
shape (mocalogo, 10, 10);
popMatrix();
}


void mousePressed()
{
   redraw();
}


