
void setup() {
  size(200, 200);
  frameRate(60);
  fill(255);
  stroke(255);
}

float angle;

void draw() {
  background(0);
  float xmove = 30*sin(radians(angle));
  float ymove = 30*cos(radians(angle));
  ellipse(100+xmove, 100+ymove, 30, 30);
  ellipse(100+2*ymove, 100+2*xmove, 20, 20);
  line(100+xmove, 100+ymove, 100+2*ymove, 100+2*xmove);


    
  float xmove3 = 30*sin(radians(angle)+PI);
  float ymove3 = 30*cos(radians(angle)+PI);
  ellipse(100+xmove3, 100+ymove3, 30, 30);
  ellipse(100+2*ymove3, 100+2*xmove3, 20, 20);
  line(100+xmove3, 100+ymove3, 100+2*ymove3, 100+2*xmove3);
  angle += .05*(mouseY-100);
}



