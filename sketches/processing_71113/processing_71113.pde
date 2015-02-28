
//Raidel C,Computer Programming 1, Mods 14-15, User Input
//http://argentxorion.webs.com

void setup() 
{
  size(600, 600);
  smooth();
  noStroke();
  color(RGB);
}

void draw()
{

  mouseDragged();
  info();
}
void mouseDragged()
{
  fill(255, 25);
  rect(0, 0, width, height);
  if (mousePressed ==true)
  {
    strokeWeight(7);
    fill(random(255), random(255), random(255), 200);
    ellipse(mouseX, mouseY, 20, 20);

  }
}
void keyPressed()
{
  
    strokeWeight(7);
    ellipse(mouseX, mouseY, 50, 50);
}
void info()
{
  noFill();
  strokeWeight(10);
  stroke(0);
  rect(0,0,600,600);
  fill(0);
  text("Press the mouse to draw", 200, 300);
  text("Press a key to make it a temporary ellipse", 200, 320);
  text("Enjoy This Thing....", 200, 340);
}
