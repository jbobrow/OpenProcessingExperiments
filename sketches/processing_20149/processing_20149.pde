
//Combining transformations
float angle = 0.0;
void setup()
{
  size(500,500); 
  background(255);
  smooth();
}

void draw()
{

  pushMatrix();
  translate(mouseX,mouseY); 
  rotate(angle);

  fill(255);
  rect(-50,-50, 100,100);

  angle+=0.1; //try commenting this line out, 
  //and un-commenting the line below
  //angle = atan2(mouseY-height/2,mouseX-width/2);
  
  popMatrix();

}


