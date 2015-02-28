
int value = 0;
int circle_diameter = 150;

void setup(){
  size(500,500);
  smooth();

}

void draw() {
  fill(value);
  ellipse(width*.5, height*.5, circle_diameter, circle_diameter);
}

void mouseClicked() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}
