
float counter=0;
void setup()
{ colorMode(HSB,360,100,100);
  size(250,500);
  background(0);
}

void draw()
{
  background(0);
  float size=map(sin(counter),-1,1,50,100);
  
  float pulse=map(mouseY,0,500,0.01,0.2);
  
  float amplitude=map(sin(counter),-1,1,180,240);
  fill(amplitude,100,100);
  
  ellipseMode(CENTER);
  ellipse(125,50,size,size);
  
  ellipse(125,150,size,size);

  ellipse(125,250,size,size);

  ellipse(125,350,size,size);
  
 
  ellipse(125,450,size,size);
  
  println(sin(counter));
  counter+=pulse;
 
 
 
}
