
void setup()
{
size(600,600);
background(1,23, 126);
}
void draw()
{
  fill(1,23,126,75);
  rect(0, 0, width, height);
  
  fill(255);
  ellipse(300, 500, 200, 200);
  ellipse(300, 350, 150, 150);
  ellipse(300, 250, 100, 100);
  
  fill(0,0,0);
  ellipse(300, 375, 25, 25);
  ellipse(300, 340, 25, 25);
  ellipse(300, 410, 25, 25);
  ellipse(300, 310, 25, 25);
  
  ellipse(285, 230, 15, 15);
  ellipse(315, 230, 15, 15);
  
  stroke(0,0,0);
  line(350, 325, 500, 200);
  line(250, 325, 100, 200);
  line(280, 260, 320, 260);
  
  stroke(255);
  strokeWeight(5);
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height)); 
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));
}

