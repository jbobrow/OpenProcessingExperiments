


void setup()
{
size(250, 250);
stroke (#3bb6fd);
smooth();
fill(0, 15);
frameRate(10); // 24 or 30 make the frame rate smooth
}

int x=0;     // causes it to repeat itself
int y=0;

void draw ()
{ 
x=x+5;
if (x>500){x=0;} // causes it to repeat through the screen
background (255);
ellipse (x, 175, 50, 50);
ellipse(x, 20, 30, 30);
ellipse(x, 80, 60, 60);
ellipse(x, 250, 40, 40);
ellipse(160, 60, 30, x);
ellipse(200, 60, 30, x);
ellipse(100, 60, 30, x);
bezier(x, x, 200, 160, 180, 70, 240, x);
bezier(10, 10, 80, 90, 200, 20, 12, x);
bezier(x, 20, 40, 80, 100, x, 12, 30);



//ellipse(250, 60, 30, x);
}

