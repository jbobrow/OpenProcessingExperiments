
float x1 = 0;
float y1 = 0;
float d = 2;
 
void setup()
{
size (250, 250);
background(#DBD4D4);
fill(#FFFAFA);
}
void draw()
{
rectMode(CENTER);
for (float y = height/2; y <= height; y = (y + 20))
{ 
for ( float x = 5; x <= width; x = (x + 20))
{ 
rect( x, y , x1, y1 );
}
x1 = x1-d;
y1 = y1-d;
}
for (float y = 2; y <= height/2; y = (y + 20)){
for (float x = 5; x <= width; x = (x + 20))
{ 
rect(x, y , x1, y1);
}
x1 = x1+d;
y1 = y1+d;
}
}


