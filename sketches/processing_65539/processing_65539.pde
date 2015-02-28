
// Corie Louie
// DMA 28 SUMMER 2012
// Workshop 5: Media

// Images credited to from flickr
// freeway : http://www.flickr.com/photos/cristine/124571269/
// car1 :  http://www.flickr.com/photos/ideum/4312001640/
// car2 : http://www.flickr.com/photos/chrisstar4/4035124655/
// car3 : http://www.flickr.com/photos/sirnadroj/4541976698/
// car4 : http://www.flickr.com/photos/ed1/3115906885/
// car5 : http://www.flickr.com/photos/49394123@N04/4773143458/

PImage freeway;
PImage car1;
PImage car2;
PImage car3;
PImage car4;
PImage car5;
 
void setup() {
  size(600, 300);
  smooth();
  freeway = loadImage("freeway.png");
  car1 = loadImage("car1.png");
  car2 = loadImage("car2.png");
  car3 = loadImage("car3.png");
  car4 = loadImage("car4.png");
  car5 = loadImage("car5.png");
  frameRate(1);
}



 
void draw() {
  background(0);
  image(freeway, 0, 0);
  float low = 80, y_h = 150, w_image = 250, h_image = 80;

  float x = random(0, 400);
  float y = random(low - 20, y_h);
  float d = random(w_image, h_image);
  image(car1, x, y, d, d);
  
  x = random(0, 400);
  y = random(low, y_h);
  d = random(w_image, h_image);
  image(car2, x, y, d, d);
  
  x = random(0, 400);
  y = random(low, y_h);
  d = random(w_image, h_image);
  image(car3, x, y, d, d);
  
  x = random(0, 400);
  y = random(low, y_h);
  d = random(w_image, h_image);
  image(car4, x, y, d, d);
  
  x = random(0, 400);
  y = random(low, y_h);
  d = random(w_image, h_image);
  image(car5, x, y, d, d);
}



