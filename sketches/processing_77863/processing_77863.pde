


// ================================================================
// Bullet - Simple class for bullets
// http://www.processing.org/learning/topics/arraylistclass.html

class Bullet {

  float x;
  float y;
  float speedX ;  
  float speedY;
  float w;
  float life = 255;

  Bullet(float tempX, float tempY, // new2
  float tempSpeedX, float tempSpeedY, 
  float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speedX = tempSpeedX; // 4.2; // new2 
    speedY = tempSpeedY; // 0;
  }

  void move() {
    // Add speed to location
    x = x + speedX; 
    y = y + speedY;
    //
    // kill bullet when outside screen
    if (x<4) 
      life=-1;
    if (y<4) 
      life=-1;
    if (x>width-4) 
      life=-1;
    if (y>width-4) 
      life=-1;

    // blue rect
    if (x>=100 && y>=100 && x<=140 && y<=140)   
      life=-1;
    //
    if (life==-1) 
      explode () ;
  } // method 

  void explode () {
    // explode!
    int maxMissiles= int(random(4, 222));
    for (int i=0; i<maxMissiles; i+=1) {   
      // this is where explode missile/shrapnel object is created
      // and added to the missiles arrayList.
      // It is small (4) and life decrease is .72 (how fast it dies),
      // no Line (false).
      missiles.add( new Explosion(
      random(x-3, x+3), random(y+9, y+12), 
      random(-1.3, 1.3), random(-2.7, .6), 
      4, .72, false)); //
    }
  } // method

  boolean finished() {
    // bullet dead?
    if (life < 0) {
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {
    // Display the circle
    fill(244, 2, 2);
    noStroke();
    //stroke(0,life);
    ellipse(x, y, w, w);
    // image( ammo_fired, x, y );
  }
} // class 
//


