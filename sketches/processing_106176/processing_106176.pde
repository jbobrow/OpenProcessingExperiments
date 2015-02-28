
int hourY;
int miutes;
int seconds;

void setup() {

  size(600, 600);
  background(255);
  hourY = int(map(hour(), 0, 23, 0, (width-10)));
}

void draw() {


  //seconds
  noStroke();
  fill(random(255), random(255), random(255));
  rect(0, 8*second(), width/3, 5);

  //miutes
  fill(random(255), random(255), random(255));
  ellipse(width/2, 10*minute(), 30, 30);

  //hours

  fill(random(255), random(255), random(255));
  rect(400, hourY, 30, 5);
}
