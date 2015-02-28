
size (200, 200);
background (255);
noStroke ();
noFill ();

int i = 50;
while (i > 5) 
{
fill (i*10, i*8, 80 );
ellipse(width/2,height/2, i*4, i*4);
i-= 1;
}
