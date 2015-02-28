
int a,b,x,y;

void setup()
{ size(400,400);
background (0);
smooth ();

}

void draw()
{a =(a-1) % 40;
b = (b-1)% width;
//background (0);pianeta avatar
  fill(0,0,255);
  ellipse (mouseX, mouseY,a,b);
  
  fill(255,0,0);
   ellipse (mouseX, mouseY,30,30);
}

