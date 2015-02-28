
PFont font;

String[] novel_bg;
String[] novel_marquee;

color[] c = new color[80*46];

int x = 900;
float y = 460/2;
int marquee_count = 0;
int marquee_size = 150;
int speed = 8;

int counter = 0;
int bg_size = 12;

void setup() {
  size(815, 460);
  background(0);
  smooth();

  novel_bg = loadStrings("neko2.txt");
  novel_marquee = loadStrings("neko3.txt");

  font = loadFont("font.vlw");
  textFont(font);
}

void draw() {
  marquee();  
  get_color();
  arrange();
}

void marquee() {
  background(0);

  fill(255);
  textSize(marquee_size);
  text(novel_marquee[marquee_count], x, y);

  x -= speed;

  if (x < - novel_marquee[marquee_count].length() * marquee_size) {
    marquee_count++;
    x = width;
    y = random(150, height);
  }
}

void get_color() {
  for (int i = bg_size; i < height; i += bg_size) {
    for (int j = 0; j < width;j += bg_size) {
      c[counter] = get(j, i);
      counter++;
    }
  }

  counter = 0;
  background(0, 100, 100);
}

void arrange() {
  for (int p = bg_size; p < height; p += bg_size) {
    for (int q = 0; q < width ; q += bg_size) {
      fill(c[counter]);
      textSize(bg_size);
      text(novel_bg[0].charAt(counter), q, p);
      counter++;
    }
  }
  counter = 0;
}


