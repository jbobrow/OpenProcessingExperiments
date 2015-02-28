
PImage sky;
PImage man;
PImage moon;



void setup ()
{
  
  size(800,600);
  smooth();
  imageMode(CENTER);
  background (loadImage("sky.jpg"));
  man= loadImage("man.png");
  moon= loadImage("moon.png");
  smooth();
}
  
void draw()
{
  image (man , width/2,height/2 , 700 , height);
    drawMoon(color(150, 50, 0), 150, 50);
  drawMoon(color(0, 50, 150), 250, 100);
  drawMoon(color(180, 150, 30), 400, 200);
  drawMoon();
}
  
void drawMoon(color c, float r,float s)
{
  pushMatrix();
  float x=cos(frameCount/r)*r;
   float y = sin(frameCount/r) * r;
  translate(width/2, height/2);
  
 
  pushMatrix();
  translate(x, y);
  rotate(-frameCount/(r/2));
  tint(c);
  image(moon, 0, 0, s,s); //4th, 5th param sizes it...
  popMatrix();
  popMatrix();
}
void drawMoon()
{
  
   pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount/500.0);
  tint(255);
  image(moon, 0, 0, 100, 100); //4th, 5th param sizes it...
  popMatrix();
}
  
  

