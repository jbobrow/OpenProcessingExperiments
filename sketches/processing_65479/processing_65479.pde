
float r = 0;

void setup()
{
 size(400,400);
 fill(0,0,255);
 rectMode(CENTER);
 noStroke();
 smooth();
 colorMode(HSB);
}

void draw()
{
  fill(map(mouseX,0,360,0,180)+10,255,255,20);
  rect(width/2,height/2,width, height);
  
  translate(mouseX,mouseY+35);
  rotate(r);
  fill(255);
  rect(0,0,50,50);
  
  r = r+0.05;
}

