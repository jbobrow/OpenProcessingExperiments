
Tbody body;
 
 
int numSegment = 4;
int numOfArms = 10;
float SegWeightPor = 1.9f;
float radius = 0.0f;
float easing = 0.05f;
float x, y;
float targetX, targetY;
float pi = 0;
float airX = 0.0;
float airY = 0.0;
 
float [] rotation = new float[numOfArms];
float [] angleRadius = new float[numOfArms];
float [] angleSegment= new float[numOfArms];
float [] angleSpeed = new float[numOfArms];
float [] angle = new float[numOfArms];
float [] WeightSegment = new float[numOfArms];
float [] segLength = new float[numOfArms];
float angleSpeedTouchDelay = 0.00;
float angleSpeedTouch = 0.00;
 
float angleRadiusTouchDelay = 0.00;
float angleRadiusTouch = 0.00;
 
float WeightSegmentTouchDelay = 0.00;
float WeightSegmentTouch = 0.00;
 
float segLengthTouchDelay = 0.00;
float segLengthTouch = 0.00;
 
void setup() {
  //size(screenWidth, screenHeight);
  size(1024, 1024);
  frameRate(30);
  //smooth();
  stroke(0, 100);
  
   
  for(int i=0; i<numOfArms; i++) {
    rotation[i] = random(0, 360);
    angleRadius[i] = random(0.4, 1.3);
    angleSpeed[i] = random(0.02, 0.14);
    angleSegment[i] = random(0.09, 1.6);
    WeightSegment[i] = random(1.4, 6.3);
    segLength[i] = random(30, 70);
  }
   
}
 
 
boolean touched = false;
 
void mouseReleased() {
  angleSpeedTouch =  random(-2.0, 2.0);
  angleRadiusTouch =  random(-3.0, 3.0);
  WeightSegmentTouch =  random(3.0, 8.0);
  segLengthTouch = random(-20, -50);
  touched = true;
}
 
void draw() {
  background(255);
  scale(3); 
 
  println("Delay:" + floor(WeightSegmentTouchDelay*1000));
  println("Value:" + floor(WeightSegmentTouch*1000));
   
  if (floor(WeightSegmentTouchDelay*10) == floor(WeightSegmentTouch*10)) {
    touched = false;   
  }
   
 
   
  if (touched == true) {
    angleSpeedTouchDelay = (angleSpeedTouchDelay) + (angleSpeedTouch - angleSpeedTouchDelay)/8;
    angleRadiusTouchDelay = (angleRadiusTouchDelay) + (angleRadiusTouch - angleRadiusTouchDelay)/6;
    WeightSegmentTouchDelay = WeightSegmentTouchDelay + (WeightSegmentTouch - WeightSegmentTouchDelay)/10;
    segLengthTouchDelay = segLengthTouchDelay + (segLengthTouch - segLengthTouchDelay)/8;
  } else {
    angleSpeedTouchDelay = angleSpeedTouchDelay - angleSpeedTouchDelay/10;
    angleRadiusTouchDelay = angleRadiusTouchDelay - angleRadiusTouchDelay/10;
    WeightSegmentTouchDelay = WeightSegmentTouchDelay - WeightSegmentTouchDelay/10;
    segLengthTouchDelay = segLengthTouchDelay - segLengthTouchDelay/10;
  }
   
   
   
  for(int i=0; i<numOfArms; i++) {
    angle[i] = angle[i] + angleSpeed[i];
  }
   
  targetX = mouseX;
  float dx = targetX - x;
  float nX = noise(pi/10)*cos(noise(pi/10)*((width/2 - noise(pi/50)*(width))/10));
  airX += easing;
  x += dx * easing + nX*10.2;
   
  targetY = mouseY;
  float dy = targetY - y;
  float nY = noise(pi/10)*sin(noise(pi/10)*((height/2 - noise(pi/50)*(height))/10));
  airY += easing; 
  y += dy * easing + nY*10.2;
   

  
  body = new Tbody(x, y, noise(pi/500)*((dx*dy*easing)/1000));
  //+ noise(pi/10)*2)
   
  pi++;
   
}
 
 
 
 
 
 
///////////////////////////////////////////////////////////
class Tbody {
  Arm arms; 
    
  Tbody(float x, float y, float rotator) {
 
     
    translate(x, y);
    rotate(rotator);
    scale(0.8);
    //
    for(int i=0; i<numOfArms; i++) {
      radius = angleRadius[i] * sin(angle[i]) + noise(angleRadiusTouchDelay);
      arms = new Arm(radius  ,   WeightSegment[i]+random(noise(WeightSegmentTouchDelay), (WeightSegmentTouchDelay))   ,   segLength[i]+random(floor(segLengthTouchDelay), ceil(segLengthTouchDelay)));
      rotate(rotation[i]);
       
      //rotate(PI/(numOfArms/2));
      //rotate(random(PI));
    }
     
  }
}
 
 
class Arm {
 
  Arm(float angleSeg, float WeightSeg, float LengthSeg) {  
      pushMatrix();
      for(int i=0; i<numSegment; i++) {
        if(i>0) {
          segment(LengthSeg, 0, angleSeg*angleSegment[i]+angleSpeedTouchDelay, ((numSegment+1)*WeightSeg)-i*WeightSeg, LengthSeg);
        } else {
          segment(0, 0, angleSeg, (numSegment+1)*WeightSeg, LengthSeg);
        }
      }
      popMatrix();
  }
   
  void segment(float x, float y, float a, float Weight, float LengthSeg) {
      translate(x, y);
      rotate(a);
      strokeWeight(Weight/SegWeightPor);
      fill(255,255);
      noStroke();
      ellipse(0,0,2,2);
      stroke(0, 80);
      line(0, 0, LengthSeg, 0);
  }
   
   
}
