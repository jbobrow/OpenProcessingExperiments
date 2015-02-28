
PFont mono;

String s = "s";
String t1 = "t";
String r = "r";
String e = "e";
String t2 = "t";
String c = "c";
String h = "h";
float d;

void setup() {
  size(700, 300);
  smooth();
  d = 15;
  mono = loadFont("Monospaced-48.vlw");
}

void draw() {
  background(255);
  textAlign(CENTER,CENTER);
  fill(0);
  textFont(mono,30);

  int x = width/2;
  int y = height/2;



  if (mousePressed) {
    d = d+1;
  }
  else {
    d = 18;
  }

  text(s, x-3*d, y);
  text(t1, x-2*d, y);
  text(r, x-d, y);
  text(e, x, y);
  text(t2, x+d, y);
  text(c, x+2*d, y);
  text(h, x+3*d, y);
}



