

float theta = 2.0;

void setup() {
  size(800,600);
  background(0);
  smooth();
}

void draw() {
  theta += 0.02;
  noStroke();
  smooth ();
  fill(187,26,196,45);
  float x = theta;
  

  for (int i = 0; i <= 80; i++) {
    float y = sin(x)*height/2;
    rect(i*19,y + height/2,16,16);
    x += 8.2;
  }
}
void mousePressed(){
 //saveFrame ("1.JPG");
   noLoop();
}
void keyPressed(){
  background (0);
  loop();
}

