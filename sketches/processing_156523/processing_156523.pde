
float timeX = 0.0;
float timeY = 200.0;

float increment = 0.02;
void setup()
{
size(400,400);
smooth();

}
void draw()
{
background(255);
float x = noise(timeX)*width/2;
float y = noise(timeY)*width/2;
timeX += increment;
timeY += increment;

noStroke();
fill(255,250,82);
ellipse(width/2,height/2,width-2,height-2);
fill(0);
ellipse(3*width/4,height/4,x/2,y/2);
ellipse(width/4,height/4,x/2,y/2);
fill(255);
ellipse(3*width/4,height/4,x/4,y/4);
ellipse(width/4,height/4,x/4,y/4);
fill(255,18,26);
ellipse(width/2,3*height/4,200,y/2);


}


