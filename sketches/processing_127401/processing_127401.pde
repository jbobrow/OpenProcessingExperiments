


int counter = 0;

void setup ()
{
  size (400,400);
  background (255);
  
  strokeWeight(10);
  line (0,0,400,400);
  strokeWeight(5);
  stroke(255,0,255);
  line (0,100,400,400);
  
  strokeWeight(15);
  noStroke();
  fill(0,150,200);
  rect(200,200,200,200);
  
  fill(255,0,100);
  ellipse (200,200,50,50);
  
  fill ( 100, 50, 40);
  triangle(50, 50, 75,0,100,50);
  
  strokeWeight(1);
  stroke(0);
  fill (160);
  point (0, 300);
  
  quad(38,31,86,20,69,63,30,76);
  
  arc (300,300,100,100, 0, TWO_PI);
  
}





