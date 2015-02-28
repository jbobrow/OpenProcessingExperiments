


PImage img;

void setup() {
  size(675, 750);
  background(255);
  img = loadImage("pic.png");
  image(img,0,100);
}

void draw() {
  int x1 = (int) random(0, width);
  int y1 = 0;

  int x2 = round(x1 + random(-7, 7));
  int y2 = round(random(-5, 5));

  int w = (int) random(35, 50);
  int h = height;

  copy(x1,y1, w,h, x2,y2, w,h);
}

void keyReleased() {
  if(keyCode == DELETE || keyCode == BACKSPACE) {
    background(255);
    image(img,0,100);
  }
  if(key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


