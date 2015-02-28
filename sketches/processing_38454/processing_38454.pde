
void setup() {
  size (500, 500);
  background(3, 3, 3);
  smooth();
}

int start=250;
int spacing=40;
float x=random(0, 250);
float y=random(250, 500);



void draw() {
  ellipse(150, 150, x-100, y-100);
  for (int x=0;x<=500;x+=spacing) {
    stroke (200, 214, 53);
    strokeWeight(1);
    line(x, 0, x, y);//yellow lines
  }
  for (int x=10;x<=500;x+=spacing) {
    stroke(57, 143, 213);
    line(x, y, x, y+100);//light blue lines that start where the yellow lines stop
  }
  if (x<=100) {
    noStroke();
    fill(200, 214, 53);
    ellipse(x, x, 50, 50);
  }
  else {
    noStroke();
    fill(2, 232, 16);
    ellipse(x, y, 20, 20);
  }
  if (start<=500) {
    fill(10, 7, 247);
    ellipse(y, x, x, y);//large ellipse that divides the blue and green lines
  }
  //these two for() codes will start at their own points and end up connecting
  for (int x=0;x<=500;x+=spacing) {
    stroke(10, 7, 247);
    strokeWeight(2);
    line (0, 500, y, x);//blue line
  }
  for (int x=0;x<=500;x+=spacing) {
    stroke(41, 188, 23);
    strokeWeight(1);
    line (y, x, 500, 125);//green line
  }
}



