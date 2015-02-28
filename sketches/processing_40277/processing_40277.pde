
//Set up; Size, background
void setup()
{
  size(300, 200);
  background(255);
  smooth();
 
 //Make the smile 
  stroke(0);
  arc(105, 105, 100, 50, 0,  PI);
  
  //Right eye
  noFill();
  ellipse(80, 50, 15, 15);
  
  //Left eye
  noFill();
  ellipse(130, 50, 15, 15);
}

