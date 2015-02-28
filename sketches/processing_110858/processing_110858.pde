
int radius = 70;
int ydistance = radius/2;
int xdistance = radius/2;

int speed = 6;
int xdirection = 1;
int ydirection = 1;

void setup() {
  size (1200, 800);
  smooth();
  colorMode(HSB, 360, 100, 100);
}

void draw() {

  stroke(369, 0, 0);
  strokeWeight(3);
  background(0, 0, 100);
  
  color awesome = color(random(360), random(100), random(100));

  ellipse(xdistance, ydistance, radius, radius);//DAT BALL

  ydistance += speed*ydirection;
  xdistance += speed*xdirection;

  rectMode(CENTER);//PONG PADDLE THINGY
  rect(mouseX, height-100, 150, 20);

  //HITTING DA PADDLE????????????
  if ((ydistance > height-94-radius/2) && (xdistance > (mouseX-75)) && (xdistance < (mouseX+75))) {
    fill(awesome);
    ydirection = -ydirection;
  }
  
  //HITTING DA BOTTOMMMMM???
  if (ydistance > height - radius/2) {
  ydirection = -ydirection;
  }

  //HITTING THE TOP?
  if (ydistance < 0 + radius/2) {
    fill(awesome);
    ydirection = -ydirection;
  }

  //HITTING THE RIGHT
  if (xdistance > width-radius/2) {
    fill(awesome);
    xdirection = -xdirection;
  }

  //HITTING THE LEFT?
  if (xdistance < 0+radius/2) {
    fill(awesome);
    xdirection = -xdirection;
  }
}
