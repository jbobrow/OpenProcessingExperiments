
// All Examples Written by Caseyz Reas and Ben Fry
// unless otherwise stated.
Orb orb;
Vect2D velocity;
float gravity = .06, damping = 0.9;
int segments = 30;
Ground[] ground = new Ground[segments];
float[] peakHeights = new float[segments+1];

void setup(){
  size(400,300);
  frameRate(30);
  //smooth();
  orb = new Orb(10, 50, 10);
  velocity = new Vect2D(1, 0);

  // calculate ground peak heights 
  for (int i=0; i<peakHeights.length; i++){
    peakHeights[i] = random(height-40, height-30)-random(0,1)*40;
  }

  /* float value required for segment width (segs)
   calculations so the ground spans the entire 
   display window, regardless of segment number. */
  float segs = segments;
  for (int i=0; i<segments; i++){
    ground[i]  = new Ground(width/segs*i, peakHeights[i],
    width/segs*(i+1), peakHeights[i+1]);
  }
}


void draw(){
  // background
  noStroke();
  fill(0, 15);
  rect(0, 0, width, height);

  // move orb
  orb.x += velocity.vx;
  velocity.vy += gravity;
  orb.y += velocity.vy;

  // draw ground
  fill(127);
  beginShape();
  for (int i=0; i<segments; i++){
    vertex(ground[i].x1, ground[i].y1);
    vertex(ground[i].x2, ground[i].y2);
  }
  vertex(ground[segments-1].x2, height);
  vertex(ground[0].x1, height);
  endShape(CLOSE);

  // draw orb
  noStroke();
  fill(150);
  ellipse(orb.x, orb.y, orb.r*2, orb.r*2);

  // collision detection
  checkWallCollision();
  //velocity.x=5;
  for (int i=0; i<segments; i++){
    checkGroundCollision(ground[i]);
  }

}


void checkWallCollision(){
  if (orb.x > width-orb.r){
    orb.x = width-orb.r;
    velocity.vx *= -1;
    velocity.vx *= damping;
  } 
  else if (orb.x < orb.r){
    orb.x = orb.r;
    velocity.vx *= -1;
    velocity.vx *= damping;
  }
}


void checkGroundCollision(Ground groundSegment) {

  // get difference between orb and ground
  float deltaX = orb.x - groundSegment.x;
  float deltaY = orb.y - groundSegment.y;

  // precalculate trig values
  float cosine = cos(groundSegment.rot);
  float sine = sin(groundSegment.rot);
   float l = groundSegment.len;
   float l2 = groundSegment.x2-groundSegment.x1;
  /* rotate ground and velocity to allow 
   orthogonal collision calculations */
  float groundXTemp = cosine * deltaX + sine * deltaY;
  float groundYTemp = cosine * deltaY - sine * deltaX;
  float velocityXTemp = cosine * velocity.vx + sine * velocity.vy;
  float velocityYTemp = cosine * velocity.vy - sine * velocity.vx;

  /* ground collision - check for surface 
   collision and also that orb is within 
   left/rights bounds of ground segment */
  if (groundYTemp > -orb.r && groundYTemp < orb.r &&
    groundXTemp>-l/2 &&
    groundXTemp<l/2 ){
    // keep orb from going into ground
    groundYTemp = -orb.r;
    // bounce and slow down orb
    velocityYTemp *= -1.0;
    velocityYTemp *= damping;
     //groundSegment.y += 1.0;
     //groundSegment.y1 += 1.0;
     //groundSegment.y2 += 1.0;
      noStroke();
      fill(255);
      ellipse(groundSegment.x+groundXTemp*l2/l, groundSegment.y+groundSegment.rot*groundXTemp, orb.r, orb.r);
  }

  // reset ground, velocity and orb
  deltaX = cosine * groundXTemp - sine * groundYTemp;
  deltaY = cosine * groundYTemp + sine * groundXTemp;
  velocity.vx = cosine * velocityXTemp - sine * velocityYTemp;
  velocity.vy = cosine * velocityYTemp + sine * velocityXTemp;
  orb.x = groundSegment.x + deltaX;
  orb.y = groundSegment.y + deltaY;
}


class Ground {
  float x1, y1, x2, y2;  
  float x, y, len, rot;

  // default constructor
  Ground(){
  }

  // constructor
  Ground(float x1, float y1, float x2, float y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    x = (x1+x2)/2;
    y = (y1+y2)/2;
    len = dist(x1, y1, x2, y2);
    rot = atan2((y2-y1), (x2-x1));
  }
}


class Orb{
  float x, y, r;

  // default constructor
  Orb() {
  }

  Orb(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }
}

class Vect2D{
  float vx, vy;

  // default constructor
  Vect2D() {
  }

  Vect2D(float vx, float vy) {
    this.vx = vx;
    this.vy = vy;
  }
}


                
                
