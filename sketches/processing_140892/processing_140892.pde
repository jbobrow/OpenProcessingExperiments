
void setup() {
  size(300, 300);
  noLoop();  // draw() will not loop
}

float x = 0;
string t = "Try to centre the black line(it can move backwords)";
fill(125);
text = (t,5,5,20,50); //text warps within text box

void draw() {
  background(2,255,204);
  x = x + random(-12.1, 18.9);
  if (x > width) {
    x = 0;
  }
  line(x, 0, x, height); 
}

void mousePressed() {
  loop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
}
