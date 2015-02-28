
float circlewidth = 10;
float circleheight = 10;

void setup()
{
  size(400, 400);
  background(255);
}

void draw()
{
   //fill(mouseX,mouseY,mouseX,250); //pink, green palette
   fill(5,mouseY,mouseX,200); //blue, green palette
    stroke(mouseX);
    strokeWeight(mouseY);
  //ellipse(width/2, height/2, circlewidth,circleheight); //fixed growing circle in center
  //"wormhole version" follows
  ellipse(mouseX, mouseY, circlewidth,circleheight);
  circlewidth = circlewidth + 1;
  circleheight = circleheight + 1;
  if (circlewidth > 400 && circleheight > 400) {
      circlewidth = 10;
      circleheight = 10;
        }
}

void mouseDragged()
{
   ellipse(width/2, height/2, circlewidth,circleheight); //twinned fixed growing circle appears in center
  circlewidth = circlewidth + 1;
 circleheight = circleheight + 1;
  if (circlewidth > 400 && circleheight > 400) {
      circlewidth = 10;
      circleheight = 10;
        }
}

void mousePressed()
{
   ellipse(mouseX, mouseY, circlewidth,circleheight);
  circlewidth = circlewidth + 1;
circleheight = circleheight + 1;
  if (circlewidth > 400 && circleheight > 400) {
      circlewidth = 10;
      circleheight = 10;
        } 
}

void mouseReleased()
{
  circlewidth = 0;
  circleheight = 0;
}
