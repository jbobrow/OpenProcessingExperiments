
float counter = 0;

void setup()
{
  size(500,500);
  smooth();
  colorMode(HSB,360,100,100);
}

void draw()
{
  background(248,mouseY,100);
  
  translate(width/2,height/2);
  ellipse(0,sin(counter)*100,50,50);
  ellipse(-50,cos(counter)*100,50,50);
  ellipse(+50,cos(counter)*100,50,50);
  ellipse(-100,sin(counter)*100,50,50);
  ellipse(+100,sin(counter)*100,50,50);
  fill(359,mouseY,100);

  counter += 0.1;
  
}
