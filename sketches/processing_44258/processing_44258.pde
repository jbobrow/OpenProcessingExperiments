
PImage bg, front, middle, back, fly;



void setup() {
  size(400, 360);
  bg = loadImage("bbg.png");
  front = loadImage("front.png");
  middle = loadImage("middle.png");
  back = loadImage("bg.png");
  fly = loadImage("fly.png");
}

void draw() {
  float a = map(mouseX, 0, 600, -600, 600);
  float b = map(mouseX, 0, 800, -100, 0);
  float c = map(mouseX, 0, 900, -260, 0);
  float d = map(mouseX, 0, 800, -350, 350);


  image(bg, 0, 0);
  tint(190);
  image(back, b-200, -20);
  noTint();
  image(middle, c, 40);
  image(fly, a, 0);
  image(front, d, -0);
}



