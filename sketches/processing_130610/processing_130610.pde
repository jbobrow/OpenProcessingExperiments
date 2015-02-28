
float rad = 0.0;
float s= 1.0;
float timer = 0.0;
int dim; 

void setup()
{
  size (500, 500);
  frameRate(30);
  background(255,255,255);
}

void draw()
{
  rad = rad + 1.0;
  s = s + 0.002;
  timer = timer + (1.0/30.0);
  if(timer > 0.0 && timer < 15.0)
  {
  pushMatrix();
  fill (random(255), random(255), random(255), random(255));
  translate(width/2, height/2);
  rotate(rad);
  scale(s);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  }
  else if (timer > 15.0 && timer < 20.0)
  {
    pushMatrix();
    
    
    fill(random(255), random(255), random(255), random(255));
    translate(width/2, height/2);
    rotate (-rad);
    scale(s);
    ellipseMode(CORNER);
    ellipse(25, 25, 50, 50);
    popMatrix();
  }
  else if (timer > 20.0 && timer < 25.0)
  {
    pushMatrix();
    
    
    fill(random(255), random(255), random(255), random(255));
    translate(width/2, height/2);
    rotate (rad);
    scale(s);
    ellipseMode(CORNER);
    ellipse(25, 25, 50, 50);
    popMatrix();
  }
  else if (timer > 25.1)
  {
    pushMatrix();
    
    noStroke();
    fill(random(255), random(255), random(255));
    translate(width/2, height/2);
    scale(s+1);
    ellipseMode(CENTER);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }

 
}




