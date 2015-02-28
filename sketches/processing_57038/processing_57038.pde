
PImage myimage;
PImage newimage;
void setup() {
  size(600,600);
  myimage =loadImage("clouds.jpg");
  newimage =loadImage ("surfacemap.jpg");
  
}
void draw () {
  frameRate(5);
  image(myimage, 0,0, width, height);  
  tint(random(300));
  
  image(newimage, random(100,110), random (100,110), random(350,400), random(350,400));
}

