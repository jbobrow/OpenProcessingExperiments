
// Ryanne Hollies
// PS3-1


float speed = 0;
float gravity = 0.1;

boolean animate = true;

ball b;
button btn;


//--------------------------------------

void setup() {
  size(400, 500);
  smooth();

  btn = new button(260, 50, 60, 60, color(255));
  b = new ball(width/4, -100, 50, color(0));
}

//--------------------------------------

void draw() {
  background(20, 240, 240);
  btn.display();
  b.display();
  b.bounce();
}
void mousePressed() {
  btn.click();
}


