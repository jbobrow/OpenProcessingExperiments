
float time = 0.0;
float increment = 0.01;
void setup()
{
size(400,400);
smooth();
}
void draw()
{
background(255,250,82);
float n = noise(time)*width/2;
time += increment;
fill(255,18,26);
noStroke();
ellipse(3*width/4,height/4,n,n);
ellipse(width/4,height/4,n,n);
ellipse(3*width/4,3*height/4,n,n);
ellipse(width/4,3*width/4,n,n);
}


