
PFont font;
String m = "Summertime";
String n = "Living";
String k = "is Easy";
int x = 0;

void setup() {
  size(300, 300);
  smooth();
  font  = loadFont("8BITWONDERNominal-48.vlw");
  textFont(font);
  textSize(20);
  frameRate(20);
}

void draw() {
  background(0);
  for (int i = 0; i < width ; i+=10) {
    for (int j = 0; j < height ; j+=10) {
      pushMatrix();
      translate(x, 0);
      noFill();
      stroke(255);
      rect(i, j, 10, 10);
      x++;
      if (x > width+20) {
        x = 20;
      }
      popMatrix();
    }
  }
  fill(int(random(200, 255)), int(random(180, 255)), 20);
 // text(m, width/2-90, height/2-30);
  fill(int(random(200, 200)), int(random(180, 255)), 20);
 // text(n, width/2-90, height/2);
  fill(int(random(220, 255)), int(random(250, 255)), 17);
 // text(k, width/2-90, height/2+30);
}

