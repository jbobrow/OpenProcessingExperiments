
float time = 0;

void setup() {

  size (500, 500);
  background(255);
}

void draw() {
 fill(255,20);
  rect(0,0,width,height);
  
  float x = 0;

  while (x <width) {
    point (x, height*noise(x/105, time));
    x= x + 1;
  }
  time = time + 0.05;
}


