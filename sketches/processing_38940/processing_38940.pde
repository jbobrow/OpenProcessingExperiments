
//Color Change
//Hiatt Zhao
//09/23/11

//Declare variables
float h = 0;
float s = 0;
float b = 0;
float bChange = 1;

//Make a 200 by 200 window
//Color mode is set to HSB with high limit of 200
void setup() {
  size(200, 200);
  colorMode(HSB, 200);
}

void draw() {
  background(h, s, b); //background will change color
  if (mouseX > 0 && mouseX < 200) { //if mouse moves in the x direction hue changes
    h = mouseX + 1;
  }
  if (mouseY > 0 && mouseY < 200) { //if mouse moves in the y direction saturation changes
    s = mouseY + 1;
  }
  if (mousePressed) { //if mouse is pressed brightness changes
    b = b + bChange;
  }
  if (mousePressed && b > 200 || b < 0) { //brightness will reverse direction as it reaches 200 or 0
    bChange = bChange * -1;
  }
}

