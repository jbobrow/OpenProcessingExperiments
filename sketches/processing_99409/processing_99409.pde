
int x = mouseX;
int y = mouseY;
void setup() 
{
isRed = true;
size(480, 120);
fill( 255, 0, 0 );
}

void draw() 
{
background( 255 );

ellipse(mouseX, mouseY, 80, 80);

/*if( isRed )
{
fill( 0, 0, 255 );
isRed = !isRed; 
}
else
{
fill( 255, 0, 0 );
isRed = !isRed; 
}*/

if(mouseX+10>480)
{
x = 40;
y=40;
}
if(mouseX-10<480)
{
x=40;
y=40;
}

if(mouseY+10>480)
{
x=40;
y=40;
}

if(mouseY -10>480)
{
x=40;
y=40;
}
//ellipse(x, y, 80, 80);
}
































