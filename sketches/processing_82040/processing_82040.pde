
int t;

void setup()
{
size(200, 200);
background(255);
smooth();
}

void draw()
{
t+=10;
stroke(30, 0, 150, 50);
noFill();

float x1 = width*noise(0.00345*t-12);
float x2 = width*sin(0.00567*t-32);
float x3 = width*noise(0.001123*t-56);
float x4 = width*cos(0.00121*t-12);

float y1 = height*cos(0.0021*t-81);
float y2 = height*noise(0.00322*t-26);
float y3 = height*sin(0.0041*t-44);
float y4 = height*noise(0.001576*t-32);

bezier(x1, y1, x2, y2, x3, y3, x4, y4);
}
