
int counter = 0;
void setup()
{
  size(400, 400);
  background(150,145,35);
  
  strokeWeight(5);
  stroke(255,0,0);
  line(0,0,400,400);
  
  line(400,0,400,0);
  
  strokeWeight(10);
  stroke(0,0,255);
  line(20,100,0,200);
  
  noStroke();
  rect(50,50,40,40);
  
  triangle(150,20, 80,50, 75,40);
}




