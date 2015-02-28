
PImage img;

void setup() {
  size(640,480);
  img = loadImage("https://si0.twimg.com/profile_images/2575126965/ghhbyat8is75ortzqmep.jpeg");
}

void draw() {
  image(img, 0, 0, width, height);
}
