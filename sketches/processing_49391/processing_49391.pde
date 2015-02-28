
void setup()
{
  size(400,600);
  background(255,255,255);
  smooth();
  frameRate(20);
}
void draw()
{
  background(255,255,255,50);
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,50,50);

}  


                
