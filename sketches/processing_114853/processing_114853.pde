
float prevX;
float prevY;
int currentBrush = 0;
color backgroundColor;
 PImage palletteImage;
 
 float s=.5;
 float r=1;
void setup()
{
  size(600, 600);
   palletteImage=requestImage("color_palette.png");
}
 
void draw()
{
    background(backgroundColor);
  if (palletteImage.width > 0)
  {
    image(palletteImage,0,0,200,200);
  }
  if (mousePressed == true && mouseButton == RIGHT)
  {
    backgroundColor = get(mouseX,mouseY);
  }
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {

 
      //float d = dist(pmouseX,pmouseY,mouseX,mouseY);
       pushMatrix();
       translate(pmouseX,pmouseY);
       rotate(r);
       scale(s);
        fill(backgroundColor);
        triangle(-30, 30, 0, -30, 30, 30);
       popMatrix();

    }
  }
  prevX = mouseX;
  prevY = mouseY;
}








 
void keyReleased()
{
  if (key == '0')
  {
    currentBrush = 0;
  }
  if (key == '1')
  {
    currentBrush = 1;
  }
  if (keyCode == UP)
  {
    s+=.1;
  }
    if (keyCode == DOWN)
  {
    s-=.1;
  }
  if (keyCode == LEFT)
  {
    r+=1;
  }
    if (keyCode == RIGHT)
  {
    r-=1;
  }
}



