
Palindromo p;
int n;
PFont f;


void setup () {
  smooth();
  size (460,200);
  colorMode(HSB,360,100,100);
  int c = (int) random(360);
  int t = (c+180)%360;
  background(c,50,100);
  fill(t,100,100);
  p = new Palindromo();
  n = p.getNew();
  f = loadFont("ProggyCA3i-48.vlw");
  textFont(f,72);
  textAlign(CENTER);
  text(n,width/2,120);
  println(n);
}

void draw () {
  int c = (int) random(360);
  int t = (c+180)%360;
  background(c,50,100);
  fill(t,100,100);
  n = p.getNew();
  text(n,width/2,120);
  println(n);
  noLoop();
}

void keyPressed () {
  loop();
}
  



