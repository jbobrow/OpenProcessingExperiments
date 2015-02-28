
color
  lcd0 = color(250, 3, 226),
  lcd1 = color(250, 242, 5),
  lcd2 = color(3, 240, 250),
  lcd3= color(250,5,38),
  lcd4= color(61,250,5),
  gray = color(32),
  black = color(0);
 
void setup() {
  size(800, 700);
  noSmooth();
}
 
void draw() {
  background(0);
  strokeWeight(0);
  randomSeed(15);
  loadPixels();
  int n = width * height;
  for(int i = 0; i < n; i++) {
    int row = i / width;
    pixels[i] = (row % 2 == 0) ?
      (i % 2 == 0 ? gray : black) :
      (i % 2 == 0 ? black : gray);
  }
  updatePixels();
  for(int i = 8; i < 80; i++) {
    float offset = frameCount + random(0, 1000);
    float speed = random(200, 6000);
    float x = map(sin(offset / speed), -1, 1, 0, width);
    verticalSubpixel(x);
  }
}
 
void verticalSubpixel(float x) {
  switch(int(x * 3) % 3) {
    case 0: stroke(lcd0); break;
    case 1: stroke(lcd1); break;
    case 2: stroke(lcd2); break;
    case 3: stroke(lcd3);break;
    case 4:stroke(lcd4) ;break;
  }
  line(x, 2, x, height);
}
