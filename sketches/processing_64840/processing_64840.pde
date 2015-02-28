
void setup() {

  size(800, 200);
  background(255);
  smooth(); 
  noLoop();
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(255);


  for (int i = 0; i<width; i=i+80) {
    float w = random(30);
    float x = random(10, 20);
    float y = random (-30, -40);
    float angle = i/random(i);
    float diam = 15+(cos(angle)*50);
    deskLamp(i+diam, w, x, y, diam);
  }
}

void deskLamp(float xpos, float w, float x, float y, float diam) {

  pushMatrix();
  translate(xpos, height/2);

  rect(x, y, w, 3);
  line (x, y, x-x*2, y-y*2);
  arc(x-x*2, y-y*2, diam, diam, PI, TWO_PI);

  popMatrix();
}

void mousePressed()
{
   redraw();
}



