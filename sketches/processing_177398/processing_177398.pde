
float rad = 0;
float a = 0;
float maxSize = 25;

void setup() {
  size(400, 400);
  rectMode(CENTER);
  noStroke();
  background(#171717);
  
}

//Shape creator function
void rotating_shape(float x, float y, float shape_size, float r) {
  translate(x, y);
  rotate(r);
  rect(0, 0, shape_size, shape_size);
  resetMatrix();
}


void draw() {
  fill(20, 90);
  rect(width/2, height/2, width, height);
  
  float x = 0;
  while (x < width + 20) {
    float y = 0;
    while (y < height + 20) {
      fill(#059cdd);
      float sinMash = sin(a*y/1000)*sin(a*x/1000)*sin(a*0.05)*sin(a*0.7);
      float sinRotation = map(sinMash, -1, 1, 0, 30);
      rotating_shape(x, y, rad, sinRotation*0.07);
      y = y + 20;
    }
    x = x + 20;
  }
  
  float increase = map(sin(a), -1, 1, 0, maxSize);
  a = a + 0.02;
  rad = increase;
}

void keyPressed() {
  if(key == 'd') {
    if(maxSize < 30) {
      maxSize = maxSize + 1;
      println("Max rect() size: " + maxSize);
    } else {
      println("Max size reached");
    }
  } 
  
  if(key == 's') {
    if(maxSize < 2) {
      println("Min size reached");
    } else {
      maxSize = maxSize - 1;
      println("Max rect() size: " + maxSize);
    }
  }
}
