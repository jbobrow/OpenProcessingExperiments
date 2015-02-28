
int lastX = 200;  // last x value
int lastY = 200;  // last y value


void setup() {
  smooth();
  size(500, 500);
  background(192, 64, 0);
  stroke(255);
  frameRate(10);
}

void draw() {
  int randomX;
  int randomY;

  //generate random rect starting point
  randomX = int(random(500));
  randomY = int(random(500));


  int r = int(random(256));
  int g = int(random(256));    
  int b = int(random(256));

  //random color and size, draw the rect
  stroke(r, g, b);
  fill(r, g, b);   //lalalalalala
  rect(randomX, randomY, 20, 15);
}


void mousePressed() {

  int randomX;
  int randomY;
  int r = int(random(256));
  int g = int(random(256));    
  int b = int(random(256));

  //generate random rect starting point
  randomX = int(random(500));
  randomY = int(random(500));

  // reset stroke to white
  stroke(255);
  fill(40, 80, 123);
  rect(randomX, randomY, 50, 30);

  // draw mouse line
  line(lastX, lastY, mouseX, mouseY);

  //save last click
  lastX = mouseX;
  lastY = mouseY;
}


