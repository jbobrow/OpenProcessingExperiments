
import gifAnimation.*;

Gif NyanCat;
PImage a;
PVector Nyanloc = new PVector(0, 0);

void setup() {
  size(902, 353);
  a = loadImage("Wallpaper.jpg");
  background(a);
  NyanCat = new Gif(this, "NyanCat.gif");
  NyanCat.play();
}  

void draw() {
  background(a);
  image(NyanCat, Nyanloc.x, Nyanloc.y);

  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      println("w");
      if (Nyanloc.y >= 0) {
        Nyanloc.y -= 3;
      }
    } else if (key == 's' || key == 'S') {
      println("s");
      if (Nyanloc.y + 30 <= height) {
        Nyanloc.y += 3;
      }
    }
  }
}


