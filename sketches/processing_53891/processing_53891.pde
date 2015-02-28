
//Problem Set#2; Question 01
//lerpcolour
void setup() {
  size(300,300); //size of the window
  noStroke();//removes stroke
}
color from = color(255, 188, 157); //first colour (left side)
color to = color(184, 220, 250); //second colour (right side)

void draw () {
  for ( int i = 0; i < width; i++) { 
   color b1 = lerpColor(from, to, (float)i/width);
   fill(b1); 
  rect(i,0,i,height);
  }
}
void keyPressed() {
  saveFrame("PS2_01image.jpeg");
}

