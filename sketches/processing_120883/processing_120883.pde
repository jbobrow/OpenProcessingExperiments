
float counter = 0;   

void setup()
{
  size(400, 400);
}
 
void draw()
{
  background(0);

  pushMatrix();
 translate (width/2,height/2);
  translate(sin(counter)*60, sin(counter)*55);   
colorMode(HSB,360,100,100);
float h = map(sin(counter), -1,1,70,240);
fill (h,100,100);
ellipse(0, 0, 40, 40); 
  popMatrix();
 
  counter += 0.05;   

  fill (#F6FF05);
  ellipse ( 65,50,60,60);
  ellipse ( 135, 50, 60,60);
  ellipse ( 100, 110, 60,60);
  translate (230,250);
  fill( #0A23F5);
  ellipse ( 50,50,60,60);
  ellipse ( 120, 50, 60,60);
  ellipse ( 85, 110, 60,60);
 


}
