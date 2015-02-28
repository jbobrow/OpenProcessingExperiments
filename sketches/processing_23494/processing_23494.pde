

class Bubble {

  PVector pos; // position
  PVector vel; // change in position per fram 

  Bubble( PVector _pos, float _s  ) { // constructor - makes a new object
    pos = _pos; // take the incoming info and store it
    vel = new PVector(random(-1.5,1.5),random(-1.5,1.5));
  }

  void render() {
    noStroke(); 
    fill(random(255),100,255,50); // fill the bubble
    ellipse( pos.x, pos.y, 30, 30 ); // draw the bubble
  }

  void move() {
    pos.add(vel); // add velocity vector to the position
    vel.mult(1.0); //multily velcity by 1
  }
}


