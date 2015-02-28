
void setup() {
  size(420, 500);
  background(255);
  smooth();
}
// fields:

final float x1 = 10; // x cordinate of starting point
final float y1 = 420; // y cordinate of starting point


float hypo; // hypothenuse of triangle
float initVel; // initial velocity, determined by the distance from starting point to mouseX
float oppDis; // distance from mouseY to y- value of starting point
float angle;
float time;

float topx;
float topy;
float rangex;
float rangey;

float ballx = 10;

float upintercept;
float upslope;
float downintercept;
float downslope;
int why;
boolean allowPress = true;

float stayx = 600; 
float stayy = 600;

float t1 = 0;
float t2 = 0;
float r1 = 0;
float r2 = 0;

void draw() { // called forever until stopped

  stroke(255, 204, 153);
  strokeWeight(5);
  background(255);
  line(x1, y1, 490, 420); // ground line
  stroke(255, 100, 0);
  strokeWeight(3);
  point(x1, y1); //cannon
  line(10, 420, 10, 390);
  line(30, 420, 30, 390);
  line(10, 420, 30, 420);
  stroke(0);
  line(30, 400, 37, 390);
  line(10, 400, 3, 390);
  fill(255);
  ellipse(20, 375, 40, 27);
  fill(0);
  stroke(0);
  point(15, 370);
  point(25, 370);
  line(17, 380, 24, 380);
  //point(mouseX, mouseY);
  // Catcher:
  stroke(100, 80, 155);
  line(375, 420, 375, 390);
  line(395, 420, 395, 390);
  line(375, 420, 395, 420);
  stroke(0);
  line(395, 400, 402, 390);
  line(375, 400, 368, 390);
  fill(255);
  ellipse(385, 375, 40, 27);
  fill(0);
  stroke(0);
  point(380, 370);
  point(390, 370);
  line(392, 380, 380, 380); // mouth



  hypo = whatThedistance(x1, y1, mouseX, mouseY)/5 ;
  initVel = hypo;
  oppDis = whatThedistance(mouseX, y1, mouseX, mouseY) /5;
  angle = determineAngle();

  textSize(15);
  text("To start simulation, please select ", 20, 40);
  text(" angle & velocity by moving mouse, click when ready. ", 20, 60);
  textSize(10);
  fill(0);
  text("ANGLE : " + (int)(angle) + " degrees", 20, 150);
  text("INITIAL VELOCITY : " +(int) (hypo/2 ) + " meters/sec ", 20, 170);
  text("ACCELERATION : 9.8 meters/sec^2 ", 20, 190);
  text("***For best result, throw ball with 33m/s at 33 degrees***", 20, 490);
  time = initVel * (sin(radians(angle))) / 10; // only half
  rangex = initVel * cos(radians(angle)) * time * 2  ;
  rangey = y1;
  topx = rangex / 2;
  topy = initVel * sin(radians(angle)) + (5 * pow(time, 2)) ;



  //  strokeWeight(1);

  //  point(t1,t2);
  //  point(r1, r2); // what is this for? i forgot

  //  line(x1,y1,t1 + x1 , y1 - t2 );

  // line(t1 + x1 ,y1 - t2 , r1 + x1 ,r2);
  //fill(255);
  // arc(t1,t2, whatThedistance(t1,t2,t1,420), whatThedistance(10,420, r1, 420), -PI, 0);
  //line(0,465, 800, 465);
  //ellipse(30, 450, 50, 15);
  stroke(34, 139, 34);
  strokeWeight(3);

  textSize(10);

  text("Catcher (Very far away)", 300, 435);
  text("Thrower", 10, 435);
  text("ground line, height = 0 meters", 100, 455);

  /*
 
   text (" t1 : " + t1, 150, 150);
   text (" t2 : "  + t2, 150, 160);
   text (" topx : " + topx, 150, 170);
   text (" topy : " + topy, 150, 180);
   text (" ballx : " + ballx, 150, 190);
   text (" bally : " + bally, 150, 200);
   */
  //ball(chang e x , chane y)
  fill(220, 20, 60);
  if (ballx == 10 && why == 0) {
    stroke(255);
    fill(255);
  }

  if ( ballx < t1) {
    upslope = getSlope(t1, t2, x1, y1);
    upintercept = getIntercept(upslope, x1, y1);

    ballx = ballx + 4;
    ellipse(ballx, getY(upslope, upintercept, ballx), 15, 15);
  }
  /*text(" slope : " + upslope, 150, 210);
   text( "intercept" + upintercept, 150, 220);
   
   text(" downslope : " + downslope, 150, 230);
   
   text ( "intercept " + downintercept, 150, 240);
   */

  if (ballx >= t1 && ballx < r1) {
    ballx = ballx + 4;
    downslope = getSlope(t1, t2, r1, r2);
    downintercept = getIntercept(downslope, r1, r2);
    why = (int) (getY(downslope, downintercept, ballx));
    ellipse(ballx, why, 15, 15);
  }
  if (r1 - ballx < 5 ) {
    ellipse(ballx, why, 15, 15);
  }


  if (ballx < 401 && ballx > 360 && why < 400 && why >360) {
    stayx = ballx; 
    stayy = why;
    fill(255);
    stroke(255);
    ballx = 600;
    why = 600;
    fill(0);
  }
  ellipse(stayx, stayy, 15, 15);
}


void keyPressed() {

  if (key == 'r' || key == 'R') {
    ballx = 10;
    why = 420;
    t1 = 0;
    t2 = 0;
    r1 = 0;
    r2 = 0;

    allowPress = true;
  }
}

void mousePressed() {
  if (allowPress == true) {
    t1 = topx;//200;//topx;
    t2 = topy ; //150;//topy;
    r1 = rangex ;//675;// rangex;
    r2 = rangey;
    allowPress = false;
  }
}

float whatThedistance(float x1, float y1, float x2, float y2) {
  return sqrt(pow(x1-x2, 2) + pow(y1-y2, 2));
}

float determineAngle() {
  return degrees(asin(oppDis/hypo)) ;
}

float getIntercept(float slope, float xvalue, float yvalue) {
  return yvalue - slope * xvalue;
}

float getY( float slope, float intercept, float xvalue) {
  return slope * xvalue + intercept;
}

float getSlope(float x1, float y1, float x2, float y2) {
  return (x1-x2) / (y1 - y2) ;
}
