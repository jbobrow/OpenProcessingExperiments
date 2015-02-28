
void setup()
{
  size(600,600);
  background(0,0,0);
  frameRate(10);
}

void draw()
{
  noStroke();
  fill(255,255,255);
  ellipse(width/2, 200, 80,80);
  ellipse(width/2, 290, 120,120);
  ellipse(width/2, 425, 175,175);
  fill(0,0,0);
  ellipse(280,185, 10,10);
  fill(0,0,0);
  ellipse(318,185, 10,10);
  fill(240,114,36);
  triangle(235,225,290,195, 305,215);
  
  strokeWeight(3);
  stroke(129,64,23);
  line(350, height/2, 450,250);
  line(250, height/2, 150, 250);
  
  strokeWeight(1);
  stroke(0,0,0);
  fill(random(255),random(255),random(255));
  ellipse(width/2, height/2, 10,10);
  fill(random(255),random(255),random(255));
  ellipse(width/2, 275, 10,10);
  fill(random(255),random(255),random(255));
  ellipse(width/2, 250, 10,10);
  
  fill(255,255,255);
  rect(0,510, 600,250);
  fill(random(255),random(255), random(255));
  triangle(280,165,width/2,125, 318,165);
  fill(random(255),random(255),random(255));
  ellipse(width/2,120,15,15);
}
