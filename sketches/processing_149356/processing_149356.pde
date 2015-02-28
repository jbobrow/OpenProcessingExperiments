
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
    counter++;
    noFill();
    bezier(85, 20, 10, 10, 90, 90, 15, 80);
    fill(255);
    int steps = 10;
    for (int i = 0; i <= steps; i++) {
      float t = sin(counter/1000);
      float x = bezierPoint(85, 10, 90, 15, t);
      float y = bezierPoint(20, 10, 90, 80, t);
      ellipse(x, y, 10, 10);
    }
}
