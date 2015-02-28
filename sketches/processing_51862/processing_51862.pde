
// Green-Red-Blue-Balls (oh my)
// (c) 2012 Gabe Johnson <johnsogg@cmu.edu>
 
// 'global' variables
ArrayList<Ball> balls;      // all balls
ArrayList<Ball> collisions; // temp. list of balls that are colliding
ArrayList<Ball> removeUs;   // temp. list that have split and should be removed from 'balls' soon.
ArrayList<Ball> addUs;      // temp. list that will be added to 'balls' soon
float initialBallRadius = 35f;
 
public void setup() {
  size(800, 600); // default size. user can resize window
  smooth(); // anti-alias graphics
 
  // initialize our variables: make a bunch of empty lists.
  balls = new ArrayList<Ball>();
  collisions = new ArrayList<Ball>();
  removeUs = new ArrayList<Ball>();
  addUs = new ArrayList<Ball>();
 
  // now create and place a bunch of green balls. put them in
  // a grid equally spaced around the middle.
  int numInitialBalls = 4;
  int gridSpaces = (int) sqrt(numInitialBalls);
  int xSpacing = (width / (gridSpaces + 1));
  int ySpacing = (height / (gridSpaces + 1));
  float initialDiameter = 2 * initialBallRadius;
  for (int i = 1; i <= gridSpaces; i++) {
    for (int j = 1; j <= gridSpaces; j++) {
      int xLoc = i * xSpacing;
      int yLoc = j * ySpacing;
      Ball babyBall = new Ball(xLoc, yLoc, initialDiameter);
      balls.add(babyBall);
    }
  }
}
 
public void draw() {
  background(0);
 
  // ensure we start with fresh add/remove lists.
  removeUs.clear();
  addUs.clear();
 
  // loop through all the balls and detect collisions.
  for (Ball b : balls) {
    if (!removeUs.contains(b)) {
      collisions.clear(); // the collisions list holds collisions for this ball.
      b.move();
      b.draw();
      // detect collision between this ball and all others
      // and record the results in 'collisions'.
      b.collide(balls, collisions);
      // now resolve the collisions we found. ball types handle collisions differently.
      // some balls might be created and some might be marked for removal.
      for (Ball other : collisions) {
        b.resolveCollision(other, addUs, removeUs);
      }
    }
  }
 
  // remove all the balls that have been marked as such
  balls.removeAll(removeUs);
 
  // add all the new balls, but don't allow there to be more than 100 balls. this should
  // not usually happen, but it is possible. keeping it less than 100 ensures things keep
  // moving along snappily.
  for (Ball addMe : addUs) {
    if (balls.size() < 100) {
      balls.add(addMe);
    }
  }
 
  // red and blue balls change their heading depending on what is nearby.
  for (int i=0; i < balls.size(); i++) {
    balls.get(i).updateHeading(balls);
  }
 
  // on rare occasion, we will send a ball into a flying rage.
  if (random(1.0f) < 0.001f) {
    // pick the smallest ball we can find.
    Ball smallest = null;
    float smallestD = MAX_FLOAT;
    for (Ball b : balls) {
      if (b.d < smallestD) {
        smallest = b;
        smallestD = b.d;
      }
    }
    // ... and send it into a rage!
    if (smallest != null) {
      smallest.anger = 3 * smallest.angerLimit;
      smallest.raging = true;
    }
  }
}
 
 
// ------------------------------------------------------ base Ball class
//
// The base Ball class is used to define the state and behavior of all the
// balls in our little ball-world. It is generic. The red and blue ball
// classes extend this one, so they have all the same state and behavior
// of the generic ones, except when they explicitly override behavior.
class Ball {
  float d; // ball diameter
  PVector loc; // ball location.
  PVector vec; // ball heading.
  int hp; // hitpoints. indicates roughly how many times it has been bonked by other balls.
  int redCollisions, blueCollisions; // count collisions with red and blue balls
  int anger = 0; // anger used when raging. this will decrease with time. (minimum 0)
  int angerLimit = 50; // anger limit. above this, raging balls behave differently.
  boolean raging = false; // says if we are raging or not.
 
  // constructor for a ball. you give it an x,y location and a diameter.
  public Ball(float x, float y, float d) {
    this.hp = Math.min((int) d/3, 5);
    this.loc = new PVector(x, y); // make vector for initial x,y location
    this.d = d;
    // make a random initial heading.
    this.vec = new PVector(random(-1.0f, 1.0f), random(-1.0f, 1.0f));
    // normalizing a vector means making it have length = 1
    vec.normalize();
    // now that the vector heading is set, and it is 1 long, now multiply by
    // three to make it a little bit faster. this means the ball will initially
    // move three pixels every time draw() is called.
    vec.mult(3f);
  }
 
  boolean angry() {
    return raging;
  }
 
  // when red and blue balls collide, they do so with animosity! every time they bonk,
  // they each get a little bit angrier, and at some point they will start raging.
  void collideInAnger(Ball other, ArrayList<Ball> addUs, ArrayList<Ball> removeUs) {
    anger = anger + angerLimit; // increment our anger by the angerLimit.
    // go into a rage if our anger is twice the anger limit.
    if (!angry() && anger > 2 * angerLimit) {
      raging = true;
    }
    // chill out when our anger dips below the limit.
    if (angry() && anger < angerLimit) {
      raging = false;
    }
    // if we are currently raging,  either absorb or split the other ball.
    if (angry()) {
      if (d < other.d) {
        // absorb the other ball when it is bigger than us.
        absorb(other, removeUs);
      }
      else {
        // split the other ball when it is not bigger than we are.
        // the fault line is a vector that points from us to the other ball.
        PVector faultLine = new PVector(other.loc.x - loc.x, other.loc.y - loc.y);
        split(addUs, other, faultLine, false);
      }
      // being fat is reason enough to be happy. if we are so big, just chill out.
      if (d > 60) {
        anger = 0;
      }
    }
  }
 
  /**
   * Move the ball according to the change vector. If it runs into the 'walls' then change the
   * direction vector accordingly. If it did bounce off a wall, return true.
   */
  boolean move() {
    boolean ret = false;
    vec.limit(10f); // limit the speed to 10px per draw()
    if (angry()) { // when we are angry, speed up!
      vec.mult(1.01f);
    }
    loc.add(vec); // move the ball by adding the heading vector to our position.
 
    // now we detect collision with the walls. when a wall collision is detected we
    // start moving towards the opposing wall. for example if we hit the north wall,
    // that means our change in y should become positive so we start heading south.
    float r = d / 2;
    float bot = height - r; // south wall
    float right = width - r; // east wall
    // detect any collision.
    if (loc.y < r || loc.x < r || loc.y > bot || loc.x > right) {
      ret = true;
      // now handle particular cases.
      if (loc.y < r && vec.y < 0) { // hit north wall
        vec.y = -vec.y;
      }
      if (loc.y > bot && vec.y > 0) { // hit south wall
        vec.y = -vec.y;
      }
      if (loc.x < r && vec.x < 0) { // hit west wall
        vec.x = -vec.x;
      }
      if (loc.x > right && vec.x > 0) { // hit east wall
        vec.x = -vec.x;
      }
    }
 
    // cool off, slowly. if we are angry, we have a 5% chance of becoming slightly less angry.
    if (anger > 0 && random(1.0f) > 0.05) {
      anger--;
      if (anger == 0) { // when anger dips to zero, we are no longer raging.
        raging = false;
      }
    }
    return ret;
  }
 
  float mass() { // the mass of a ball is... remember your middle school geometry
    float r = d / 2;
    return PI * r * r; // mass is the circle area: pi * r^2
  }
 
  int getArmorColor() { // armor gets darker when we take damage
    int ret = (int) ((((float) hp) / 20f) / 255f);
    if (ret < 0) {
      ret = 0;
    }
    return ret;
  }
 
  void draw() { // draw a ball
    fill(getColor()); // fill using our color: green, red, or blue.
    noStroke(); // disable the outline around the ball.
    ellipse(loc.x, loc.y, d, d); // draw a solid circle
    noFill(); // now disable fill but enable the outline
    stroke(255, 255, 255); // outline is white
    float w = min(hp, 5f) + 1f; // outline weight gets less as our hitpoints decrease, down to a limit.
    strokeWeight(w);
    ellipse(loc.x, loc.y, d-(w/2f), d-(w/2f)); // draw outline so it straddles the ball surface
  }
 
  int getColor() {
    if (angry()) { // angry balls are orange
      return color(255, 165, 0);
    }
    else {
      // otherwise return a mostly green color, modified somewhat
      // by how many collisions we've had with red and blue balls.
      int red = min(redCollisions, 255);
      int blue = min(blueCollisions, 255);
      int green = min(128 + (hp * 10), 255);
      return color(red, green, blue);
    }
  }
 
  public float radius() { // shortcut to get radius
    return d / 2;
  }
 
  boolean collide(Ball other) {
    // detect a collision with the other ball. this does not
    // take action, just reports collision or no-collision.
    float dist = other.loc.dist(loc); // distance between our center and the other ball center
    float thresh = other.radius() + radius(); // thresh is our radius plus their radius
    if (dist < thresh) { // if the distance is less than the threshold, we are colliding!
      return true;
    }
    else {
      return false;
    }
  }
 
  public void collide(ArrayList<Ball> balls, ArrayList<Ball> collisions) {
    // detect collision with all other balls.
    for (Ball other : balls) {
      if (other != this) { // don't collide with ourselves. that would be weird.
        if (this.collide(other)) {
          collisions.add(other); // when a collision is found, add it to a list for later use.
        }
      }
    }
  }
 
  public PVector bounce(Ball other) {
    // do some vector math to bounce balls off each other. remember what
    // Newton said about conservation of momentum? Ignore him! Instead,
    // just change both ball's headings and ignore their mass.
    PVector toOther = new PVector(other.loc.x - loc.x, other.loc.y - loc.y);
    PVector faultLine = toOther.get();
    toOther.normalize();
    other.vec.add(toOther);
    PVector fromOther = new PVector(-toOther.x, -toOther.y);
    vec.add(fromOther);
    return faultLine;
  }
 
  public void takeDamage() {
    // randomly suffer damage 50% of the time.
    if (random(1.0f) < 0.5f) {
      hp--;
    }
  }
 
  public void resolveCollision(Ball other, ArrayList<Ball> addUs, ArrayList<Ball> removeUs) {
    // the default behavior is just to bounce off
    PVector faultLine = bounce(other); // 'faultLine' records the vector from us to them.
    takeDamage(); // take damage, maybe
    // when hitting red and blue balls, record another collision.
    if (other instanceof RedBall) {
      redCollisions++;
    }
    else if (other instanceof BlueBall) {
      blueCollisions++;
    }
    // when we are out of hitpoints, it is time to split into two using the faultLine
    if (hp < 0) {
      // split ourself in half along the fault line, and add the resulting balls to the addUs list
      split(addUs, other, faultLine, false);
      removeUs.add(this); // remove ourself from play :(
    }
  }
 
  void absorb(Ball other, ArrayList<Ball> removeUs) {
    // possibly absorb another ball. this other ball. it also changes
    // our mass and velocity accordingly.
    // only do this if one of two conditions is true:
    //   * if the other ball is not angry and we are bigger
    //   * if we are angry
    if ((!other.angry() && d > other.d) || angry()) {
      // conserve momentum in the new absorbed ball. get the ball momentums.
      // momentum is mass times velocity: p = m*v
      float r1 = radius();
      float mass1 = mass();
      PVector v1 = vec.get();
      v1.normalize();
      v1.mult(mass1);  // momentum for ball 1
      PVector v2 = other.vec.get();
      float r2 = other.radius();
      float mass2 = other.mass();
      v2.normalize();
      v2.mult(mass2); // momentum for ball 2
      // now figure out what our new mass (diameter) and velocity should be
      float r3 = sqrt(sq(r1) + sq(r2)); // use pythagorean theorem to get new radius
      this.d = r3 * 2f; // diameter is twice that radius.
      // now conserve speed as well. add the ball speeds.
      PVector v3 = vec.get();
      v3.add(other.vec.get());
      this.vec = v3;
      removeUs.add(other); // mark the absorbed ball to be removed
    }
  }
 
  public void split(ArrayList<Ball> addUs, Ball other, PVector faultLine, boolean beGreen) {
    // split the current ball into two, using the other ball's location to decide where to go.
    if (!other.angry()) {
      // don't split if the other ball is angry.
      // the following code is tricky. we want to 'split' ourselves into two while
      // conserving mass and velocity. the resulting balls should move slightly
      // away from each other.
      PVector toOther = new PVector(other.loc.x - loc.x, other.loc.y - loc.y); // us to them
      toOther.normalize(); // turn it into a unit vector
      PVector fromOther = new PVector(-toOther.x, -toOther.y); // them to us as a unit vector
      fromOther.mult(vec.mag() * 0.5f);
      float r = radius();
      float newRad = sqrt(sq(r) / 2f);
      faultLine.normalize();
      faultLine.mult(newRad);
      // make two vectors: faultNorm1 and faultNorm2 that are right angles to the fault line.
      // faultNorm1 and faultNorm2 are opposite from one another.
      PVector faultNorm1 = new PVector(-faultLine.y, faultLine.x);
      PVector faultNorm2 = new PVector(faultLine.y, -faultLine.x);
      // enlarge faultNorm1 and faultNorm2 a small amount. this will result in our baby
      // balls having a little more space between them.
      faultNorm1.mult(1.1f);
      faultNorm2.mult(1.1f);
      // lets make babies!
      Ball baby1 = null;
      Ball baby2 = null;
      // if we are explicitly told our babies must be green, make them green.
      if (beGreen) {
        baby1 = new Ball(loc.x + faultNorm1.x, loc.y + faultNorm1.y, newRad * 2f);
        baby2 = new Ball(loc.x + faultNorm2.x, loc.y + faultNorm2.y, newRad * 2f);
      }
      // otherwise, give our ball world red or blue balls depending on who we think we
      // have less of (in order to keep some balance). If we have bumped into more red balls,
      // then add blue balls. If we have met more blue, then add more red.
      else if (redCollisions > blueCollisions) {
        baby1 = new BlueBall(loc.x + faultNorm1.x, loc.y + faultNorm1.y, newRad * 2f);
        baby2 = new BlueBall(loc.x + faultNorm2.x, loc.y + faultNorm2.y, newRad * 2f);
      }
      else if (blueCollisions > redCollisions) {
        baby1 = new RedBall(loc.x + faultNorm1.x, loc.y + faultNorm1.y, newRad * 2f);
        baby2 = new RedBall(loc.x + faultNorm2.x, loc.y + faultNorm2.y, newRad * 2f);
      }
      // if there is a tie between red and blue collisions, make one of each.
      else {
        baby1 = new BlueBall(loc.x + faultNorm1.x, loc.y + faultNorm1.y, newRad * 2f);
        baby2 = new RedBall(loc.x + faultNorm2.x, loc.y + faultNorm2.y, newRad * 2f);
      }
      // now add the speed from the other ball to the babies
      baby1.vec.add(fromOther);
      baby2.vec.add(fromOther);
      // and add the babies to our list
      addUs.add(baby1);
      addUs.add(baby2);
    }
  }
 
  public void damp() {
    // a damping function to slow things down when they are going fast.
    if (vec.mag() > 20.0) {
      vec.mult(0.9999f);
    }
    // slow things down a little less if they are going slightly less fast.
    else if (vec.mag() > 10.0) {
      vec.mult(0.999f);
    }
  }
  public void updateHeading(ArrayList<Ball> others) {
    // no effect for green balls. red and blue balls will override this.
  }
}
 
// ------------------------------------------------------ Blue Ball class
class BlueBall extends Ball {
 
  public BlueBall(float x, float y, float d) {
    super(x, y, d);
  }
 
  int getColor() {
    // blue balls are orange when angry, blue otherwise.
    if (angry()) {
      return color(255, 165, 0);
    }
    else {
      return color(0, 0, 255);
    }
  }
 
  public void resolveCollision(Ball other, ArrayList<Ball> addUs, ArrayList<Ball> removeUs) {
    // the default behavior is just to bounce off
    PVector faultLine = bounce(other);
    if (random(1.0f) < 0.5f) {
      hp--;
    }
    // blue balls can absorb other blue balls.
    if (other instanceof BlueBall) {
      absorb(other, removeUs);
    }
    else if (other instanceof RedBall && d < other.d) {
      // blue balls can angrily collide with red balls as long as we are smaller than they are.
      collideInAnger(other, addUs, removeUs);
    }
    // last, we might have to split in two if we have taken damage.
    if (hp < 0) {
      split(addUs, other, faultLine, (d > initialBallRadius));
      removeUs.add(this);
    }
  }
 
  int getArmorColor() {
    return 128; // always grey.
  }
 
  public void updateHeading(ArrayList<Ball> others) {
    // blue balls seek out the nearest red ball and run away from it
    float bestDist = MAX_FLOAT;
    Ball bestBall = null;
    for (Ball b : others) {
      if (b != this && b instanceof RedBall) {
        // find the next red ball and measure its distance from us.
        PVector toOther = new PVector(b.loc.x - loc.x, b.loc.y - loc.y);
        float toOtherDist = toOther.mag();
        if (toOtherDist < bestDist) {
          bestDist = toOtherDist;
          bestBall = b;
        }
      }
    }
    // if there is a red ball that is within some distance of us, run away.
    if (bestBall != null && bestDist < (initialBallRadius * 3)) {
      PVector toOther = new PVector(bestBall.loc.x - loc.x, bestBall.loc.y - loc.y);
      // blue balls avoid
      PVector avoid = new PVector(-toOther.x, -toOther.y);
      avoid.normalize();
      avoid.mult(0.3f);
      float speed = vec.mag();
      vec.add(avoid);
      vec.normalize();
      vec.mult(speed);
    }
  }
}
 
// ------------------------------------------------------ Red Ball class
//
// see the notes for Blue ball for inspiration. The only difference is that
// red balls seek out nearby blue balls and chase them.
class RedBall extends Ball {
 
  public RedBall(float x, float y, float d) {
    super(x, y, d);
  }
 
  int getColor() {
    if (angry()) {
      return color(255, 165, 0);
    }
    else {
      return color(255, 0, 0);
    }
  }
 
  public void resolveCollision(Ball other, ArrayList<Ball> addUs, ArrayList<Ball> removeUs) {
    PVector faultLine = bounce(other);
    if (random(1.0f) < 0.5f) {
      hp--;
    }
    if (other instanceof RedBall) {
      absorb(other, removeUs);
    }
    else if (other instanceof RedBall && d < other.d) {
      collideInAnger(other, addUs, removeUs);
    }
    if (hp < 0) {
      split(addUs, other, faultLine, (d > initialBallRadius));
      removeUs.add(this);
    }
  }
 
  public void updateHeading(ArrayList<Ball> others) {
    float bestDist = MAX_FLOAT;
    Ball bestBall = null;
    for (Ball b : others) {
      if (b != this && b instanceof BlueBall) {
        PVector toOther = new PVector(b.loc.x - loc.x, b.loc.y - loc.y);
        float toOtherDist = toOther.mag();
        if (toOtherDist < bestDist) {
          bestDist = toOtherDist;
          bestBall = b;
        }
      }
    }
    if (bestBall != null && bestDist < (initialBallRadius * 3)) {
      PVector toOther = new PVector(bestBall.loc.x - loc.x, bestBall.loc.y - loc.y);
      // red balls hunt
      toOther.normalize();
      toOther.mult(0.1f);
      float speed = vec.mag();
      vec.add(toOther);
      vec.normalize();
      vec.mult(speed);
    }
  }
}



