
void setup() {
  size(400,400);
  float c = random (10,100); //assigns colours at the start when "fill c" is called
  fill(c);
}

void draw() {
  
  float x = random (width); //these 3 lines assigns the values of x,y,z when they are called
  float y = random (height);
  float z = random (10,100);
  
  translate (x,y); //draws and displaces ellipses
  ellipse(x,y,z,z);
}

void mousePressed() { //when the most is pressed the colour changes, still can't unchange the colour after the pressed valuse =/= after the first press

int value = 50;
fill(value);
  if (value == 0) {
    value = 255;
  } else {
    value = 50;
  }
}

