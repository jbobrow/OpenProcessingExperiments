
void setup()
{
  size(400, 400);
  xpos = width/2;
  ypos = 50;
  noStroke();
}
  red = random(10,250);
  grn = random(10,250);
  blu = random(10,250);
float xpos, ypos, speed;
void draw()
{
  background(0);
  textSize(15);
  textAlign(CENTER, CENTER);
  fill(255);
  text("click to restart", 105, 25);
  fill(red, grn, blu);
  ypos+=speed;
  speed+=.5;
  if (ypos>=height-30)
  {
    speed-=3;
    speed*=-1;
    ypos+=speed;
  }
  
  if (ypos>=height-30) ypos = height-30;
  if (ypos<height*2) red+=1, blu+=1;
  
  ellipse(xpos, ypos, 40+(3-speed*3/24), 40+speed/4); 
  
}
void mousePressed()
{ 
  xpos = width/2;
  ypos = 50; 
  speed = 0;
  }
