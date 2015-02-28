
// Car turning and driving according to tires angle
// http://engineeringdotnet.blogspot.com/2010/04/simple-2d-car-physics-in-games.html helped alot but I had to modify it
// Try to look latest revision of this animation, maybe I added something new 
// TODO: compute turning point and turning radius of vehicle

// Controls:
// arrows to steer and change speed
// + and - to change size (lenghth of wheelbase = lengeth between front and back wheels)
// space to reset
// A to lock steering angle (won't turn back)

PVector carLocation;
float carHeading;
float carSpeed, maxSpeed;
float steerAngle;
float maxSteerAngle = PI/4;
float wheelBase, minWB, maxWB; // the distance between the two axles

boolean plus, minus, up, down, left, right, steerLock;

PVector frontWheel;
PVector backWheel;


void setup()
{
  size(600, 600);
  smooth();

  up = down = left = right = steerLock = false;

  carLocation = new PVector(width/2, height/2);
  carHeading = PI;
  carSpeed = 0;
  maxSpeed = 10;
  steerAngle = 0;
  wheelBase = 50;
  minWB = 30;
  maxWB = 150;
}


void draw()
{
  background(#89FF81);

  frontWheel =  new PVector(carLocation.x+(wheelBase/2)*sin(carHeading), carLocation.y+(wheelBase/2)*cos(carHeading));
  backWheel =  new PVector(carLocation.x-(wheelBase/2)*sin(carHeading), carLocation.y-(wheelBase/2)*cos(carHeading));

  pushMatrix();
   rectMode(CENTER);
    fill(255);
  rect(300, 300, wheelBase/3, wheelBase+wheelBase/2 + 30, 300, 300, 300, 300);
  popMatrix();

  // body of vehicle
  pushMatrix();

  translate(carLocation.x, carLocation.y);
  rotate(-carHeading);

  rectMode(CENTER);
  fill(255);
  rect(0, 0, wheelBase/3, wheelBase+wheelBase/2 + 30, 3, 3, wheelBase/(wheelBase/20), wheelBase/(wheelBase/20));
  fill(200);
  rect(0, 0, wheelBase/5, wheelBase/1.9, 3, 3, wheelBase/(wheelBase/15), wheelBase/(wheelBase/15));

  popMatrix();

  // end: body of vehicle

  // front axle
  pushMatrix();
  translate(frontWheel.x, frontWheel.y);
  rotate(-carHeading);
  strokeWeight(2);
  line (-wheelBase/7, 0, wheelBase/7, 0);
  strokeWeight(1);
  popMatrix();
  // end: front axle


  // front left wheel
  pushMatrix();
  translate(frontWheel.x+sin(carHeading+PI/2)*wheelBase/7, frontWheel.y+cos(carHeading+PI/2)*wheelBase/7);
  // sin(carHeading+PI/2) and cos(carHeading+PI/2) helps to place wheel to correct position shifted to side by (wheelBase/7)
  // otherwise it would circle adound front regarding to a heading
  // I don't know to work well with these Processing matrix translate/rotate things

  rotate(-steerAngle-carHeading);
  rectMode(CENTER);
  fill(150);
  rect(0, 0, wheelBase/7, wheelBase/3, wheelBase/(wheelBase/10));
  popMatrix();
  // end: front left wheel


  // front right wheel
  pushMatrix();
  translate(frontWheel.x-sin(carHeading+PI/2)*wheelBase/7, frontWheel.y-cos(carHeading+PI/2)*wheelBase/7);
  rotate(-steerAngle-carHeading);
  rectMode(CENTER);
  fill(150);
  rect(0, 0, wheelBase/7, wheelBase/3, wheelBase/(wheelBase/10));
  popMatrix();
  // end: front right wheel


  // back wheels
  pushMatrix();

  translate(backWheel.x, backWheel.y);
  rotate(-carHeading);

  rectMode(CENTER);
  fill(150);

  strokeWeight(2);
  line(-wheelBase/7, 0, wheelBase/7, 0);
  strokeWeight(1);


  rect(-wheelBase/7, 0, wheelBase/7, wheelBase/3, wheelBase/(wheelBase/10));
  rect(wheelBase/7, 0, wheelBase/7, wheelBase/3, wheelBase/(wheelBase/10));

  popMatrix();

  // end: back wheels


  frontWheel.add(carSpeed*sin(carHeading+steerAngle), carSpeed*cos(carHeading+steerAngle), 0);
  backWheel.add(carSpeed*sin(carHeading), carSpeed*cos(carHeading), 0);

  carLocation.set(frontWheel.x+backWheel.x, frontWheel.y+backWheel.y, 0) ;
  carLocation.div(2);

  if (carLocation.x<0) carLocation.x=width;  
  if (carLocation.x>width) carLocation.x=0;  
  if (carLocation.y<0) carLocation.y=height;  
  if (carLocation.y>height) carLocation.y=0;  


  carHeading = atan2( frontWheel.x - backWheel.x, frontWheel.y - backWheel.y );

  fill(0);
  if (carSpeed<0) text("Â®", 5, height-40);
  text("Speed:         "+carSpeed, 20, height-40);
  text("Heading:      ("+round(degrees(carHeading))+"Âº)   "+carHeading, 20, height-30);
  text("Steer angle:  ("+round(degrees(steerAngle))+"Âº)   "+steerAngle, 20, height-20);
  text("Wheel base:    "+wheelBase, 20, height-10);

  // prcessing.js messes text so I separated it 
  text("Instructions:", 2, 10);
  text("â��", 2, 25); 
  text("accelerate", 32, 25);
  text("â��", 2, 35); 
  text("steer left", 32, 35);
  text("â��", 2, 45); 
  text("steer right", 32, 45);
  text("â��", 2, 55); 
  text("deccelerate", 32, 55);
  text("+", 2, 65); 
  text("lengthen wheelbase", 32, 65);
  text("-", 2, 75); 
  text("shorten wheelbase", 32, 75);
  text("A", 2, 85); 
  text("lock steering", 32, 85);
  text("spacebar  RESET", 2, 100);

  // â­�â­�â­�
  if (up) text("â��", 16, 25);
  if (left) text("â��", 16, 35);
  if (right) text("â��", 16, 45);
  if (down) text("â��", 16, 55);

  if (plus) text("â��", 16, 65);
  if (minus) text("â��", 16, 75);
  if (steerLock) text("â��", 16, 85);
  // â­�â­�â­�

  fill(255);

  // LEFT
  if (left) 
  {
    if (steerAngle < maxSteerAngle) steerAngle += 0.08;
    if (steerAngle>maxSteerAngle) steerAngle = maxSteerAngle;
  }
  else
  {
    if (!steerLock) if (steerAngle > 0) steerAngle -= 0.08;
  }


  // RIGHT
  if (right)
  {
    if (steerAngle >  -maxSteerAngle)  steerAngle -= 0.08;
    if (steerAngle<-maxSteerAngle) steerAngle = -maxSteerAngle;
  }
  else
  {
    if (!steerLock) if (steerAngle < 0) steerAngle += 0.08;
  }

  // UP
  if (up)
  { 
    if (carSpeed<maxSpeed) carSpeed += 0.05;
  }
  else
  {
  }  

  // DOWN
  if (down)
  {
    if (carSpeed>0) carSpeed -= 0.15; //brake
    else 
      if (abs(carSpeed)<maxSpeed) carSpeed -= 0.05; // reverse
  }
  else
  {
  }

  // PLUS
  if (plus)
  { 
    if (wheelBase<maxWB) wheelBase += 1;
  }
  else
  {
  }

  // MINUS
  if (minus)
  {
    if (wheelBase>minWB) wheelBase -= 1;
  }
  else
  {
  }

  if (abs(steerAngle)<0.08) steerAngle = 0;


  if (carSpeed>0) carSpeed -= 0.01; //friction for forward
  if (carSpeed<0) carSpeed += 0.01; //friction for backward

  if ((!up && !down) && (abs(carSpeed)<0.01))  carSpeed=0;
}





void keyPressed()
{

  if (keyCode==32) // spacebar
  {
    carLocation.set(width/2, height/2, 0);
    steerAngle = 0;
    carSpeed = 0;
    carHeading = PI;
    wheelBase = 50;
  }

  if (keyCode==65) // A
  {
    steerLock = !steerLock;
  }  

  if (keyCode==61)  // +
  {
    plus = true;
  }

  if (keyCode==173) // -
  {
    minus = true;
  }



  if (key == CODED) 
  {
    switch(keyCode) {
    case LEFT: 
      left=true;
      break;
    case RIGHT:
      right=true;
      break;
    case UP:
      up=true;
      break;
    case DOWN:
      down=true;
      break;
    }
  }
}


void keyReleased()
{



  if (keyCode==61)  // +
  {
    plus = false;
  }

  if (keyCode==173) // -
  {
    minus = false;
  }


  if (key == CODED) 
  {
    switch(keyCode) {
    case LEFT: 
      left=false;
      break;
    case RIGHT:
      right=false;
      break;
    case UP:
      up=false;
      break;
    case DOWN:
      down=false;
      break;
    }
  }
}

//???????????????????? THE END ????????????????????//
