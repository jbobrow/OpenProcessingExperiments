
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

ellipse(mouseX, mouseY, 100, 100);

if (x + 50 > SW && y + 50 >SH)
{
    x= SW/2;
    Y= SH/2;
     background( 255 );
    ellipse (x, y, 100, 100);
   
} 


}
