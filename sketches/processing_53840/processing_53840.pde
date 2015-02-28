
class Baby {
  float x;        //x position of Baby
  float y;        //y position of Baby
  float spdY;     //velocity in the y-direction of Baby
  float gravity;  //gravity makes Baby accelerate downwards
  float damping;  //damping helps Baby come to a vertical rest

  //Constructor
  Baby (float Babyx, float Babyy) {
    x = Babyx;
    y = Babyy;
    spdY = 5;
    gravity = .04;
    damping = .1;
  }

  //Methods
  void update() {
    spdY = spdY + gravity;
    y = y + spdY;
    
  // reaching bottom edge, reverse y and apply damping
  if (y + height/12 > height){
    y = height - height/12;
    spdY = -spdY;
    spdY = spdY * damping;
  }
  }
  
  //Draw Baby in a Sack
  void display() {
    fill (random(200, 255));
    noStroke();
    ellipseMode(CENTER);
    ellipse (x, y+height/20, width/15, height/14);
    triangle (x-width/45, y-height/75, x, y+height/50, x+width/45, y-height/75);
    noFill();
    stroke(0);
    strokeWeight(2);
    
    //Sack's drawstring and knot
    arc(x, y, width/15, height/35, -0.9*PI/3.5, PI/2);
    arc(x, y, width/15, height/35, PI/2, 4.4*PI/3.5);
    fill(0);
    ellipse (x, y+height/60, width/95, height/175);
  }
}

