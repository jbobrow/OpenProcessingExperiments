
float sx = 0;

void setup ()
{
size (500,500);
}



void draw ()
{
background (255,255,255);
pushStyle();
fill (240, 163, 63, 30);
rect (0,0, 40,500);
rect (460,0, 500,500);
popStyle();

translate (sx,0);
ellipse (100,100,5,5);

textSize (32);
fill (0, 0, 255);
text (mouseX, 200,200);
text (sx, 300,300);

if (mouseX < 40) {
  sx = sx + 1;
  }

else if (mouseX > 460) {
  sx = sx - 1;
  }


  
}
