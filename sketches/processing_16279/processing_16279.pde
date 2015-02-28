
PShape o1, o2, o4, o5;

void setup() {
  size(640, 480);
  smooth();
  o1 = loadShape("1.svg");
  o2 = loadShape("5.svg");
  o4 = loadShape("7.svg");
  o5 = loadShape("8.svg");

  noLoop();
} 

void draw() {
  background(255);

  o1.disableStyle();
  fill(207, 232, 220);
  stroke(139, 205, 193);
  shape(o1, -200, -350);
 
  fill(56, 116, 85);
  stroke(26, 85, 74);
  shape(o1, -50, -400);

  o2.disableStyle();
  fill(146, 29, 65);
  stroke(115, 35, 66);
  shape(o2, -650, -400);

  fill(146, 29, 65);
  stroke(115, 35, 66);
  shape(o2, 50, -350);

  o4.disableStyle();
  fill(237, 215, 220);
  stroke(219, 170, 187);
  shape(o4, -550, -200);

  o5.disableStyle();
  fill(207, 232, 220);
  stroke(139, 205, 193);
  shape(o5, -50, -180);
}


