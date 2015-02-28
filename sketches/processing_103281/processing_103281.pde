
//Samwise Pollack
//July 8th, 2013
//Smily Face: a face that follows your mouse and gets happy when you click

float x;
float y;
float easing = 0.1;
float diameter = 12;

void setup() {
  size(500, 500); //sets stage
  background(24, 4, 250); //makes it blue
  ellipseMode(CENTER); //centers the circles
  smooth(); //not sure what this does, but thought I should put it in
}

void draw() {
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  
  background(24, 4, 250);
  //head:
  fill(5, 250, 31);
  ellipse(x, y, 100, 100);
  //eyes:
  fill(0);
  ellipse(x+30, y-20, 10, 10);
  ellipse(x-30, y-20, 10, 10);
  //mouth:
  strokeWeight(3);
  line(x+10, y+20, x-10, y+20);
  
  if (mousePressed == true) {
    background(247, 184, 7);
    //head:
    fill(250, 5, 206);
    ellipse(x, y, 100, 100);
    //eyes:
    fill(0);
    ellipse(x+30, y-20, 10, 10);
    ellipse(x-30, y-20, 10, 10);
    //mouth:
    fill(255);
    arc(x, y+20, 50, 30, 0, PI);
  }
}
