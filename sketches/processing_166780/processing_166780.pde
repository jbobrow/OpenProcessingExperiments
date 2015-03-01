
PImage img1, img2;

void setup()
{
  size(600,600);
  img1 = loadImage("http://imageshack.com/a/img631/4196/aLsYRA.png");
  img2 = loadImage("http://imageshack.com/a/img745/7906/aHUVhE.jpg");
}

void draw()
{
  background(0);
  colorMode(HSB, 360,100,100);
  float hue = map (mouseX, 0, width, 255, 100);
  tint(hue);
  image(img1, 0, 0, width, height);
  
  
  tint(203,0, 99, mouseX*255/2000);
  image(img2, 0, 0, width, height);
}
