
int Y;
int X;

void setup()
{
size(800,800);
Y = 400;
X = 400;
}

void draw()
{
ellipse(X,Y,20,20);
if(key == 'w' || key == 'W')
{
Y--;
}
if(key == 's' || key == 'S')
{
Y++;
}
if(key == 'a' || key == 'A')
{
X--;
}
if(key == 'd' || key == 'D')
{
X++;
}
}



