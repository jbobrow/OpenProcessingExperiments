
int y;
int y1;
 
void setup()
{
size (250, 250);
background(255);
stroke(#C1BDBD);
fill(#C4F0E1);
}
 
void draw()
{
y = 10;
y1 = 20;
 
for(int x = 0; x < width; x = x + 30)
{
for(int c1 = 0; c1 < height; c1 = c1 + 40)
{
rect(x, c1 , 10, 20);
}
}
 
for(int x1 = 10; x1 < width; x1 = x1 + 30)
{ 
for(int c1 = 0; c1 < height; c1 = c1 +40 )
{
rect(x1, y + c1, 10, 30);
}
}
 
for (int x2 = 20; x2 < width; x2 = x2 + 30)
{
for(int c1 = 0; c1 < height; c1 = c1 +40) 
{ 
rect(x2, y1 + c1, 10, 10);
}
}
}



