
//Project: Goal
//Assignment: something that has a message (hidden or visible)
//class: AVSYS Spring 2013

//message: if you look hard enough, you'll find it.

void setup() {
  size(800, 600);
  smooth();
  noStroke();
}

void draw() {
  background(200);
  
  if (pmouseX > 795 && pmouseY > 580) {
    fill(random(255));
    rect(0, 0, width, height);
    
    fill(0);
    ellipse(width, 580, 10, 10);
    
    for (int i=0; i<50; i++) {
      fill(0);
      ellipse(random(width)*i-10, random(height)*i-10, 10, 10);
    }
  }
}


