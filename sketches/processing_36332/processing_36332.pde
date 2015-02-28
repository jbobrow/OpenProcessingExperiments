
void setup() {
  size(300, 300);
  colorMode(RGB);
}

int y=0;

void draw() {


  //skyline for the upper half of the composition
  if (mouseY < width/2 && y < 150) { // && lets two conditions to act simultaneously

    background (200, 30, y);
    fill (0);
    stroke(252, 243, 48);
    strokeWeight(1);
    rect(0, 150, 20, -10-y);
    rect(20, 150, 30, -5-y);
    rect(50, 150, 30, -30-y);
    rect(80, 150, 30, -y);
    rect(110, 150, 30, -10-y);
    rect(140, 150, 40, -40-y);
    rect(180, 150, 30, -20-y);
    rect(210, 150, 20, -15-y);
    rect(230, 150, 20, -5-y);
    rect(250, 150, 35, -25-y);
    rect(280, 150, 15, -40-y);
  }
  else 
    //skyline for the lower half when the mouse roll over the screen
  {
    background (105, 106, y);
    fill (164, 227, 71);
    strokeWeight(3);
    stroke(11, 44, 131);
    rect(0, 150, 20, 10+y);
    rect(20, 150, 30, 5+y);
    rect(50, 150, 30, 30+y);
    rect(80, 150, 30, y);
    rect(110, 150, 30, 10+y);
    rect(140, 150, 40, 40+y);
    rect(180, 150, 30, 20+y);
    rect(210, 150, 20, 15+y);
    rect(230, 150, 20, 5+y);
    rect(250, 150, 35, 25+y);
    rect(280, 150, 15, 40+y);
  }
  if (y >=150)
  {
    y=0;
  }
  y++;
  }
  
  
  // a set of blinking and moving star on the click of the mouse defining the skyline
  void mousePressed () {
  strokeWeight(9);
  stroke(232, 209, y);
  point (y, 30);
  point (y+20, 40);
  point (y+230, 10);
  point (y+128, 20);
  point (y+40, 8);
  point (y+190, 15);
  point (y+270, 30);
  }


