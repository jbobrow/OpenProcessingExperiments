
/*Ellipsen mit Farbwert des darunter liegenden Bildes.
Drücke rechte Maus und linke Maus.*/

PImage img;

void setup() {
  size(600, 600);
  img = loadImage("all.jpg");
  image(img, 0, 0);
}

void draw() {
  if (mousePressed && (mouseButton == LEFT)) {
    img = loadImage("all.jpg");
    image(img, 0, 0);
    noStroke();
    background(0);
    for (int x = 0; x < width; x=x+10) {
      for (int y = 0; y < height; y=y+10) {
        color c = img.get(x, y);
        fill(c);
        ellipse(x, y, 10, 10);
      }
    }
  }
  else if (mousePressed && (mouseButton == RIGHT)) {
    img = loadImage("all.jpg");
    image(img, 0, 0);
  }
}

/*void mousePressed(){
 saveFrame("thumbnail.png");
 }*/

