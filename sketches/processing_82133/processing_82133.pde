
// A simple pendulum-like simulation

// environment parameters
int SIZE = 600; //Size of Canvas
float ballr = 30.0;
float r = 200;
float halfarcextent = 0.25*PI;
boolean showtimer = true;

//saving data
PrintWriter output; 
PrintWriter output2; 
boolean savedata = false;
String filename = "test_angles_no_friction.txt";
String filename2 = "test_occlusion_no_friction.txt";
float d;


//system parameters
boolean hasOcclusion = false;
boolean hasFriction = true;
boolean hasLine=false;
boolean hasMultipleBalls = false;
int How_Many = 4; //how many OTHER balls to draw?
float fps = 50; //frames per second; used for setting framerate
float fpm = fps*60;  //frames per minute
float initialVelocity = 0.005; //originally set at 0.001

//game and occlusion controls
boolean gameStarted = false;
float startTime;
float gameStartTime;
float slowdownStartTime;
final float GLANCE_DURATION = 2000;
final float INIT_GLANCE= 5000;
boolean isoccluded = false;
boolean slowdown = false;
//initializing objects
Swing p_arc;
Ball p_ball;
Timer mytimer;

void setup() {

  frameRate(fps); //default is 60fps
  size(600, 600);
  smooth();

  PFont f = createFont("Arial", 16, true); // Arial, 16 point, anti-aliasing on
  textFont(f, 20);

  // Create a new file in the sketch directory
  if (savedata) { 
    output = createWriter(filename);
    output2 = createWriter(filename2);
  } 

  p_arc = new Swing(new PVector(width/2, width/2), r, initialVelocity); // new Swing object for arc
  p_ball = new Ball(new PVector(width/2, width/2), r, ballr); // new Ball object
  mytimer = new Timer();
}

void draw() {

  if (gameStarted == false) {    
    //start with blank background with a message
    background(175);
    fill(40, 40, 200); 
    text("Click here to get started", SIZE/4, SIZE/2);

    if (mousePressed) {
      gameStarted = true;
      gameStartTime=millis();  
      int gst=millis();
      mytimer.setStartTime(gst);
    }
  }
  else {    

    if (hasOcclusion){ //hasOcclusion is only for testing purposes
      if (millis()-gameStartTime < INIT_GLANCE) {
        isoccluded=false;
      }else if ((!isoccluded) && (millis()-startTime > GLANCE_DURATION)) {
        isoccluded = true;  
        if (savedata){ 
          if (startTime>0){
            output2.println(" " + frameCount + " " +millis() + " " + d);
          }
        }
      }
    }

    if (slowdown) {
      //println("slowdown");
      if (millis()-slowdownStartTime > 3000) {
        slowdown = false;
        //println("went false");
      }
    }    

    background(175);

    if (showtimer) { 
      float ss = mytimer.second();
      float mm = mytimer.minute();
    //  println(ss+":"+mm);
      text(mm+":"+ss, SIZE/4, SIZE/2);
    }

    p_arc.update();
    drawArc();
    drawBall();

    if (hasLine) {
      p_ball.drawline(halfarcextent);
    }

    if (hasMultipleBalls) {
      p_ball.drawMoreBalls(How_Many);
    }

    if (savedata) {
      float occluded = 0;
      if (!isoccluded) {        
        occluded = 1;
      }
      d = halfarcextent - abs(p_arc.angle-p_ball.angle);
      output.print(frameCount + " " + occluded +" " + p_arc.angle + " " + p_ball.angle + " ");  // Write the framecount and angle of arc to the file
      output.println(d);  // Write the angle of the ball to the file
    }

    if (isoccluded) {
      background(0, 0, 0);
    }
  }
}

void drawArc() {

  stroke(0);
  strokeWeight(2);
  noFill();
  arc(p_arc.origin.x, p_arc.origin.y, 2*r+ballr, 2*r+ballr, halfarcextent-p_arc.angle, PI-halfarcextent-p_arc.angle);
}


void drawBall() {

  if (hasFriction) { //draw ball with respect to the arc
    float pAcceleration = p_arc.aAcceleration;  
    float p_ball_angle = p_arc.angle;
    float pVelocity =p_arc.aVelocity;
    pVelocity += pAcceleration;    
    pVelocity *= 10; 
    //pVelocity = pVelocity * (frameCount)/fpm*10;       
    p_ball_angle += -pVelocity;
    p_ball.setAngle(p_ball_angle);

    p_ball.display();
    //ellipse(p_ball.location.x, p_ball.location.y, ballr, ballr);
  }
  else { //draw ball without friction
    p_ball.setAngle(0);
    p_ball.display();

    //    float ballx=p_ball.origin.x;
    //    float bally=p_ball.origin.y+r;
    //    ellipse(ballx,bally, ballr, ballr);
  }
}

void keyPressed() {

  if (keyCode==32) { //when space is pressed KeyEvent.VK_SPACE
    isoccluded = false;
    startTime = millis();
    if (savedata) { 
      //output2.print(millis() + " ");  
      output2.print(frameCount+ " " + millis() + " " + d );
    } // write FrameCount to occlusion.txt}
  } 
  else if (keyCode==16) { //when shift is pressed (KeyEvent.VK_SHIFT)
    //code for slowing down the arc goes in here
    slowdown = true;
    slowdownStartTime = millis();
  } 
  else {
    // hitting any other key closes the program
    if (savedata) {
      output.flush();  // Writes the remaining data to the file
      output.close();  // Finishes the file
      output2.flush();  // Writes the remaining data to the file
      output2.close();  // Finishes the file
    }
    exit();  // Stops the program
  }
}


// A Simple Ball class 

class Ball {

  PVector location;    // Location of ball as a pendulum (invisible arm)
  PVector origin;      // Location of arm origin
  float r;             // Length of arm
  float angle;         // Pendulum arm angle
  float ballr;         // Ball radius
  float bwAngle;   // For multiple balls, this is the angle between 2 balls
  
  Ball(PVector origin_, float r_, float ballr_) {
    // Fill all variables
    origin = origin_.get();
    location = new PVector();
    r = r_;
    ballr = ballr_;
    angle = 0;
    bwAngle = atan(ballr/r);

    //ballr = 30.0;      // Arbitrary ball radius
  }

  void setAngle(float angle_){
    angle = angle_;      
  }

  void display() {
    location.set(r*sin(angle), r*cos(angle), 0);       // Polar to cartesian conversion
    location.add(origin);                              // Make sure the location is relative to the pendulum's origin
    ellipse(location.x, location.y, ballr, ballr);
  }
  
  void drawMoreBalls(int how_many){
    float centre_angle=angle;
    if (how_many > 0){
      for (int i = 1; i <= How_Many; i = i+1){
        setAngle(angle+pow(-1,i-1)*i*bwAngle);
        display();
      }
    }
    setAngle(centre_angle); 
  }
  
  void drawline(float halfarcextent_){
    float big_angle = halfarcextent_;
    float small_angle = acos(cos(big_angle)+ballr/r);
    float x1 = origin.x + r*sin(angle+small_angle);
    float y1 = origin.y + ballr/2 + r*cos(angle+small_angle);
    float x2 = origin.x + r*sin(angle-small_angle);
    float y2 = origin.y + ballr/2 + r*cos(angle-small_angle);
    line(x1,y1,x2,y2);
    
  }
  
}

// A Simple Swing class based on Pendulum Class
// Given a pendulum with an angle theta (0 being the pendulum at rest) and a radius r
// we can use sine to calculate the angular component of the gravitational force.
// Angular Acceleration = -(g / r) * sine(theta)


class Swing {

  PVector location;    // Location of pendulum ball
  PVector origin;      // Location of arm origin
  float r;             // Length of arm
  float angle;         // Pendulum arm angle
  float aVelocity;     // Angle velocity
  float aAcceleration; // Angle acceleration
  float damping;       // Arbitary damping amount
  float a;
  float myframecount;
  
  //float fpm = 10*60;  //frames per minute
  
  boolean readytoswitch = false;
  
  // This constructor could be improved to allow a greater variety of pendulums
  Swing(PVector origin_, float r_, float initV) {
    // Fill all variables
    origin = origin_.get();
    r = r_;
    location = new PVector();
    myframecount = 0;

    angle = 0;
    aVelocity = initV;  //set at 0.001 originally

    
    
  }


  // Function to update location
  void update() {
    
    float currentFrame = frameCount;
    //if we want increasing acceleration up until 60 seconds, and there are 50 fps, then there will be a total of 3000 frames by then.
   
    //myframecount += 1; 
    //float currentFrame = myframecount;
        
    if (slowdown){

      a = a*(currentFrame-1)/currentFrame;
      aAcceleration = (-1 * a) * sin(angle);
      float oldV = aVelocity;
      aVelocity += aAcceleration;
      aVelocity = aVelocity - oldV*(frameCount-1)/fpm*0.005;
      
    }else{
      a =(currentFrame)/fpm*0.01;
      aAcceleration = (-1 * a) * sin(angle);
      aVelocity += aAcceleration;
      float damping = 1+currentFrame/fpm*0.005;
      aVelocity *= damping;
    }
      
    // Increment angle  
    angle += aVelocity;                         
  }
  
  void setAngle(float angle_){
    angle = angle_;      
  }
  
  void display() {
    location.set(r*sin(angle), r*cos(angle), 0);       // Polar to cartesian conversion
    location.add(origin);                              // Make sure the location is relative to the pendulum's origin
  }
  
}

class Timer {
  
  int startTime;

  
  void setStartTime(int startTime_) {
    startTime = startTime_;
  }
  
  int getElapsedTime() {
    int elapsed = millis() - startTime;
    return elapsed;
  }
  int second() {
    return round((getElapsedTime() / 1000) % 60);
  }
  int minute() {
    return round((getElapsedTime() / (1000*60)) % 60);
  }
  int hour() {
    return (getElapsedTime() / (1000*60*60)) % 24;
  }
}


