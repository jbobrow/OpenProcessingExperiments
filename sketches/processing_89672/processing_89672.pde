
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;

PFont f;
String message = "Tension";
 
void setup() {
  size(640, 480);
  f = createFont("Arial",20,true);
  b1 = color(255);
  b2 = color(0);
  c1 = color(0, 0, 0);
  c2 = color(255, 255, 255);
  
}
 
void draw() {
  //Background
  setGradient(0,0, width/2, height, b1, b2, X_AXIS);
  //background(254,9,6);
  fill(0);
  textFont(f);        
  int x = 10;
  for (int i = 0; i < message.length(); i++) {
    textSize(random(24, 48));
    text(message.charAt(i),x,height/2);

    x += textWidth(message.charAt(i));
  }
  
  text(message, mouseX,mouseY);
}
//  noLoop();

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}





