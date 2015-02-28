
float r = 0;
float r2 = 0;
float r3 = 0;
float r4 = 0;
float r5 = 0;

void setup() {
  size(500, 500);
  smooth();
  background(255, 255, 0);
}

//random variables for change colors and stroke weight
void mouseDragged() {
  r = random(5);
  r2 = random(255);
  r3 = random(255);
  r4 = random(255);
  r5 = random(50, 100);
}

void draw() {

  noStroke();
  fill(200, 200, 0);
  rect(0, 0, width, 25);

//erase the post-it, genereting new background
  if (mouseY < 25 && mousePressed) {
    background(255, 255, 0);
  }

//mosepressed generete a line following the mouse, greys and size are random
  if (mousePressed && (mouseButton == LEFT)) { 
    strokeWeight(r);
    stroke(r2);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
//right click generete line colorful  
  if (mousePressed && (mouseButton == RIGHT)) {
    strokeWeight(r);
    stroke(r2, r3, r4);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}


