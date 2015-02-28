

// -- -- -- Cell Class

class Cell{
  // - - - Variables
  PVector pos; //  vector for position(x,y)
  PVector vel; //  velocity
  float rad; // variable for radius
  int age;// age counter
  boolean stuck; 
 
  
  // - - -Constructor
 Cell(PVector _pos, PVector _vel, float _rad ) { 
   pos = _pos;
   vel = _vel;
   rad = _rad; 
   age = 0;  // start age counter at 0
   stuck = false;

   cells.add(this); // add myself to the cells list
  
  }  
  
  //- - - Run Function
  void run() {
    pos.add(vel); // add velocity to position
   if (pos.x > width || pos.x < 0 || pos.y < 0 || pos.y > height) cells.remove(this); // offscreen cells are removed
      // if a cell y position > 500
      if (pos.y > height) {
      stuck = true;// if the cell stuck together
     vel.mult(0); // make the value of velocity to 0
    }
    age++;  // age cell
}


  // - - - Render Function
  void render(){
      if (this == seed) return;// if you are the seed, don't draw

      float d = dist( pos.x, pos.y, width/2, height/2 ); // change color based on the distance from the seed
 
      if ( !stuck ) return; // if the ellipse not stick, not run the next 3 ines
      if (stuck) fill(d); // if cells stuck, fill color d
      else fill (255); // if cells not stuck, fill white color
      ellipse(pos.x, pos.y, rad*2, rad*2);// draw circle at cell position
       
    }
  
  
  // - - - Stick Function
  void stick() {
    if (stuck == false) {
      for (Cell c : cells) {
        // check for a collision
        if (c.stuck == true && c != this && pos.dist(c.pos) < (rad + c.rad/2)) {
          stuck = true;
          vel.mult(0); // make velocity 0
          return;
        }
      }
    }
  }
  
  }


