
boolean isRed;
int SW=480;
int SH=480;
void setup() 
{
isRed = true;

size(SW, SH);
fill( 255, 0, 0 );

}

void draw() 
{
int x = mouseX;
int y = mouseY;
background( 255 );

if (x-50<0 )
{
    x= 50;
    Y= SH/2;
     background( 255 );
    ellipse (x, y, 100, 100);
   
} 
ellipse(mouseX, mouseY, 100, 100);

}
