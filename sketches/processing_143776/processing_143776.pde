
void setup()
{
size(500, 500);
background(0);
}
 
int grad = 45;
 
void draw()
{
 
  float pos = (mouseY);
  translate(width/2, height/2);
  noFill();
  rotate(pos/1);
  grad++;
  println(grad);
  stroke(155, 100, 220);
  rectMode(CENTER);
 
   
  rect(50, 50, 150, 150);
  ellipseMode(CENTER);
  strokeWeight(1);
  stroke(215, 10, 10);
  ellipse(50, 50, 300, 300);
   
  rect(30, 30, 30, 30);
  ellipseMode(CENTER);
  rotate(PI);
  strokeWeight(5);
  stroke(random(50), random(100), random(100), random(100));
  //stroke(100, 100, 180);
  ellipse(20, 20, 200, 200);
  
 
}
