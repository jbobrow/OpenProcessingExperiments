
int hour;
int minute;
int second;
int mouseXX;
int mouseYY;

void setup () {
  size (400, 400);
  background (50);
}

void draw() {
  second = second ();
  minute = minute ();
  hour = hour ();

  fill (0);
  noStroke();
  ellipse (width/2, height/2, 300, 300);
  noFill();

  translate (width/2, height/2);

  stroke(255);
  strokeWeight(10);

  pushMatrix();
  rotate(radians (30*hour));
  line(0, 0, 0, -50);
  popMatrix();

  pushMatrix();
  rotate(radians (6*minute));
  line(0, 0, 0, -100);
  popMatrix(); 

  strokeWeight(2);
  pushMatrix();
  rotate(radians (6*second));
  line(0, 0, 0, -100);
  popMatrix();
}

void mouseDragged() {
  mouseXX = mouseX;
  map(mouseXX, 0, 400, 0, 23);
  hour = mouseXX;
  
  mouseYY = mouseY;
  map(mouseYY, 0, 400, 0, 59);
  minute = mouseYY;
}
