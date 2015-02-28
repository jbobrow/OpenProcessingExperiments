
void setup()
{
  size(600, 600);

  background(0, 170, 0);
  frameRate(15);
}

void draw()
{
  stroke(0, 0, 0);
  line(mouseX, mouseY, pmouseX, pmouseY);
  noStroke();
  fill(random(255), random(255), random(255));
  ellipse( mouseX, mouseY, 20, 20);



  fill(255, 255, 255);
  triangle(0, 0, 300, 0, 0, 600);
  triangle(600, 0, 300, 0, 600, 600);
  rect(0,450,600,150);
  
  fill(105, 50, 0);
  rect(250,450,100, 250);
}
