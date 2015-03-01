
float counter = 0;


void setup()
{
  size(500,500);
  background(255);
  colorMode(HSB,360,100,100);
}

void draw()
{
  float helligkeit = map(mouseX,0,width, 0, 80);
  float saettigung = map(mouseX,0,width,0,47);
  background(291,saettigung,83);
  
float colour = map(sin(counter),-1,1,289,299);
float transparenz = map(sin(counter),-1,1,10,100);
float toblack = map(mouseX,0,width,1,100);
float mousespeed = map(mouseX,0,width,0.01,0.2);
float position = map(sin(counter),-1,1,-mouseX/5,mouseX/5);


translate(width/2,height/2);
fill(colour,transparenz,toblack);
noStroke();
ellipse(0,position,200,200);

counter += 0.1;
println(sin(counter));
}
  
