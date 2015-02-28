
void setup()
{
  size(600, 600);
  background(0, 0, 0);
}

void draw()
{
  frameRate(random(4,15));
  stroke(random(116, 175), random(45, 67), 0);
  strokeWeight(.5);
  fill(random(214, 225), random(133, 167), random(45, 50));
  triangle(270,600, 330,600, random(245, 355),random(400, 575));
  triangle(random(230,235),600, random(290,300),600, random(205, 315),random(400, 575));
  triangle(random(300,310),600, random(365,370),600, random(285, 395),random(400, 575));
  smooth();
  stroke(160,160,160);
  fill(random(135,170), 160, 160);
  strokeWeight(8);
  line(pmouseX, pmouseY, mouseX, mouseY);
  fill(0,0,0, 100);
  noStroke();
  rect(0,0,600,600);
}

