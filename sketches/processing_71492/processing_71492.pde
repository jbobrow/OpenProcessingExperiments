
//Victoria H DrawWithMe, CP1 mods 16/17

PImage birdie;
void setup()
{
  background(255);
  size(400,400);
}
void draw()
{
}
void mousePressed()
{
  if(keyPressed==true && key=='y')
  {
    String url = "http://sweetclipart.com/multisite/sweetclipart/files/bird_blue_cute.png";
    birdie = loadImage(url, "png");
    birdie.resize(50,50);
    image(birdie,mouseX,mouseY);
  }//cannot use bird image b/c it's not uploaded.
  if(keyPressed==true && key=='f')
  {//flower
    noStroke();
    fill(255,0,0);
    ellipse(mouseX-5,mouseY-5,10,10);
    ellipse(mouseX-5,mouseY+5,10,10);
    ellipse(mouseX+5,mouseY+5,10,10);
    ellipse(mouseX+5,mouseY-5,10,10);
    fill(255,209,39);
    ellipse(mouseX,mouseY,10,10);
  }
}
void mouseDragged()
{
  if(keyPressed==true && key=='b')
  {
    noStroke();
    fill(77,55,11);
    ellipse(mouseX,mouseY,5,5);
  }
  if(keyPressed==true && key=='g')
  {
    noStroke();
    fill(23,142,13);
    ellipse(mouseX,mouseY,5,5);
  }
  if(keyPressed==true && key=='u')
  {
    noStroke();
    fill(133,182,245);
    ellipse(mouseX,mouseY,5,5);
  }
  if(keyPressed==true && key=='p')
  {
    noStroke();
    fill(0);
    ellipse(mouseX,mouseY,5,5);
  }
  if(keyPressed==true && key=='w')
  {
    noStroke();
    fill(255);
    ellipse(mouseX,mouseY,10,10);
  }
}
 if(keyPressed==' ')
  {
    background(255);
    }
