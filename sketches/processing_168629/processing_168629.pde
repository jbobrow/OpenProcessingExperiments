
int angle = 0;
int op_counter = 0;
int x = random(0, width);
int y = random(0, height);

void setup() {
  size(1000, 500, P3D);
  noFill();
  
  initialize();
}

void draw() {

 
 pushMatrix();
      translate(x, y);
      rectMode(CENTER);
      rotate(radians(angle));
      for (int i = 0; i < 200; i++) {
        line(0, 0, 1, random(0, 500));
      }
 popMatrix();

 angle++;
 if (angle > 360) {

     reset();
 }

 if (op_counter > 255) {
     op_counter  = 0;
 }
}

void mouseClicked() {
    initialize();
}
void initialize() {
  background(0);
  stroke(random(0, 255),random(0, 255),random(0, 255), 50);
}
void reset() {
    x = random(0, width);
    y = random(0, height);
    
    angle = 0;
}
