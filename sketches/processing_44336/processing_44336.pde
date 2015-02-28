
// -- -- -- Cell Class

class Cell{
 // - - - Variables
  PVector pos;//  vector for position(x,y)
  PVector vel;//  velocity
  float rad;// variable for radius
  int age;// age counter
  boolean stuck;
 
  int stuckTime;
  boolean isSeed;
  
  // - - -Constructor
 Cell(PVector _pos, PVector _vel, float _rad, boolean isS ) {
   pos = _pos;
   vel = _vel;
   rad = _rad; 
   age = 0;// start age counter at 0
   
   stuck = false;
   isSeed = isS;
   cells.add(this);// add myself to the cells list
  
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
    age++; // age cell 
}
  
  // - - - Render Function
  void render(){
       
       if (isSeed) return;// if you are the isSeed, don't draw
       if ( !stuck ) return; // if the ellipse not stick, not run the next 3 ines
       
       if (stuck) fill(255-(age*0.2),255-(age*0.5),255-(age*0.8));// if the cells stuck with the seeds, change color based on age
       else fill (255);// if cells not stuck, fill white color
       ellipse(pos.x, pos.y, rad*2, rad*2);// draw circle at cell position
       
    }
  
  
  // - - - Stick Function
  void stick() {
    if (stuck == false) {
      for (Cell c : cells) {
        // check for a collision
        if (c.stuck == true && c != this && pos.dist(c.pos) < (rad + c.rad)) {
          stuck = true;
          stuckTime = millis();
          vel.mult(0); // make velocity 0
          return;
        }
      }
    }
  }
  
  }


