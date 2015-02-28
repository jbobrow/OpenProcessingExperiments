
//Madeline Chan mchan1@andrew.cmu.edu
//HW4 DOTS!

float x, y, wd, ht;

void setup()
{
  size(400, 400);
  background(240, 128, 128);
  x = 100;
  y = 100;
  wd = 100;  
  ht = 100;
  frameRate(5);
  smooth(); 
}

void draw()
{
  noStroke();
  fill(30, 178, 170, 50);
  ellipse(100, 100, 30, 30);
  ellipse(200, 100, 30, 30);
  ellipse(300, 100, 30, 30);
  ellipse(100, 200, 30, 30);
  ellipse(200, 200, 30, 30);
  ellipse(300, 200, 30, 30);
  ellipse(100, 300, 30, 30);
  ellipse(200, 300, 30, 30);
  ellipse(300, 300, 30, 30);
  textSize(12);
  text("press space/click+drag!", 30, 30);
}

void mouseDragged()
{
   background(240, 128, 128);
    fill(30, 178, 170);
    smooth();
    ellipse(mouseX, mouseY, 30, 30);
}
  
void keyPressed()
{
  if(key ==' ')
  {
    background(240, 128, 128);
    textSize(20);
    fill(255, 255, 255);
    text("play with dots", 30, mouseY);
    
    fill(175, 238, 238);
    smooth();
    ellipse(mouseX, mouseY, pmouseX, pmouseY);
  } 
 }
 








  



