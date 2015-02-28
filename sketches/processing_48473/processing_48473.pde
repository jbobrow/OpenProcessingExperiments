
void setup()
{
  size( 400, 600);
  image( loadImage ("snowflake-01.gif"),  mouseX, mouseY);
  
  smooth();
  textAlign(CENTER);
  frameRate(10);
  
}


void draw()
{
  
  textSize(40);
  fill(23, 10, 46);
  
  
  text("Let It Snow!", width/2, height/2);


  fill(170, 72, 72);
  fill(68, 151, 172);
  ellipse(mouseX, mouseY, 7, 7);
  

}
  



