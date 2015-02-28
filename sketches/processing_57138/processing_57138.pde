
float speed = 2.5;


void setup () {

  size (600, 600);
  background (260, 60, 20);
  smooth();
  noStroke();
}


void draw() {
  
  for (int y=0; y<=height; y+=40) {
    for (int x=0; x <= width; x+=50) {
    float mx=mouseX/40;
    float offsetA= random(-mx,mx);
    float offsetB= random(-mx,mx);
      fill(100, random(190), random(10));
      ellipse(x+offsetA, y-offsetB, 50, 50);
    }
  } //yellow
  for (int y=0; y<=height; y+=40) {
    for (int x=0; x <= width; x+=50) {
      x += random (-speed, speed);
      fill(230, 230, 10);
      ellipse(x, y, 40, 40);
    }
  }//black
  for (int y=0; y<=height; y+=40) {
    for (int x=0; x <= width; x+=50) {
      fill(30, 20, 20);
      ellipse(x, y, 30, 30);
    }
  } //pink
  for (int y=0; y<=height; y+=40) {
    for (int x=0; x <= width; x+=50) {
      fill(230, random(210), 223);
      ellipse(x, y, 20, 20);
    }
  }
}


