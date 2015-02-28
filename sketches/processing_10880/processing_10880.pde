
float r;
float g;
float b;

float diam;
float x;
float y;



void setup () 
{
size (300,169);
background(0);
smooth();
}



void draw ()
{  
r = random(255);
g = random(255);
b = random(255);
diam = random(40);
x = random(width);
y = random(height);
 noStroke();
}

void mousePressed ()
{
  noStroke();
 fill(r,g,b);
 ellipse(x,y,diam,diam);
}




