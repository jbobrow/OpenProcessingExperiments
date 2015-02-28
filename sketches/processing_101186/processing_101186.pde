
/* @pjs preload="ele.jpg", "purpleriver.jpg", "bluegarden.jpg", "yellowbush.jpg", "redbackground.jpg";  */

void setup()

{
  size(640,480);
  PImage bg;
  background(255,255,255);

}

void draw()

{
  fill(249,429,17);
  rect(600, 280, 40, 40);
  fill(220,49,49);
  rect(600, 320, 40, 40);
  fill(109,141,246);
  rect(600, 360, 40, 40);
  fill(150,246,135);
  rect(600, 440, 40, 40);
  fill(183,123,229);
  rect(600, 400, 40, 40);
}
  
 void mousePressed()
{
  if(mouseX >600 && mouseX<640 && mouseY>440 && mouseY<480)
  {
    PImage img;
    img = loadImage("ele.jpg");
    background(img);
  }
  
  else if(mouseX >600 && mouseX<640 && mouseY>400 && mouseY<440)
  {
    PImage img;
    img = loadImage("purpleriver.jpg");
    background(img);
  }
  
   else if(mouseX >600 && mouseX<640 && mouseY>360 && mouseY<400)
  {
    PImage img;
    img = loadImage("bluegarden.jpg");
    background(img);
  }
  
  else if(mouseX >600 && mouseX<640 && mouseY>320 && mouseY<360)
  {
    PImage img;
    img = loadImage("redbackground.jpg");
    background(img);
  }
   else if(mouseX >600 && mouseX<640 && mouseY>280 && mouseY<360)
  {
    PImage img;
    img = loadImage("yellowbush.jpg");
    background(img);
  }
}  
  



