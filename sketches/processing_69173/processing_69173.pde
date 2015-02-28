
// When sketch starts, main rotation takes one minute.
// User can change this speed.
// Pulsing always marks seconds, and background color always indicates hour of day.

float angle = 0; //original angle for primary orbit
int radius = 100; //size of the main orbit
int minuteIncrement = 3600; //main orbit initially takes one minute (divide by frameRate)
float numAngles; //controls speed of main orbit
float orbitX; //x-coordinate of offset from main orbit point
float orbitY; //y-coordinate of offset from main orbit point

// <------variables for little balls; includes pulsing every two seconds------>
int secondIncrement = 120; //two-second increments (divide by frameRate)
float secondPulse = TWO_PI/secondIncrement;
float secondCounter = 0;//will increment every frame
int numLittleBalls = 50;
float littleAngleIncrement = TWO_PI/numLittleBalls;
float littleAngle = 0;
float littleOrbitX; //x-coordinate of offset from little center
float littleOrbitY; //y-coordinate of offset from little center
float littleMinDistance = 10; //smallest point for pulsing radius (balls don't go all the way to center)
float littleDistanceBase = 20; //multiplier for little orbit; controls largest point
float littleDistance; //controls pulsing; radius changes each frame

// <------variables for size of heart------>
float maxHeart = 0.25; //multiplier for size of heart
float heartSize;

// <------variables for hourly background change------>
float hourColor;
float hourColorHue; //hue of background color
float hourColorBrit; //brightness of background color

void setup() {
  smooth();
  size(600, 350);
  colorMode(HSB, 360, 100, 100);
  frameRate(60);
}
void draw() {
  hourColor = map(hour(), 0, 23, 0, TWO_PI); //maps hour to a circle
  hourColorHue = map(cos(hourColor), 1, -1, 258, 191);
  hourColorBrit =  map(cos(hourColor), 1, -1, 15, 97);
  background(hourColorHue, 100, hourColorBrit);

  //use sin and cos to determine offset from center of orbit
  //main orbit created by adding offsets to center point (in this case,
  //center point is the center of the sketch)
  orbitX=cos(angle)*radius * 2; //multiplying x by two makes a horizontal oval
  orbitY=sin(angle)*radius;


  // <------orbit with little balls------>
  // ellipse commented out below marks the middle of the infinity sign
  //ellipse(orbitX + (width/2), orbitY+(height/2), 10, 10); //width/2 and height/2 are the center of this orbit

  // <------smaller circles------>
  //littleDistance is the distance of the little balls from their center point
  littleDistance = (((sin(secondPulse*secondCounter)+1)*littleDistanceBase)+littleMinDistance);
  noStroke();
  for (int i = 0; i<numLittleBalls; i++) {
    fill(360/numLittleBalls*i, 100, 100);
    littleOrbitX = cos((littleAngleIncrement * i)) * littleDistance * 2;
    littleOrbitY = sin((littleAngleIncrement * i*2)) * littleDistance; //<--cycles through y curve twice
    ellipse(littleOrbitX + orbitX + (width/2), littleOrbitY + orbitY + (height/2), 5, 5);
  }

  // <------orbit with heart------>
  heartSize = (((sin((secondPulse*secondCounter)+PI)+1) * maxHeart)); //adding PI makes it go exactly the opposite of the balls
  drawHeart(map(heartSize, 0*maxHeart, 2*maxHeart, 1*maxHeart, 2*maxHeart));
  //ellipse commented out below marks the center point of the heart
  //ellipse((orbitX*-1) + (width/2), (orbitY*-1)+(height/2), 10, 10); //multiply offsets by -1 for opposite sides

  // <------variables to be incremented------>
  numAngles = TWO_PI/minuteIncrement;
  angle += numAngles;
  secondCounter = (secondCounter+1)%secondIncrement; //resets to 0 every 120 frames
}

// <------heart function------>
void drawHeart(float j) {
  shapeMode(CENTER);
  pushMatrix();
  translate((orbitX*-1)+width/2, (orbitY*-1)+height/2);
  beginShape();
  //fill(map(heartSize, 0*maxHeart, 2*maxHeart, 60, 0), 100, 100); <-- cycled from red to yellow
  strokeWeight(3);
  stroke(348, 100, map(heartSize, 0*maxHeart, 2*maxHeart, 30, 83)); //<-- red to darker red
  fill(348, 100, map(heartSize, 0*maxHeart, 2*maxHeart, 30, 83)); //<-- red to darker red
  vertex(0, 100*j); //bottom point
  bezier(0, 100*j, 0, 100*j, 100*j, 0, 100*j, -50*j); //long right side
  bezier(100*j, -50*j, 100*j, -75*j, 100*j, -100*j, 50*j, -100*j); //outside top right curve
  bezier(50*j, -100*j, 10*j, -100*j, 0, -50*j, 0, -50*j); //inside right curve 
  bezier(0, -50*j, 0, -50*j, -10*j, -100*j, -50*j, -100*j); //inside left curve
  bezier(-50*j, -100*j, -100*j, -100*j, -100*j, -75*j, -100*j, -50*j); //outside top left curve
  bezier(-100*j, -50*j, -100*j, 0, 0, 100*j, 0, 100*j); //long left side
  vertex(0, 100*j); //bottom point
  endShape();
  //filling in the middle of the heart
  beginShape();
  vertex(0, -50*j);
  vertex(-50*j, -100*j);
  vertex(-100*j, -50*j);
  vertex(0, 100*j);
  vertex(100*j, -50*j);
  vertex(50*j, -100*j);
  vertex(0, -50*j);
  endShape();
  popMatrix();
  fill(255);
}

//<------user can control speed of main orbit------>
void keyPressed() {
  if (keyCode == UP && minuteIncrement > 200) {
    minuteIncrement -= 200;
  }
  if (keyCode == DOWN && minuteIncrement < 3600) {
    minuteIncrement += 200;
  }
}


