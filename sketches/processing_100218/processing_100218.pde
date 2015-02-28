
PImage img;

void setup() {
  size(640,426);
  img = loadImage("http://sphotos-d.ak.fbcdn.net/hphotos-ak-prn2/268181_10150267209468841_5078629_n.jpg");
}

void draw() {
  image(img, 0, 0, width, height);
}
