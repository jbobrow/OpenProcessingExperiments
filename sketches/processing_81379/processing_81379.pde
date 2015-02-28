
//http://forum.processing.org/topic/what-is-the-best-way-to-fade-an-image

PImage pic;
PImage pic1;
PImage flash;
PImage cam;
float transparency = 255;
float transparency2 = 200;
 
void setup() {
  size(600, 400);
  pic1   = loadImage( "pic1.JPG");
  pic   = loadImage( "pic.JPG");
  pic.resize(width, height); 
  cam = loadImage("camera.png");
  flash = loadImage("flash.png"); 
  background(pic);
  noCursor();
}
 
void draw() {
  background(pic1);
  image(cam,mouseX,mouseY);
}

void mousePressed() 
{
  if (transparency > 0) { transparency -= 1; }
  tint(255, transparency);
  image(flash, mouseX-350, mouseY-200);
}

void mouseReleased() 
{
  if (transparency2 > 0) { transparency2 += 5; }
  tint(255, transparency2);
  image(pic, 0, 0);
  image(cam,mouseX,mouseY);
}


