
float timer = 0;
float myScaleSpeed = 0.51;
float rad = 0.0;
float s = 1.85;
float myScale = 2.5;
float hue = 0.10;
float offset = 10;
float rowtate = 0;

void setup()
{
  size(600, 600);
  frameRate(10);
  background(0);
}

void draw()
{
  rad = rad + 0.1;
  s = s + 0.01;
  timer = timer+(1.0/30.0);
  println(timer);
  myScale = myScale + myScaleSpeed;
  
  if(timer >= 0.0 && timer <10.0)
  {
    pushMatrix();
    fill(random(255), random(100), random(100), random(100));
    translate(width/2, height/2);
    rotate(rad);
    scale(s);
    rectMode(CENTER);
    rect(0,0,100,100);
    popMatrix();
  }
  if(timer >10 && timer <20)
  {
    rowtate -= 0.4;
    fill (hue, 100, 100);
    pushMatrix();
    translate(width/2, height/2);
    rotate(rowtate);
    scale(s);
    rect(0, 0, 100, 100);
    popMatrix();
  }
  if(timer >0 && timer < 25)
  {
    rowtate += 3;
    fill(hue, 100, 100, 38);
    pushMatrix();
    translate(width/2, height/2);
    rotate(rowtate);
    scale(s);
    rect(0, 0, 100, 100);
    popMatrix();
  }
}


