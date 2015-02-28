



// the tab for Explosions and related and the complete class

void ExplosionManager() {
  // this is a new for loop. 
  // Actually for the Shrapnels.
  for (Explosion m: missiles) {
    m.decreaseLife(); // call the decrease life (for explosion)
    m.fly();          // call the "fly" method of the missile
    m.display();      // call the "display" method of the missile
  }
  //
  // remove dead ones (you need to have a conventional for-loop here) 
  for (int i=missiles.size()-1; i>=0; i--) {
    Explosion m = (Explosion) missiles.get(i);
    if (m.dead) {
      missiles.remove(i);
    }
  }
} // func

// ===============================================================

class Explosion {
  float startlocX, startlocY; // start pos 
  float x, y;          // current pos 
  float xvel, yvel;    // velocity
  float sizeMissile ;  // size for rect
  float life=20;       // how much lifes does it have
  float lifeDecrease;  // remove lifes
  boolean dead=false;  // is it alive? 
  boolean withLine;    // draw line? Explosion has none.
  //
  // contructor
  Explosion(
  float _startlocX, float _startlocY, 
  float _xvel, float _yvel, 
  float _size, float _lifeDecrease, 
  boolean _withLine) 
  {
    startlocX = _startlocX;
    startlocY = _startlocY;    
    x = startlocX;
    y = _startlocY;
    sizeMissile = _size;
    lifeDecrease=_lifeDecrease;
    xvel = _xvel;
    yvel = _yvel;
    withLine=_withLine;
  }  // contructor
  //
  void display() {
    //stroke(255, 2, 2);
    fill(255, 2, 2);
    noStroke();
    if (withLine) {
      line(startlocX, startlocY, x, y);
    }
    sizeMissile-=.07;
    rect(x, y, sizeMissile, sizeMissile);
  } // method
  //
  void fly() {
    x += xvel;
    y += yvel;
  } // method
  //
  void decreaseLife() {
    life-=lifeDecrease;
    if (life<=0 || sizeMissile<=0) {
      dead=true;
    }
  } // method
  //
} // class
//
// ======================================================================


