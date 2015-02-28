
void setup()
{
  size(400,600);
  background(0,0,0);
  smooth();
  frameRate(10);
  textSize(45);
}
void draw()
{
  fill(0,0,0,75);
  stroke(255,255,255);
  line(0,0,mouseX,mouseY);
  
  textAlign(CENTER);
  text("School's Out!",200,100);

  textAlign(BOTTOM) ;
  text("IT'S SUMMER!", 100, 400);
}
