
boolean button = false;

int x = 100;
int y = 100;
int w = 200;
int h=150;

void setup ()
{
  size (400,400);
}

void draw ()
{ if (button)
{background (75,75,75);
stroke (0);
}
else { background (0);
stroke (255);
}
fill (255);
rect (x,y,w,h);
}


void mousePressed ()
{ if (mouseX > x && mouseX < x+w && mouseY> y && mouseY < y+h)
{button = !button;}
}

