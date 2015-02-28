
String [] x;
String [] y;
String [] z;
String [] p;
int yLoc = 0;
int indent = 5;
int xLoc=0;

void setup() {
  size(1000, 1000);
  textSize(12);
  fill(0);
  background(255);
  frameRate(5);  
  x = loadStrings("Ember Tidepools.txt");
  y = loadStrings("how to crack a safe.txt");
  z = loadStrings("prologue.txt");
  p = loadStrings("fibonacci.txt");
}

void draw() {
  if (frameCount % 15 == 0) {
    yLoc+=10;
    text(p[(int) random(p.length)] + 
      " " +
      x[(int) random(x.length)] + 
      " " +
      y[(int) random(y.length)] + 
      " " +
      z[(int) random(z.length)] +
      " " +
      p[(int) random(p.length)] +
      " " +
      y[(int) random(y.length)] +
      " ", 
    indent, yLoc);
    if (yLoc > height+indent) {
        yLoc = 0;
        xLoc=0;
        background(0);
      }
  }
}



