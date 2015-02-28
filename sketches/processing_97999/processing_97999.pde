
//Alex LeBlanc
//Rain Game Modifications
//18 March 2013
//AME294

Catcher catcher;
Drop[] drops;
int numberOfDrops;
Timer timer;
int score;
int RainDrops;

void setup() {
  size( 800, 600 );
  smooth();
  
  catcher = new Catcher( 32 );
  drops = new Drop[1000];
  numberOfDrops = 0;
  
  
  timer = new Timer( 1000 );
  score = 10;
  RainDrops = 0;
}

void draw() {
  background( 128 );
  
  catcher.move();
  catcher.render();
  
  for (int i = 0; i < numberOfDrops; i++) {
    drops[i].move();
    if (catcher.intersect( drops[i].x, drops[i].y, drops[i].r ) == true) {
      println( "BOOM" );
      drops[i].caught();
    }
    if (drops[i].hitTheBottom() == true) {
      score = score - 1;
      println( score );
      if( score == 0 ) {
        noLoop();
      }
    }
    drops[i].render();
  
  //score bar
  float meterWidth = 200;
  float srw = ((float)score / 10.0) * meterWidth;
  float srh = 30;
  noStroke();
  fill( 90, 240, 200, 100 );
  rect( 550, 10, srw, srh );
  stroke(255);
  noFill();
  rect( 550, 10, meterWidth, srh );
  }
  
  harvestDrops();
  
  if (timer.isFinished() == true) {
    createDrop();
    RainDrops++;
    println( "RainDrops" + RainDrops );
    if (RainDrops % 5 == 0) {
    RainDrops = 0;
    timer.duration = int(timer.duration * 0.9);
    if (timer.duration <= 10) {
      timer.duration = 10;
      }
      println( "new duration: " + timer.duration );
    }
    timer.start();
  }
  //println( numberOfDrops );
}


// look at all the drops, and remove the drops that
// are no longer "living".
void harvestDrops() {
  int i = 0;
  while (i < numberOfDrops) {
    if (drops[i].living == false) {
      // remove drop from the array
      // by moving all the drops from later in the 
      // array forward one.
      int j = i + 1;
      while (j < numberOfDrops) {
        drops[j-1] = drops[j];
        j++;
      }
      numberOfDrops--;
    }
    i++;
  }
}


// Make a new drop and add it to the game
void createDrop() {
  Drop newDrop = new Drop();
  drops[numberOfDrops] = newDrop;
  numberOfDrops++;
}
class Catcher {
  float x;
  float y;
  float r; // radius
  color fillColor;

  Catcher( float _r ) {
    x = 0.0;
    y = 0.0;
    r = _r;
    fillColor = color( 30, 230, 30 );
  }

  void render() {
    stroke( 0 );
    fill( fillColor );
    ellipse( x, y, r * 2, r * 2 );
  }

  void move() {
    x = mouseX;
    y = mouseY;
  }

  // return true if the catcher intersects with a circle.
  // cx, cy, cr specify the other circle.
  boolean intersect( float cx, float cy, float cr ) {
    float distance = dist( x, y, cx, cy );
    if (distance < (r + cr)) {
      return true;
    }
    return false;
  }
}

class Drop {
  float x;
  float y;
  float r; // radius
  color fillColor;
  float speed;
  boolean living;

  Drop() {
    r = 8.0;
    x = random( r, width-r );
    y = -r;

    fillColor = color( 30, 30, 240 );
    speed = random( 1.0, 5.0 );
    living = true;
  }

  void render() {
    if (living) {
      stroke( 0 );
      fill( fillColor );
      ellipse( x, y, r*2, r*2 );
    }
  }

  void move() {
    y = y + speed;
  }

  // things to do when the drop is caught
  // by the catcher.
  void caught() {
    living = false;
  }

  // return true if the drop has gone past (below)
  // the bottom of the screen.
  boolean hitTheBottom() {
    if (y + r > height) {
      living = false;
      return true;
    }
    return false;
  }
}

class Timer {
  int duration;   // time in milliseconds
  int startTime;

  Timer( int _duration ) {
    duration = _duration;
    startTime = 0;
  }

  // start or restart the timer
  void start() {
    startTime = millis();
  }

  // return true if the timer has expired.
  // (more than duration time since the start time.)
  boolean isFinished() {
    int timeSinceStart = millis() - startTime;
    if (timeSinceStart > duration) {
      return true;
    }
    return false;
  }
}



