
float xpos = 600;
float ypos = 0;
float vy = -2;
float vx = 0;
float gravity = 0.98;
float bounce = -1;
float num;
float rd;
float grn;
float blu;

void setup() 
{
  size(1200,800);
  smooth();
  num = random(-5,5);
  rd = random (255);
  grn = random(255);
  blu = random(255);
  
  background(0);
}

void draw(){
 if((num < 0) && (num > -1)) {
  num = -2;
 }
 if ((num > 0) && (num < 1)) {
   num = 2;
 }
  vx = num;
  fill(rd,grn,blu);
  rect(xpos, ypos, 80, 100);
  vy += gravity;
  ypos += vy;
  xpos += vx;
  if(ypos > height - 15)
  {
    vy *= bounce;
  }
  if ((xpos > 1200) || (xpos < -80)) {
    ypos = 0;
    vy = 0;
    gravity = 1.5;
    bounce = -1;
    fill(rd,grn,blu);
    rect(xpos, ypos, 80, 100);
    vy += gravity;
    ypos += vy;
    xpos += vx;
    num = random(-5,5);
    rd = random (255);
    grn = random(255);
    blu = random(255);
    xpos = random(1200);
  if(ypos > height - 15)
  {
    vy *= bounce;
  }
  }
}
  void mousePressed(){
    xpos = mouseX;
    ypos = mouseY;
     num = random(-5,5);
    rd = random (255);
    grn = random(255);
    blu = random(255);
  }





