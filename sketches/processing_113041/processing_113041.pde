
float timer = 0;
float z = random(500);
float r = 0;
float s = 1;
float scaleSpeed = 0.03;
float hue = 0;
float offset = 10;

void setup ()
{
  size(500,500);
  colorMode(HSB,360,100,100);
  background(0);
}

void draw()
{
  timer += 1;
  
  hue += offset;
  if (hue >= 360)
  {
     offset = -offset;
     hue = 360; 
  }
  else if (hue < 0)
  {
    offset = -offset;
    hue = 0; 
  }

  r += 0.1;
  z = random(500);
  
  
  strokeCap(SQUARE);
 
  
  if(timer > 400 && timer < 560)
  {
    strokeWeight(random(5,10));
    stroke(24,0,0);
    line(0,z,500,z);
  }
    
  if(timer >560 && timer < 850)
  {   
    strokeWeight(random(5));
    stroke(24,0,random(100));
    line(z,random(50,200),z,random(300, 450));
  }
  
  
  s += scaleSpeed;
  
  if (s > 6 || s < 0)
  {
    scaleSpeed = -scaleSpeed;
  }
  
  if(timer < 395)
  {
  pushMatrix();
  noStroke();
  fill(hue,0,random(100));
  translate(250,250);
  rectMode(CENTER);
  rotate(r);
  scale(s + random(-.4,.4));
  rect(-25,-25,40,40);
  popMatrix();
  

  }
  
  if(timer > 840)
  {
    pushMatrix();
    noStroke();
    fill(hue,0,random(100));
    translate(random(500),250);
    rectMode(CENTER);
    scale(s + random(-.4,.4));
    rect(0,random(-200,200),random(5,15),random(5,15));
    popMatrix();
    
    pushMatrix();
    noStroke();
    fill(hue,0,random(100));
    translate(random(500),250);
    rectMode(CENTER);
    scale(s + random(-.4,.4));
    rect(0,random(-200,200),random(5,15),random(5,15));
    popMatrix();
  }
  
  if(timer > 1500)
  {
    timer = 0;
  }
  println(timer);
}


