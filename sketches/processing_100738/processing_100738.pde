
PImage img;
PImage img2;
PImage img3;
int x = 0;
int y = 0;


void setup() {
  size(1280, 800);
  background(150); 
  img= loadImage("slide1.jpg");
  img2= loadImage("slide2.jpg");
  img3= loadImage("slide3.jpg");
}

void draw() {
  int m = frameCount;
  background(0);

  if ((m % 1920 > -1) && (m % 1920 < 601)) {
    image(img, 0, 0);
  }
  if ((m % 1920 > 600) && (m % 1920 < 641)) {
    image(img, -((m % 1920) - 600) * 32, 0);
    image(img2, (-((m % 1920) - 600) * 32) + 1280, 0);
  }
  if ((m % 1920 > 640) && (m % 1920 < 1241)) {
    image(img2, 0, 0);
  }
  if ((m % 1920 > 1240) && (m % 1920 < 1281)) {
    image(img2, -((m % 1920) - 1240) * 32, 0);
    image(img3, (-((m % 1920) - 1240) * 32) + 1280, 0);
  }
  if ((m % 1920 > 1280) && (m % 1920 < 1881)) {
    image(img3, 0, 0);
  }
  if ((m % 1920 > 1880) && (m % 1920 < 1920)) {
    image(img3, -((m % 1920) - 1880) * 32, 0);
    image(img, (-((m % 1920) - 1880) * 32) + 1280, 0);
  }
  x += 2;
  y += 1;
  ellipse(x,y,20,20);
  if(x > width) {
   x = 0; 
  }
  if(y > height) {
   y = 0; 
  }
  
  
  println(m);
}



