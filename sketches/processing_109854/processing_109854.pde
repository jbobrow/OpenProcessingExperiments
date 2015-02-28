
int diameter = 8;

void setup()
{
  size(600, 600);
  background(#DE9F00);
  fill(0);
  
  // This is diameter
  // Here's some more comments
  int d = diameter;
  println("d is now " + d);
  float cat = diameter;
  println("cat is now " + d);
  
  diameter = diameter * diameter * diameter;
  println(diameter);
  
  fill(255);
  noStroke();
  ellipseMode(CORNER);
  ellipse(width / 2, height / 2, diameter, diameter);
  rectMode(CENTER);
  stroke(0);
  rect(width / 2, height / 2, 100, 40);
  
  strokeWeight(10);
  line(0,0,width,height);
  strokeWeight(1);
  
  line(100,100,235,350);
}





