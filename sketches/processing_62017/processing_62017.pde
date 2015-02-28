
PImage myPhoto;
int myPhotoWidth, myPhotoHeight;

void setup(){
  size(400,320);
  frameRate(20);
  colorMode(HSB);
  myPhoto = loadImage("http://spkey.oiran.org/port/images/5a.jpg");
  myPhotoWidth = myPhoto.width;
  myPhotoHeight = myPhoto.height;
  noStroke();
  smooth();
  background(255);
}

void draw(){
  background(0, 20, 200);
  myPhoto.loadPixels();
  int x = int(random(myPhotoWidth));
  int y = int(random(myPhotoHeight));
  alpha(50);
  rectMode(CENTER);
  color myPhotoColor = myPhoto.pixels[y*width+x];
  fill(myPhoto.pixels[y*width + x]);
  float d = random(10, 50);
  rect(x, y, d, d);
}
  

