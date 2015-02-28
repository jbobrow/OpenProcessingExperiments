
//*********************************** 
// E.V.
// December 12, 2013
// CS152
// Assignment 8
// Starter code by Prof. Kelley
// http://cs.unm.edu/~pgk/152f13/
//***********************************


// Game State  
int numAsteroids = 20;   // start number of asteroids (not updated)
int lives = 3;           // number of lives
int score = 0;           // player's score
boolean _isAlive = true;  //does the ship still have lives left?
boolean endGame;         //directs player to the "you won" screen (when asteroid array list = 0)

// Display Properties
int charSize = 16;       // size of the ship

// Movement
int   incVal = 1;            // amount speed increases
float amountMove = 1;        // amount to move each step
float slowDown = .97;          // the ship slows down over time (I don't know why)
float directionChange = .2;   // how much the ship rotates with left-right keypress

// Mode
boolean playMode = true;       // is the game playable?

// Objects
Player p1; 
ArrayList<Asteroid> asteroids;
ArrayList<Laser> lasers;

Laser l;
Asteroid a;

void setup() {
  size( 700, 400 );
  background( 000 ); 
  smooth();

  // Font loading
  PFont font;
  font = loadFont("DIN-Bold-48.vlw");
  textFont(font, 24);

  // Create player, and lists of asteroids and lasers
  p1 = new Player();   
  asteroids = new ArrayList();
  lasers = new ArrayList();

  // Initialize all the asteroids
  for ( int i=0; i<numAsteroids; i++ ) {
    asteroids.add( new Asteroid() );
  }
}

void draw() {
  background( 000 );

  if ( playMode ) {
    // Things to do each frame we render:
    checkAsteroidDeath();  // did any asteroids explode?
    checkShipDeath();      // did the ship explode?

    drawAsteroids();       // draw the asteroids
    drawLasers();          // draw the lasers
    //When playMode starts, you have lives.
    if (_isAlive) {
      p1.draw();             // draw the ship
    }
    showLives();           // draw the life display
    showScore();           // draw the score display
    showAsteroids();       // draw the asteroids display
  } 
  else {

    if (endGame == true) {
      // Things to show when the game is won!
      fill( #FFFFFF );
      text( "You Win :-)\n\nScore: " + score, width/2-40, height/2);
    } 
    else {
      // Things to show after the game is over!

      fill( #FFFFFF );
      text( "Game Over :-(\n\nScore: " + score, width/2-60, height/2);
    }
  }
}

void drawAsteroids() {
  for ( int i=0; i<asteroids.size(); i++ ) {
    asteroids.get(i).draw();
  }
}

void drawLasers() {
  // draw all the lasers!
  for ( int i=0; i<lasers.size(); i++ ) {
    lasers.get(i).draw();
  }
}

// this method does not need to be changed, but adds 
// a laser to the lasers "array"
void addLaser( Laser l ) {
  lasers.add( l );
}

// this method does not need to be changed, but removes 
// a laser from the lasers "array"
void removeLaser( Laser l ) {
  lasers.remove( l );
}

void checkAsteroidDeath() {
  // for each asteroid
  // check to see if it is touching any lasers
  // if it is touching any lasers, 
  // remove() the laser
  // remove() the asteroid
  // add +10 to the score

  for (int c = 0; c < asteroids.size(); c++) {
    Asteroid a = asteroids.get(c); 
    float aX = a.getX(); //asteroid x
    float aY = a.getY(); //asteroid y
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      float lX = l.getX(); //laser x
      float lY = l.getY(); //laser y
      //if asteroids and lasers touch (x + y are in proximity)
      //remove the laser and asteroid, add +10 to score
      if ((sq(aX - lX) + sq(aY-lY)) < 160) {
        asteroids.remove(c);
        lasers.remove(i);
        score += 10;
      }
      //if there are no more asteroids in the array list...
      if (asteroids.size() == 0) {
        playMode = false;//ends playMode
        endGame = true; //takes player to "you won" screen
        lives = 0;
      }
    }
  }
}

void checkShipDeath() {
  // check to see if any of the asteroids
  // have hit the ship, if they have:
  //    remove a life
  //    and call resetShip()
  // if no lives are left (lives < 0)
  // then change playMode to false.
  for (int c = 0; c <asteroids.size(); c++) {
    Asteroid a = asteroids.get(c);
    float aX = a.getX(); // asteroid x
    float aY = a.getY(); // asteroid y
    float pX = p1.getX(); //ship x
    float pY = p1.getY(); //ship y
    //if the ship and asteroids touch
    if ((sq(aX - pX) + sq(aY-pY)) < 320) {
      asteroids.remove(c);
      //p1.remove();  remove doesn't work for p1, because it isn't an arraylist
      if (lives > 1)
      {
        //take a life away 
        lives--;
        // Reset the ship
        resetShip();
      }
      else
      {       
        playMode = false; //no more lives, takes you to game over screen
        _isAlive = false; //You are dead, so stop drawing
      }
    }
  }
}

void resetShip() {
  //set the ship back in the center:
  p1.x = width/2; 
  p1.y = height/2;
  //set the ship's speed & direction
  p1.speed = 0;
  p1.direction = 0;
}

void keyPressed() {
  if (playMode) { 
    if (key == CODED) {
      if (keyCode == DOWN) { 
        p1.setSpeed( -incVal/2.323453 );
      }  

      if ( keyCode == UP) { 
        p1.setSpeed( incVal );
      }
      if (keyCode == LEFT) { 
        p1.setDirection( -directionChange );
      }
      if ( keyCode == RIGHT) {
        p1.setDirection( directionChange );
      }
    }
      if (key == ' ') {
        addLaser(p1.shoot());
      }
    
  }
}

void showLives() {
  fill( #FFFFFF );
  text( "Lives: " + lives, 10, 30);
}

void showScore() {
  fill( #FFFFFF );
  text( "Score: " + score, width-120, 30);
}

void showAsteroids() {
  fill( #FFFFFF );
  text( "Asteroids: " + asteroids.size(), 10, height-10);
}



public class Asteroid {
  float x;
  float y;
  float speed;
  float direction;
  int size;

  Asteroid() {
    // set the position to be somewhere in space
    // also, as a better case, don't put it near the ship
    // at the beginning.
   
    x = random(width);
    y = random(height);
    //keeps the asteroids from starting near the ship at the beginning
    if(sq(width/2 - x) + sq(height/2 - y) < 6000){ 
      x = random(width);
      y = random(height);
    }

    // set the speed and direction of the asteroid
    // randomly (within some good range)    
    speed = 1.6;
    direction = random( -1, 1);

    // set the size of a default asteroid
    size = 20;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  void draw() {
    // run the updatePosition method to make the 
    // asteroid calculate where it should be next
    updatePosition();

    // set a color/stroke for asteroids 
    noStroke();
    fill(#ea8e47);

    // draw the asteroids
    ellipse( x, y, size, size );
  }

  void updatePosition() {
    // update the position of the asteroid
    // x and y should change based on the speed and direction
    // of the asteroid.
    x = x + (speed*cos(direction));
    y = y + (speed*sin(direction));   
    // if the asteroid is going off the canvas
    // move it to the other side
    int diam = size/2;
    if ( x < -diam ) {
      x = width + diam;
    }
    if ( x > width + diam ) {
      x = -diam;
    } 
    if ( y < -diam ) {
      y = height + diam;
    }
    if ( y > height + diam) {
      y = -diam;
    }
  }
}



public class Laser {
  float x;
  float y;
  float speed;
  float direction;
  int lifeSpan;

  //set the size if it is an ellipse laser
  int size = 2;


  Laser( float x, float y, float d ) {
    // set the position to be whatever is passed in
    this.x = x;
    this.y = y;

    // set the direction 
    direction = d;

    // set the speed
    speed = 6;

    // set the lifespan (to a number of frames)
    lifeSpan = 60;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  public void updatePosition() {
    // update the position of the laser
    // x and y should change based on the speed and direction
    // of the laser.

    x = x + (speed*cos(direction));
    y = y + (speed*sin(direction));


    // if the laser is going off the canvas
    // move it to the other side

    //code for line laser
    if ( x < -x ) {
      x = width;
    }
    if ( x > width ) {
      x = 0;
    } 
    if ( y < -y ) {
      y = height;
    }
    if ( y > height) {
      y = 0;
    }


    /*code for ellipse laser:
     int diam = size/2;
     if ( x < -diam ){
     x = width + diam;
     }
     if ( x > width + diam ){
     x = -diam;
     } 
     if ( y < -diam ){
     y = height + diam;
     }
     if ( y > height + diam){
     y = -diam;
     }
     */

    // make the lifespan go down
    // if this laser is dead, call removeLaser
    lifeSpan -= 1;//lifeSpan decreases by 1 each updatePosition
    if (lifeSpan == 0 ) {
      removeLaser(this);//removes itself
    }
  }





  public void draw() {
    // run the updatePosition method to make the 
    // laser calculate where it should be next
    updatePosition();

    // set a color/stroke for lasers 
    stroke( #b70000 );
    strokeWeight( 2 );

    // draw the laser
    line( x, y, x+20*cos(direction), y+20*sin(direction) );
    //my attempts at other shapes for the laser:
    //ellipse( x, y, size, size ); 
    //triangle(y-1, x+1, y+1, x+1, y, x);
    //triangle(x, y, x+1, y+1, x+1, y-1);
    
  }
}



public class Player {
  float x;
  float y;
  float speed;
  float direction;

  Player() {
    // start the ship/player in the middle of the screen
    x = width/2;
    y = height/2;

    // set initial speed/direction
    speed = 0;
    direction = 0;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  public void updatePosition() {
    // update the position of the ship/player
    // x and y should change based on the speed and direction
    // of the ship/player.
    x = x + (speed*cos(direction));
    y = y + (speed*sin(direction));  
    // if the ship/player is going off the canvas
    // move it to the other side
    int diam = charSize/2;
    if ( x < -diam ) {
      x = width + diam;
    }
    if ( x > width + diam ) {
      x = -diam;
    } 
    if ( y < -diam ) {
      y = height + diam;
    }
    if ( y > height + diam) {
      y = -diam;
    }


    // slow down the speed of the ship by multiplying it
    // by slowDown. I don't know why the ship experiences
    // resistance in space but nothing else does.
    speed = slowDown * speed;
  }

  public void draw() {
    // run the updatePosition method to make the 
    // laser calculate where it should be next
    updatePosition();

    // set a color/stroke for the ship 
    fill(#47a3ea);
    stroke(#47a3ea);
    strokeWeight( 5 );
    //draws the ship in a triangle:
    triangle(x+20*cos(direction), y+20*sin(direction), x+charSize/3*cos(direction + PI/2), y+charSize/3*sin(direction + PI/2), x+charSize/3*cos(direction - PI/2), y+charSize/3*sin(direction - PI/2));
    //draws the ship in the circle w/ line from the starter code:
    //ellipse( x, y, charSize, charSize );
    //line( x, y, x+20*cos(direction), y+20*sin(direction) );
  }

  public void setSpeed( float a ) {
    // change speed by a
    speed = speed + a;
  }

  public void setDirection( float a ) {
    // change direction by a
    direction = direction + a;
  }

  Laser shoot() { 
    // create a new Laser object and return it
    Laser l = new Laser(x, y, direction);
    return l;
  }
}



