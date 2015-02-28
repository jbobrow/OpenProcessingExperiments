
void setup() {
  size(800, 200);
  smooth();
  noLoop();
}


void draw() {
  background(11, 133, 120);
  //randomSeed(100);                        // random results used with forloops
  for(int i=-40; i<width; i+=80){
    int value = int(random(150,255));
    float scalar = random(0.25,1.25);
    fox(i,10, value, scalar);
  }
}




void fox (int x, int y, int v, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);                           // sets fox sizes
                             // sets value of fox
  noStroke();

  fill(241, 133, 18,v);
  triangle(50, 80, 150, 80, 100, 150);      // face
  triangle(50,80,51,40,78,80);              // ears
  triangle(150,80,149,40,122,80); 
  fill(233, 226, 219);
  triangle(81, 125, 119, 125, 100, 150);    // nose
  fill(10,10,10);
  triangle(94, 143, 105, 143, 100, 150);    // tip of nose
  ellipse(80,110, 3, 3);                    // eyes
  ellipse(120, 110, 3, 3);
  popMatrix();
}

void mousePressed() {
  redraw();
}










