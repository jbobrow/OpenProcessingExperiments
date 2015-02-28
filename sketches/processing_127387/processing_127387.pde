
int x = 0;

void setup()
{
  size(400,400);
  background(255,255,255);
  
  strokeWeight(2);
  line(0,400,200,200);
  
  strokeWeight(10);
  stroke(0,0,25);
  line(0,0,200,200);
  line(200,200,0,400);
  
  strokeWeight(5);
  stroke(255,0,0);
  rect(10,10,10,10);
  noStroke();
  fill(0,255,0);
  rect(20,20,20,20);
  rect(30,30,30,30);
  rect(40,40,40,40);
  rect(50,50,50,50);
  
  fill(0,255, 255);
  ellipse(200,200,100,10);
  triangle(50,50,75,0,100,50);
  
  arc(300,300,100,100,0,PI/2);
}
/*void draw()
{
  x = x+1;
  background(x);
}
*/



