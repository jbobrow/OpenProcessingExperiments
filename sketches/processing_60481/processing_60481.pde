

int x1 = -150;

void setup()
{
size (400, 200);
}

void draw()
{
background (255);

if (x1<150)
{
x1=x1+1;
} 
rect(x1, 80, 50, 80);
}

