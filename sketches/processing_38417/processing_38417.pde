
//paint dark blue background.
//draw vertical lines from top/bottom of sketch, starting on left,  
//lessen density/number of vertical lines as approach right side of sketch
//blue/grey stroke.
//in lower right quadrant: 
//draw circle with thick stroke 1/5th the width of sketch and diameter 4/5ths the width, 
//orange stroke, 50% transparency.
//also in lower right quadrant:
//draw 24 orbs to form a circle, each orb rotated 15 degrees from the former and all neighbors touching,
//white stroke & light green fill.


void setup() {
  background(5, 5, 45);
  size (500, 500);
  smooth();
}

void draw() {
}

void mouseClicked() { //run this loop each time mouse clicked
  background(5, 5, 45);

  //vertical stripes
  stroke(50, 60, 90);
  strokeWeight(1);
  for (int lineX = height; lineX >=1; lineX/=random(1.2,2)) {  //setting up (somewhat) randomly spaced vertical lines
    for (int lineY = 500; lineY >=1; lineY/=random(1.2,2)) { //setting up another layer of vertical lines
      line (lineY, height, lineY, 0);
    }
  }

  //orange "shadow"
  strokeWeight(width/5);
  stroke(240, 120, 45, 120);
  noFill();
  ellipse ( random(300, 400), random(300, 400), 300, 300);


  //orb circle
  translate (random(300, 400), random(300, 400)); //change origin to random spot in lower right corner for orbs to rotate around
  for (int x = 0; x < 24; x++) { //controls number of orbs composing circle
    rotate(radians(15));
    for (int circle = width/14; circle >=0; circle-=10) { // draw inner lines of orb starting with largest
      fill(80, 155, 70);
      stroke(255);
      strokeWeight(circle/14);
      ellipse(width/5, width/5, width/14, circle);
    }
  }
}


