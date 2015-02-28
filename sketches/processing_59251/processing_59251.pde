
float rate = 60;
int digit = 0;
 
void setup()
{
  size(640, 360);
  smooth();
  frameRate(60);
}
 
void draw()
{
  noFill();
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);   
  fill(255,255,255);
  textSize(196);
  textAlign(CENTER);
  text(digit, 0, 64);
  strokeWeight(4);

  if (mousePressed == false) rate -= 1;
  if (rate < (0))
  {
    background(random(0,256),random(0,256),random(0,256));

      digit += 1;
    
    rate = 60;
  }
   
}


