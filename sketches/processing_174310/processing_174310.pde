
float speed = 0;
 
void setup()
{
  size(500,500);
  smooth();
  colorMode(HSB,360,100,100);
}
 
void draw()
{
  background(255,mouseY,255);
   
  translate(width/2,height/2);
  ellipse(0,sin(speed)*200,100,50);
  ellipse(-50,cos(speed)*200,50,50);
  ellipse(+50,cos(speed)*200,50,50);
  ellipse(-100,sin(speed)*200,50,50);
  ellipse(+100,sin(speed)*200,50,50);
  ellipse(-150,cos(speed)*200,50,50);
  ellipse(+150,cos(speed)*200,50,50);
  ellipse(-200,sin(speed)*200,50,50);
  ellipse(+200,sin(speed)*200,50,50);
  fill(359,mouseY,100);
  fill(359,mouseY,100);
  fill(0,mouseY,255);
  speed += .1;
   
}
