
int value = 0;

void setup() { //set up function, only once
background(255); //set background white
size(250, 250); //size of background
}

void draw() { //draw function
  fill(value); //set fill to value
  rect(25, 25, 50, 50); //set size for rectangle
}

void mouseClicked() { //mouse click function
  if (value == 0) { //fill black
    value = 255; //fill white
  } else {
    value = 0; 
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    fill(0);
  } else if (mouseButton == RIGHT) {
    fill(255);
  } else {
    fill(126);
  }
}

void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
