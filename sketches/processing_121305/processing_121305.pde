
float counter = 0;

void setup()
{
  size(400,400);
}

void draw()
{
  
  noStroke();
  fill(97);
  rect(0,0,400,200);
  fill(20,83,36);
  rect(0,200,400,200);
  
 
  
  
  translate(width/2,height/2);
  
  pushMatrix();
  translate(cos(counter)*100, sin(counter)*100);
  colorMode(HSB,300,100,100);
  float a = map(sin(counter),-1,1,-10,140);
  fill(20,a,36);
  ellipse(0,0,50,50);
  popMatrix();
  
  counter += 0.030;
  
}

