
int a = 0;
int b = 5;
void setup()
{size(700,400);
background(255);
}

void draw()
{noFill();
stroke(166,20,20,40);
strokeWeight(8);
smooth();
ellipse(width/2, height/2, b, b);
smooth();}

void mouseDragged()
{b = b + 10;
if (b > 1000) 
{b = 100;}}

