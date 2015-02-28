
void setup() {
  size(300, 300);
}

int x = 0;

void draw() {
  colorMode(RGB, 255);
  background(6, 8, 89);//color is my dob
  x++;

  colorMode(RGB, 60); //colormode range set to 60 in order to be able to see the change of color before retangle dissapears as mouseX increases

  fill(20, 10, mouseX);

  if (mouseX < 60) {
    rect(250, 50, 25, x);
  }

  if (x > 250) { 
    x=50; //if x goes beyond 50 + 250, et to restart
  } 

  colorMode(RGB, 180);//colormode range set to 180 in order to be able to see the change of color before retangle dissapears as mouseX increases
  fill(20, 10, mouseX);

  if (mouseX < 180) {
    rect(125, 10, 75, 2*x);
  }

  if (x > 150) {
    x=10;
  }

  colorMode(RGB, 240); //colormode range set to 240 in order to be able to see the change of color before retangle dissapears as mouseX increases
  fill(40, 10, mouseX);

  if (mouseX < 240) {
    rect(30, 150, 50, x/2);
  }

  if (x > 250) {
    x=100;
  }
}
//difference in "speed" of rectangles is reiterated in difference of color change in each rectangle


