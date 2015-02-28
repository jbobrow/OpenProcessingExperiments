

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  //frameRate(8);
}

void draw()
{
  fill(random(255), random(106), random(255), random(106));
 stroke(random(121),random(249),random(255));
  strokeWeight(random(2));
  line(width/2,height/2,mouseX,mouseY);
  ellipse(mouseX,mouseY, 100,100);
  rectMode(CENTER);
  rect(pmouseX,pmouseY,mouseX,mouseY);
}


