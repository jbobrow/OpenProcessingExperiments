
float rad = 0.0;
float s = 1.0;

void setup()
{
  size(500, 500);
}

void draw()
{
  rad = random(-3, 3);//rad + 0.1;
  s = s + 0.001;
  fill(random(255), random(255), random(255), random(255));
  
  pushMatrix();
  
  translate(width/2, height/2);
  rotate(rad);
  scale(s);
  
  rectMode(CORNER);
  rect(0, 0, 100, 100);
  
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  
  popMatrix();
  
  
  pushMatrix();
  
  translate(100, 100);
  rotate(radians(45));
  scale(2);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  
  popMatrix();
}

