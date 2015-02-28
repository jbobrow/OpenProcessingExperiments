
int x,y;

void setup()
{
size (500,500);
}

void draw()
{

stroke (0,0,0);
strokeWeight (2);
background (255,255,255);
fill (255,233,26);
ellipse (250,250,250,250);
fill (255,255,255);
ellipse (210,210,75,75);
ellipse (290,210,75,75);
fill (0,0,0);
ellipse (210,210,10+mouseX/20,10+mouseX/20);
ellipse (290,210,10+mouseX/20,10+mouseX/20);

line (200,300,300,300);

x=mouseX;
y=mouseY;
fill (222-mouseX/2,31+mouseX/2,31+mouseX/2);
ellipse (x,y,50+mouseX/10,50+mouseY/10);
}


