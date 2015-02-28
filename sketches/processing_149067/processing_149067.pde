
void setup(){
  size(400,500);
  background(255);
  if (keyPressed == true) {
    if (key == 'r' || key == 'R') {
      background(255);
    }
  }
 
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


void draw(){ // called forever until stopped
 
  stroke(243,190,160);
  strokeWeight(5);
  background(255);
  line(x1,y1,490,420); // ground line
  stroke(255, 100, 0);
  strokeWeight(3);
  point(x1, y1); //cannon
  line(10, 420, 10, 390);
  line(30, 420, 30, 390);
  line(10,420, 30, 420);
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
  stroke(100,80,155);
  line(275, 420, 275, 390);
  line(295, 420, 295, 390);
  line(275,420, 295, 420);
  stroke(0);
  line(295, 400, 302, 390);
  line(275, 400, 268, 390);
  fill(255);
  ellipse(285, 375, 40, 27);
  fill(0);
  stroke(0);
  point(280, 370);
  point(290, 370);
  line(292, 380, 280, 380);
   
  hypo = whatThedistance(x1, y1, mouseX, mouseY)/5 ;
  initVel = hypo;
  oppDis = whatThedistance(mouseX, y1, mouseX, mouseY) /5;
  angle = determineAngle();
 
  textSize(10);
  fill(0);
  text("angle : " + (int)(angle) + " degrees", 50, 70);
  text("initial velocity : " +(int) (hypo ) + " meters/sec ", 50, 50);
 
  time = initVel * (sin(radians(angle))) / 10; // only half
  rangex = initVel * cos(radians(angle)) * time * 2  ;
  rangey = y1;
  topx = rangex / 2;
  topy = initVel * sin(radians(angle)) + (5 * pow(time,2)) ;

 
   
//  strokeWeight(1);
 
//  point(t1,t2);
//  point(r1, r2); // what is this for? i forgot
  
//  line(x1,y1,t1 + x1 , y1 - t2 );
 
 // line(t1 + x1 ,y1 - t2 , r1 + x1 ,r2);
  //fill(255);
 // arc(t1,t2, whatThedistance(t1,t2,t1,420), whatThedistance(10,420, r1, 420), -PI, 0);
//line(0,465, 800, 465);
//ellipse(30, 450, 50, 15);
  stroke(100,200,0);
  strokeWeight(5);
  
  
  
 
  textSize(10);
   
  text("Catcher", 275, 435);
  text("Thrower", 10,435);
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
  
  
  if( ballx < t1) {
    upslope = getSlope(t1,t2,x1,y1);
    upintercept = getIntercept(upslope, x1, y1);

    ballx = ballx + 4; 
    ellipse(ballx, getY(upslope, upintercept, ballx), 10, 10);  

  }
  /*text(" slope : " + upslope, 150, 210);
  text( "intercept" + upintercept, 150, 220);
  
  text(" downslope : " + downslope, 150, 230);
  
  text ( "intercept " + downintercept, 150, 240);
  */
  if (ballx >= t1 && ballx < r1) {
    ballx = ballx + 4; 
    downslope = getSlope(t1,t2, r1, r2);
    downintercept = getIntercept(downslope, r1, r2);
    why = getY(downslope, downintercept, ballx);
    ellipse(ballx, why, 10, 10);  

  }
  if (r1 - ballx < 5) {
    ellipse(ballx, why, 10, 10);
  }
 /* text(" downslope : " + downslope, 150, 230);
  
  text ( "intercept " + downintercept, 150, 240);
  
*/  
  
   
}
float upintercept; 
float upslope;
float downintercept;
float downslope;
float why;
 
float t1 = 0;
float t2 = 0;
float r1 = 0;
float r2 = 0;

void mousePressed() {
  t1 = topx;//200;//topx;
  t2 = topy ; //150;//topy;
  r1 = rangex ;//675;// rangex;
  r2 = rangey;
   
}
 
float whatThedistance(float x1,float y1,float x2,float y2) {
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
