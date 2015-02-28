
void setup() {
size(600, 600);
frameRate(10);
}
 
void draw() {
PImage img = loadImage("skullcodeOLDengLISH.jpeg");
for(int i =0; i < width; i += 80) {
  int x = int(random(img.width-10));
  PImage crop = img.get(x, 0, 80, height);
 image(crop, i, 0);
 fill(169, 122, 100, 200);
//rect(0, 0, 2400, 450);
}
}


