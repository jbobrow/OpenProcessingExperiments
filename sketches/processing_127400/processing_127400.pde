
int counter = 0;

void setup()
{
  size (400, 400);
  background (256, 0, 0);
  background (#5D6BB4);
  //background (0);
  
  strokeWeight(10);
  stroke(0, 0, 256);
  line(0, 0, 400, 400);
  
  strokeWeight(1);
  stroke(0, 0, 255);
  line(20, 100, 0, 200); 
  
  noStroke(); //gets rid of outline
  fill(20, 102, 0); //rgb
  rect(50, 50, 40, 40);
  
  fill(200, 102, 0); //rgb
  ellipse(200, 200, 40, 40);
  
  triangle(75, 100, 150, 200, 205, 200); //triangle(x1, y1, x2, y2, x3, y3);
  
  strokeWeight(10);
  point(300, 300);
  
  arc(300, 300, 100, 100, 0, PI/2); //radians(45);
}




