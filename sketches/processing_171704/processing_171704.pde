
void setup()
{

  size(500,500);
  background(0);
  

}


void draw()
{
  fill(255);
  stroke(0);
  translate(width/2,height/2);
  rotate(radians(millis())*20);
  rect(0,0,200,200);
  
  fill(0);
  stroke(255);
  rotate(radians(millis())*2);
  rect(0,0,150,150);
  
  
  
  
  
  
}
