
int counter = 0;

void setup()
{
  size(400,400);
  background(#C774E5);
  
  strokeWeight(10);
  line(0,0,400,400);
  
  strokeWeight(1);
  line(0,100,400,300);
  
  stroke(#0000FF);
  line(0,200,400,200);
  
  stroke(#00FF00);
  line(0,300,400,100);
  
  stroke(#000000);
  line(0,400,400,0);
  
  stroke(#FFFFFF);
  noFill();
  rect(150,150,100,100);
  
  fill(#000000);
  ellipse(200,200,100,50);
  
  triangle(80,10,0,50,80,90);
  
  strokeWeight(10);
  point(300,300);
}


