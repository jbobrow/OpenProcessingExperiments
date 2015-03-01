
//Calculate angle between clock hands
// Stops when they form a right angle.
// Click any mouse button to continue the clock

float hourAngle = 0.0;
float minuteAngle = 0.0;
float angleBetween = 0.0;
int hour = 0;
int minute = 0;
  
float PI_2 = PI/2.0;

float time = 0.0; // minutes since midnight (%720)
float speed = 1.0; //clock running speed 
boolean stopOnRightAngles = false; // set to 1 to halt clock movement when the hands make a right angle
int rightAngleCt = 0;
int crossoverCt = 0;

float rightAngleAngles[] = new float[22];
float crossoverAngles[] = new float[11];

int screenSize=500;
int screenSize_2 = screenSize/2;

float markerCircleRadius = screenSize/30.0;
float hourHandLength = 0.65*screenSize_2; // fraction of circle radius
float minuteHandLength = 0.85*screenSize_2; // fraction of circle radius

void setup()
{
  size(screenSize,screenSize);
  background(256,250,250);

  for (int i=0;i<22;i++)
    rightAngleAngles[i] = -1;
  for (int i=0;i<11;i++)
    crossoverAngles[i] = -1;
  
  frameRate(48);
}

void drawClockFace()
{
  // clear the background
  background(256,250,250);

  // Clock circle
  ellipse(screenSize_2, screenSize_2, screenSize*0.9,screenSize*0.9);
  
  float angle = 2*PI/12.0;
  float thisAngle = 0.0;
  float circleSize=5.0;
  
  // Draw Clock Face Ticks 
  for (int i = 0; i < 12; i++){
    thisAngle = angle*i;
    
    line(screenSize/2+sin(thisAngle)*0.8*screenSize_2,
          screenSize/2-cos(thisAngle)*0.8*screenSize_2,
          screenSize/2+sin(thisAngle)*0.9*screenSize_2,
          screenSize/2-cos(thisAngle)*0.9*screenSize_2);
  }

  // Draw rightAngle circle markers
  fill(255,0,0);
  for (int i=0;i<22;i++){
    if(rightAngleAngles[i] != -1)
      
      ellipse(screenSize/2+sin(rightAngleAngles[i])*screenSize_2*0.9,
              screenSize/2-cos(rightAngleAngles[i])*screenSize_2*0.9,
              markerCircleRadius,markerCircleRadius);
  }
  
  // Draw crossover circle markers
  fill(0,255,0);
  for (int i=0;i<11;i++){
    if(crossoverAngles[i] != -1)
      ellipse(screenSize/2+sin(crossoverAngles[i])*screenSize_2*0.9,
              screenSize/2-cos(crossoverAngles[i])*screenSize_2*0.9,
              markerCircleRadius,markerCircleRadius);
  }

  fill(255,255,255);
}
void draw()
{
  updateClock();
  updateClockHandsAngle();
  
  drawClockFace();
  
  // hour hand
  line(screenSize/2, 
        screenSize/2,
        screenSize/2+sin(hourAngle)*hourHandLength,
        screenSize/2-cos(hourAngle)*hourHandLength);
  
  // minute hand
  line(screenSize/2, 
        screenSize/2,
        screenSize/2+sin(minuteAngle)*minuteHandLength,
        screenSize/2-cos(minuteAngle)*minuteHandLength);
}


// Ensure that our right-angle checking will catch the angle exactly once.  We want this 
// fuzzy equality to catch the closer of the time tick before the exact angle or after the exact angle, but 
// -never- both.
//
// In one time tick, the minute hand will move 2*PI/60.0, and the hour hand will move 2*PI/720.0.
// And because we're checking both sides, we need to divide that value in half to create the epsilon.
float discreteMinuteEpsilon = speed * ((2*PI/60.0)-(2*PI/720.0)) / 2.0;
boolean floatEquality(float v1,float v2)
{
  float diff = v2-v1;
  //float discreteMinuteEpsilon = speed*PI/60.0;//120.0;//60.0; // EPSILON // check for angles that are close enough to Right
  return ((diff < discreteMinuteEpsilon)&&(-diff < discreteMinuteEpsilon));
}

void updateClock()
{
  time += speed;
  if (time >= 720)
    noLoop();

  time = time % 720;
  hour = floor(time / 60.0);
  minute = int(time % 60);
  // print("time: ",hour,":",minute,"\n");
}

void updateClockHandsAngle()
{
 
  hourAngle = time / 720.0 * (2 * PI);
  minuteAngle = (time % 60) / 60.0 * (2 * PI);
  
  angleBetween = abs(minuteAngle-hourAngle);
  if (angleBetween > PI){
    // Make sure to measure the smaller of the two possible anglesBetween
    angleBetween = 2*PI - angleBetween;
  }
  
  if(floatEquality(angleBetween,0.0)){
    crossoverCt++;
    print("\ntime: ",hour,":",minute,"\n");
    print("crossover #",crossoverCt," \n");
    crossoverAngles[hour] = hourAngle;
  }
    
  if (floatEquality(angleBetween, PI_2))
  {
    // reset the rightangleCt after 12 each cycle
    if(hourAngle < 2*PI/24.0)
      rightAngleCt = 0;

    //println("\ntime",time);
    //println("angleBetween", angleBetween, PI_2, (PI_2-angleBetween)/discreteMinuteEpsilon);
    rightAngleCt++;
    //print ("hourAngle", hourAngle, ":",2*PI/24.0,"\n");
    
    print("\ntime: ",hour,":",minute,"\n");

    //int index = hour*2+(minute>30?1:0);
    //print( "index",index, " ");
    rightAngleAngles[rightAngleCt-1] = hourAngle;
      
    print("right angle #",rightAngleCt," \n");
    if(stopOnRightAngles)
      noLoop();
    if(rightAngleCt > 22)
      noLoop();
  }
}

void mousePressed()
{
  setup();
  loop();
}
  

