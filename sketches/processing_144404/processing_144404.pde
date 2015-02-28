
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Lee hyejin
// ID: 201420103 hye-jin


void setup() {
  size(600, 600);
  background(120);
  smooth();
}

void draw() {
  background(0);
  
  if (mousePressed) {
    background(random(255), random(255), random(255));
  }
  
  stroke(0);
  fill(30, 204, 250);
  arc(450, 150, 200, 200, HALF_PI-radians(3*second()), HALF_PI+radians(3*second()), OPEN);
  fill(19, 126, 155);
  arc(150, 450, 150, 150, HALF_PI-radians(3*minute()), HALF_PI+radians(3*minute()), OPEN);
  fill(6, 0, 232);
  arc(width/2, height/2, 100, 100, HALF_PI-radians(7.5*hour()), HALF_PI+radians(7.5*hour()), OPEN);

  time(500, 550);
}

void time(float x, float y)
{
  noStroke();
  fill(255);
  fill(255-(hour()*10.625));
  textAlign(CENTER);
  textSize(30);
  fill(30, 204, 250);
  text(second(), x+40, y);
  fill(19, 126, 155);
  text(minute(), x, y);
  fill(6, 0, 232);
  text(hour(), x-40, y);
}
