
void setup()
{
  size(400, 600);
  background(0);
  frameRate(10);
}


void draw()
{
  noStroke();
  fill(0, 0, 0, 25);
    rect(0, 0, width, height);
  stroke(255);
  strokeWeight(5);
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));
  
  fill(255); 
  rect(0, 450, 400, 450);
  noStroke();
  fill(255, 255, 255);
  ellipse(200, 400, 150, 150);
  ellipse(200, 300, 125, 125);
  ellipse(200, 200, 100, 100);

  noStroke();
  fill(0, 0, 0);
  ellipse(185, 190, 15, 15);
  ellipse(215, 190, 15, 15);
  ellipse(200, 300, 15, 15);
  ellipse(200, 320, 15, 15);
  ellipse(200, 280, 15, 15);
  noStroke();
  fill(255, 172, 70);
  triangle(200, 200, 200, 220, 240, 202);


  stroke(134, 96, 14);
  line(150, 300, 100, 300);
  line(300, 300, 250, 300);
  line(300, 300, 320 ,275); 
  line(100, 300, 75 ,275); 
  line(100, 300, 75 ,300); 
}
