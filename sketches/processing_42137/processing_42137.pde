
String mode = "COLOR";
int red_val = 255;
int green_val = 255;
int blue_val = 255;

void setup() {
  background(255);
  size(700, 700);
}

void draw() {
  fill(red_val, green_val, blue_val);
  rect(0, 0, 700, 700);
  if (key == 'w' || key == 'W') {
    red_val = 255;
    green_val = 255;
    blue_val = 255;
  }
  //if ENTER key is typed, than the RGB values are displayed
  if (key == ENTER) {
    println("R is " + red_val);
    println("G is " + green_val);
    println("B is " + blue_val);
  }
}

void  keyPressed() {
  //if the "r" key is pressed, in red mode
  if (key == 'r' || key == 'R') {
    mode = "RED";
  }
  //if the "g" key is pressed, in green mode
  else if (key == 'g' || key == 'G') {
    mode = "GREEN";
  }
  //if the "b" key is pressed, in blue mode
  else if (key == 'b' || key == 'B') {
    mode = "BLUE";
  }
  if (key == CODED) {
    //if the left arrow is pressed, one of three color values subtracts 10
    if (keyCode == LEFT) {
      if (mode == "RED") {
        red_val = red_val - 10;
      }
      if (mode == "GREEN") {
        green_val = green_val - 10;
      }
      if (mode == "BLUE") {
        blue_val = blue_val - 10;
      }
    }
    //if the right arrow is pressed, color_val adds 10
    else if (keyCode == RIGHT) {
      if (mode == "RED") {
        red_val = red_val + 10;
      }
      if (mode == "GREEN") {
        green_val = green_val + 10;
      }
      if (mode == "BLUE") {
        blue_val = blue_val + 10;
      }
    }
  }
}
