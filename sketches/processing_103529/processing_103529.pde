
/**
 * BeetleChase: beetles wander around the screen, avoid the mouse,
 * converge on the mouse when pressed.
 *
 * The beetles are given a little random "jiggle" in their motion
 * to make it look like they're walking on stiff legs.
 *
 * Bruce Wilson, 5/2/2013
 */

final static int kBackColor = 40;

final static int kNumBeetles = 30;
final static int kBeetleSize = 35;

Beetle[] beetles = new Beetle[kNumBeetles];

color[] colors;

boolean pauseAnimation = false;

String caption = "Try to click a beetle with the mouse";
int captionSeconds = 2;

void setup() {
    size(750, 500);
    
    smooth();
    
    background(kBackColor);
    
    colors = new color[]{
      color(150, 0, 0),
      color(0, 150, 0),
      color(0, 0, 150),
      color(20, 20, 20),
      color(160, 160, 160)
    };
    
    for ( int i = 0; i < beetles.length; i++ ) {
      float x = random(0, width), y = random(0, height);
      
      color c = colors[i % colors.length];  // rotate through color choices
      // color c = colors[floor(random(0,colors.length))];  // random color selection
      
      beetles[i] = new Beetle(x, y, kBeetleSize, c);
      beetles[i].giveRandomSpeed();
    }
    
    frameRate(40);
}

void draw() {
  if ( pauseAnimation ) return;
  
  background(kBackColor);
  
  for ( int i = 0; i < beetles.length; i++ ) {
    Beetle b = beetles[i];
    
    if ( mousePressed ) {
      b.moveToward( mouseX, mouseY );    // attack
    } else if ( b.isClose(mouseX, mouseY) ) {
      b.moveAwayFrom( mouseX, mouseY );  // avoid
    }
    
    b.move();
    b.avoidOthers(beetles);
    b.keepOnScreen();
    b.draw();
  }
  
  if ( caption != null ) {
    pushStyle();
    textSize(24);
    fill(240, 240, 240);
    text(caption, (width - textWidth(caption)) / 2, height / 2);
    popStyle();
  }
  
  if ( frameCount > (frameRate * captionSeconds) ) {
    caption = null;
  }
}

void keyPressed() {
  if ( (key == 'P') || (key == 'p') ) {
    pauseAnimation = !pauseAnimation;
  }
}

/**
 * Beetle: a round figure with eyes that roams around the window,
 * avoiding the mouse and other beetles.
 *
 * Bruce Wilson, 5/2/2013
 */

class Beetle {
  float x = 0, y = 0;     // position
  float xv = 0, yv = 0;   // velocity
  float body = 50;
  float halfBody = body / 2.0;

  float eye = 10;
  float xeye = body / 2.2;
  float yeye = body / 5.0;

  float heading = 0;     // facing direction: angle in radians
  color bodyColor;

  final static int ROAM_SPEED = 5;
  final static int ATTACK_SPEED = 5 * ROAM_SPEED;
  final static int JIGGLE = 5;
  
  final static int AVOIDANCE_DISTANCE = 70;  // 100
  final static int PERSONAL_DISTANCE = 10;
  final static int CLOSE_TO_EDGE = 10;
  
  Beetle(float x, float y, float size, color bodyColor) {
    this.x = x;
    this.y = y;
    this.bodyColor = bodyColor;
    this.body = size;
    this.halfBody = size / 2.0;
    this.heading = 0.0;   // angle (radians)
    this.eye = size / 5.0;
    this.xeye = size / 2.2;
    this.yeye = size / 5.0;
  }
  
  void move() {
    x += xv;
    y += yv;
    
    // Make the beetle jiggle a little bit in its position
    if ( JIGGLE > 0 ) {
      x += random(-JIGGLE, JIGGLE);
      y += random(-JIGGLE, JIGGLE);
    }
  }
  
  // Turn the beetle to face the direction that it's going
  void turn() {
    float xyLength = dist(0.0, 0.0, xv, yv);
    heading = acos(xv / xyLength);
    if ( yv < 0 ) heading = TWO_PI - heading;
  }
  
  void giveRandomSpeed() {
    xv = random(-ROAM_SPEED, ROAM_SPEED);
    yv = random(-ROAM_SPEED, ROAM_SPEED);
    turn();
  }
  
  // Move toward a given location (such as the pressed mouse location)
  void moveToward(int xTo, int yTo) {
    float toDist = dist(x, y, xTo, yTo);
    float xDiff = xTo - x;
    float yDiff = yTo - y;
    
    xv = ATTACK_SPEED * xDiff / toDist;
    yv = ATTACK_SPEED * yDiff / toDist;
  }
  
  // Move away from a given location (such as the mouse location)
  void moveAwayFrom(int xFrom, int yFrom) {
    // Move away laterally if close to an edge of the window
    if ( (x < (halfBody + CLOSE_TO_EDGE)) || (x > (width - halfBody - CLOSE_TO_EDGE)) ) {
      xv = 0.0;
      yv = ROAM_SPEED;
    } else if ( (y < (halfBody + CLOSE_TO_EDGE)) || (y > (height - halfBody - CLOSE_TO_EDGE)) ) {
      xv = ROAM_SPEED;
      yv = 0.0;
    }
    
    // Otherwise move away from the given location
    float fromDist = dist(x, y, xFrom, yFrom);
    float xDiff = x - xFrom;
    float yDiff = y - yFrom;
    
    xv = ROAM_SPEED * xDiff / fromDist;
    yv = ROAM_SPEED * yDiff / fromDist;
  }
  
  // Change direction to move slightly away from another
  void divergeFrom(Beetle other) {
    moveAwayFrom((int)other.x, (int)other.y);  // TODO: not yet working

    // TODO: use relative headings?    
//    xv = 0.90 * xv + 0.20 * random(-other.xv, other.xv);
//    yv = 0.90 * yv + 0.20 * random(-other.yv, other.yv);
  }
  
  // Avoid collisions with other beetles
  void avoidOthers(Beetle[] all) {
    for (int i = 0; i < all.length; i++) {
      Beetle b = all[i];
      if ( b == this ) continue;  // don't check with self
      if ( isNearby(b) ) {
        divergeFrom(b);
        break;
      }
    }
  }
  
  // Is this beetle within avoidance distance of a given location?
  boolean isClose(int xFrom, int yFrom) {
    return dist(x, y, xFrom, yFrom) < AVOIDANCE_DISTANCE;
  }
  
  // Is the given point within the body of this beetle?
  boolean isWithin(int xFrom, int yFrom) {
    return dist(x, y, xFrom, yFrom) < halfBody;
  }
  
  void keepOnScreen() {
    if ( x < halfBody ) {
      xv = -xv;
      x = halfBody;
    } else if ( (x > (width - halfBody)) ) {
      xv = -xv;
      x = width - halfBody;
    }
    
    if ( y < halfBody ) {
      yv = -yv;
      y = halfBody;
    } else if ( (y > (height - halfBody)) ) {
      yv = -yv;
      y = height - halfBody;
    }
    
    turn();
  }
  
  // Is this beetle close to another?
  boolean isNearby(Beetle other) {
    if (this == other) return false;  // don't check against self
    if (other.x > (x + halfBody + PERSONAL_DISTANCE)) return false;
    if (other.x < (x - halfBody - PERSONAL_DISTANCE)) return false;
    if (other.y > (y + halfBody + PERSONAL_DISTANCE)) return false;
    if (other.y < (y - halfBody - PERSONAL_DISTANCE)) return false;
    return true;
  }
  
  void draw() {
    pushStyle();
    pushMatrix();
    
    // position the beetle and face it in the direction of travel
    translate(x, y);
    rotate(heading);
    
    // draw the body
    fill(bodyColor);
    ellipse(0, 0, body, body);
    
    // draw the eyes
    fill(240);
    ellipse(xeye, yeye, eye, eye);
    ellipse(xeye, -yeye, eye, eye);
    
    popMatrix();
    popStyle();
  }
}



