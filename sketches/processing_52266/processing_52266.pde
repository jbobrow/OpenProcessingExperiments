
void setup() {
size(2400, 450);
background(255);
noStroke();
fill(0);
}

void draw() {
PImage img = loadImage("ZEVS.jpeg");
for(int i =0; i<width; i += 50) {
  int x = int(random(img.width-10));
  PImage crop = img.get(x, 0, 50, height);
 image(crop, i, 0);
 fill(169, 122, 237, 6);
rect(0, 0, 2400, 450);
}
}


