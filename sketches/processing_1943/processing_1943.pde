
/*Erica Keim
Processing Project
Glitch*/

void setup() {
size(450, 440);
background(255);
frameRate(50);

}
void draw() {
PImage a = loadImage("heart.jpg");
PImage c = loadImage("clown.jpg");
  for(int i = 0; i < width; i += 60) {
    for(int j = 0; j < width; j += 60) {
  int x = int(random(a.width));
  int y = int(random(c.width));
  PImage crop = a.get(x, 0, 60, width);
  PImage crop2 = c.get(y, 0, 60, height);
  image(crop, i, j);
 image(crop2, i - 10 , j -10 );
  tint(random(255), random(255), random(255), random(250));
}

  }
}

