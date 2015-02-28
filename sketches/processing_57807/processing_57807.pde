
// Ryanne Hollies
// PS3-2

float speed = 0;

boolean animate = true;

ball[] b = new ball[30];
button btn;


//--------------------------------------

void setup() {
  size(600, 500);
  smooth();

  btn = new button(260, 50, 60, 60, color(255));

  for (int i = 0; i < b.length; i++) {
    b[i] = new ball (random(width), 2, color(0), 0.1 );
  }
}

//--------------------------------------

void draw() {
  background(20, 240, 240);
  btn.display();
  for (int i = 0; i < b.length; i++) {   
    b[i].display();
    b[i].bounce();
  }
}
void mousePressed() {
  btn.click();
}


