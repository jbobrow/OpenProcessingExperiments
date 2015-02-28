
void setup()
{
  background (100);
size (200,200);
}
void draw()
{if (mouseX < width/2-10 || mouseX > width/2 +10 || mouseY< height/2-10 || mouseY >height/2+10)
 {background (100);
 int x,y ;
 x=mouseX;
  y=mouseY;
  ellipseMode (CORNER);
  ellipse (x,y,30,30);
 }
}

