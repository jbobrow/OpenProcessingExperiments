
PImage myPhoto;
int myPhotoWidth, myPhotoHeight;

void setup(){
  size(500, 397);
  frameRate(20);
  colorMode(HSB);
  myPhoto = loadImage("http://spkey.oiran.org/port/images/3a.png");
  myPhotoWidth = myPhoto.width;
  myPhotoHeight = myPhoto.height;
  noStroke();
  smooth();
  background(255);
}

void draw(){
  background(100, 20, 200);
  myPhoto.loadPixels();
  int x = int(random(myPhotoWidth));
  int y = int(random(myPhotoHeight));
  color myPhotoColor = myPhoto.pixels[y*width+x];
  fill(myPhoto.pixels[y*width + x]);
  float d = random(1,300);
  ellipse(width/2, height/2, d, d);
}
  

