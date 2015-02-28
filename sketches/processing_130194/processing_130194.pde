
float rad = radians(45);
float s = 0.1;
float timer = 0.0;
float sspeed = .01;
float timedChange= 20.0;

void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  frameRate(30);
  
}

void draw()
{
  
  background(timer * timedChange, 100, 100, 255);
  
  timer = timer + (1.0 / 30.0);
  rad = rad + 0.1;
  s = s + sspeed;
  println(timer);
  
  pushMatrix();
  
  translate(width/2, height/2);
  rotate(rad);
  scale(s);
  
  if (s > 5)
  {
    sspeed = -.01;
  }
  else if (s <= 0)
  {
    sspeed = .01;
    timer = 0;
  }
  
  
   fill(random(255), random(255), random(255), random(255));
   stroke(random(255), random(255), random(255), random(255));
   triangle(0, 0, 0, -100, -100, 0);
   
   fill(random(255), random(255), random(255), random(255));
   stroke(random(255), random(255), random(255), random(255));
   triangle(0, 0, 0, 100, 100, 0);
   
   fill(random(255), random(255), random(255), random(255));
   stroke(random(255), random(255), random(255), random(255));
   triangle(0, 0, 0, 100, -100, 0);
   
   fill(random(255), random(255), random(255), random(255));
   stroke(random(255), random(255), random(255), random(255));
   triangle(0, 0, 0, -100, 100, 0);
  
  popMatrix();
  
  pushMatrix();
  
  translate(100, 100);
  rotate(rad + .5);
  scale(2 + sspeed);
  rectMode(CENTER);
  fill(random(255), random(255), random(255));
  noStroke();
  if (timer >= 0 && timer <= 10.0)
  {
    rect(0, 0, 50, 50);
  }
  else if (timer >= 10.0 && timer <= 26.0)
  {
    ellipse(0, 0, 50, 50);
  }
  else if (timer >= 26.0)
  {
    rect(0, 0, 50, 50);
  }
  
  popMatrix();
  
  pushMatrix();
  
  translate(400, 100);
  rotate(rad + .5);
  scale(2 + sspeed);
  rectMode(CENTER);
  fill(random(255), random(255), random(255));
  noStroke();
  if (timer >= 0 && timer <= 10.0)
  {
    rect(0, 0, 50, 50);
  }
  else if (timer >= 10.0 && timer <= 26.0)
  {
    ellipse(0, 0, 50, 50);
  }
  else if (timer >= 26.0)
  {
    rect(0, 0, 50, 50);
  }
  
  popMatrix();
  
  pushMatrix();
  
  translate(250, 400);
  rotate(rad + .5);
  scale(2 + sspeed);
  rectMode(CENTER);
  fill(random(255), random(255), random(255));
  noStroke();
  if (timer >= 0 && timer <= 10.0)
  {
    rect(0, 0, 50, 50);
  }
  else if (timer >= 10.0 && timer <= 26.0)
  {
    ellipse(0, 0, 50, 50);
  }
  else if (timer >= 26.0)
  {
    rect(0, 0, 50, 50);
  }
  
  popMatrix();
  
  if (timer >= 10.0)
  {
    translate(width/2, height/2);
    scale(s);
    fill(random(255), random(255), random(255), random(255));
    stroke(0);
    ellipse(0, 0, 100, 100);
  }
    
  
}


