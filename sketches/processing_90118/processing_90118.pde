
//things happening only sometimes
float x = 0;
float y = 0;


void setup() {
  size(400, 400);
  background(255);
  stroke(255);
  smooth();

}

void draw() {
  line(x, 200, x, 100);
  x = x+1;

  if (x > width) {
    x = 0;
  }
  line(x, 300, x, 100);
  x = x+1;

  if (x > width) {
    x = 0;
  }
  line(x, 0, x, 100);
  x = x+1;

  if (x > width) {
    x = 0;
  }
  line(x, 400, x, 100);
  x = x+1;

  if (x > width) {
    x = 0;
  }  
  line(200, y, 100, y);
  y = y+1;

  if (y > height) {
    y = 0;
  }
  line(300, y, 100, y);
  y = y+1;

  if (y > height) {
    y = 0;
  }
  line(0, y, 100, y);
  y = y+1;

  if (y > height) {
    y = 0;
  }
  line(400, y, 100, y);
  y = y+1;

  if (y > height) {
    y = 0;
  }
  //sometimes the line color changes
  if (random(100)> 70) {
    if (random(100) > 30) {
      stroke(0);
    }
    else {
      stroke(255);
    }
  }
}


void mousePressed() {
  exit();
}



