
void setup()
{
size(500, 500);
background(0);
}

int grad = 0;

void draw()
{

  float pos = (mouseY);
  translate(width/2, height/2);
  noFill();
  rotate(pos/1);
  grad++;
  println(grad);
  stroke(255, 200, 120);
  rectMode(CENTER);

  
  rect(0, 0, 50, 50);
  ellipseMode(CENTER);
  strokeWeight(1);
  stroke(215, 10, 10);
  ellipse(50, 50, 300, 300);
  
  rect(0, 0, 50, 50);
  ellipseMode(CENTER);
  rotate(PI);
  strokeWeight(5);
  stroke(random(50), random(100), random(100), random(100)); 
  //stroke(100, 100, 180);
  ellipse(50, 50, 500, 500);
 

}
