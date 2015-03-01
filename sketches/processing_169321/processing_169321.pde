
PFont font, metafont;
String fontlist[];
color bg;
int r, g, b;

void setup() {
  size(600, 600);
  fontlist = PFont.list();
  //println(fontlist);
  metafont = createFont("Arial Bold", 12, true);

  mouseReleased();
}

void draw() {
}

void mouseReleased() {
  int choice = floor(random(fontlist.length));
  r = floor(random(140,180));
  g = r - floor(random(-20,20));
  b = r - floor(random(-20,20));
  bg = color(r,g,b);
  background(bg);

  font = createFont(fontlist[choice], 100, true);
  for (int i=1; i<50; i++) {
    textAlign(CENTER);
    textFont(font, 100);
    fill(255);
    pushMatrix();
    translate(width/2-width/47, height/2.1);
    rotate(radians(-45));
    text("Hello", 0+i, 0+i);
    popMatrix();
  }
  stroke(0);
  strokeWeight(2);
  strokeCap(SQUARE);
  line(20, height-60, width-20, height-60);
  fill(0);
  textAlign(LEFT);
  textFont(metafont, 12);
  text("Hello " + fontlist[choice], 20, height-40);
}

