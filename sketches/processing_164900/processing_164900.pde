
PImage img;
void setup() {
  size(300,300);
  img = loadImage("burger.jpg");
}


void draw() {
  int d = day();
  int m = month();
  if((d==7) && (m ==10)) {
    println("BOO!!!");
    image(img, 100, 100, 100, 100);
  }
}

    


