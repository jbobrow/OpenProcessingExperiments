
int counter;

void setup() {
  size(250, 250);
  background(255);
  frameRate(6);
  counter = 0;
}

void draw() {  //draw function loops 
    line(counter, 20, 85, 75);
    counter++;
}
