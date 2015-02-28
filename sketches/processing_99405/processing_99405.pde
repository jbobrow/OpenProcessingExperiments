
boolean isRed;
int x;
int y;

void setup() 
{
isRed = true;
size(400, 400);
fill( 255, 0, 0 );
}

void draw() 
{
background( 255 );
int x= (int) mouseX;
int y= (int) mouseY;


if(x<320 && y<320)
{
ellipse(mouseX, mouseY, 80, 80);
int x=0;
int y=0;
}
else
{
int w=300-x
int t= 300-t
ellipse(x, y, 80, 80);
int x=0;
int y=0;
//mouseX<=320;
//mouseY<=320;
}

if( isRed )
{
fill( 0, 0, 255 );
isRed = !isRed; 
}
else
{
//fill( 255, 0, 0 );
//isRed = !isRed; 
}



}
