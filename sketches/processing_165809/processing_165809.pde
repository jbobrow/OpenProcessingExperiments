
String str = "HELLO WORLD";
String all = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
char[] c = new char[str.length()];

float cw;
float cws = 0;

void setup() {
  background(230);
  fill(128);
}

void draw() {
  background(230);
  for (int i = 0; i < str.length(); i++) {
    if (frameCount > 100) {
      c[i] = str.charAt(i);
    }
    else {
      c[i] = all.charAt(int(random(all.length())));
    }
    if (i == 0) {
      text(c[i], 0, 10);
    }
    else {
      cw = textWidth(c[i-1]);
      cws += cw;
      text(c[i], cws, 10);
    }
  }
  cws = 0;
}

void mousePressed() {
  setup();
  frameCount = 0;
}

