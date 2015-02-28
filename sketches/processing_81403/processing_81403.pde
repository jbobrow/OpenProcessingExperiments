
//http://www.openprocessing.org/sketch/66571//

Spinner sp1, sp2, sp3, sp4, sp5, sp6;
PImage img0; 

void setup() {
  img0 = loadImage ("stove.jpg");
  size(700,465);
  smooth();
  float[][] centres = {{300,310},{100,60},{400,200},{600,500},{800,600},{500,70}};
  //               centreIn, segmentsIn, minRadiusIn, maxRadiusIn, dotSizeIn, FadeRateIn, processionIn
  sp1 = new Spinner(centres[0], 60, 20, 130, 10, 40, 3);
  sp2 = new Spinner(centres[0], 60, 20, 120, 6, 40, 3.1);
  sp3 = new Spinner(centres[0], 60, 20, 120, 4, 40, 3.2);
  sp4 = new Spinner(centres[0], 60, 20, 120, 8, 40, 3.3);
  sp5 = new Spinner(centres[0], 60, 20, 120, 11, 40, 3.4);
  //sp6 = new Spinner(centres[0], 60, 20, 120, 6, 40, 3.5);
  frameRate(30);
   
  //noLoop();
  //println("x-coord = " + dotCentre[0] + ", y-coord = " + dotCentre[1]);
}
 
void draw() {
  image (img0,0, 0);
   
   
  sp1.update();
  sp2.update();
  sp3.update();
  sp4.update();
  //sp5.update();
  //sp6.update();
   
}
 
class Spinner {
  float[] centre = {0,0}; // centre of circle
  float[] dotCentre = {1,4};
  int segments, minRadius, maxRadius, dotSize;
  float d = 0; // initial addition to offset
  //
  //
  float angleOffset = 0;
  float runningGapAngle = angleOffset;
  //
  float AlphaValue = 255; // initial transparency
  float FadeRate; // the decay rate for the brightness
  float procession; // how much the offset marches after each loop
  float radiusScale;
  float bigRadius;
  float gapAngle;
  Spinner(float[] centreIn, int segmentsIn, int minRadiusIn, int maxRadiusIn, int dotSizeIn, float FadeRateIn, float processionIn) {
    centre = centreIn;
    //centre[1] = centrey;
    segments = segmentsIn;
    minRadius = minRadiusIn;
    maxRadius = maxRadiusIn;
    dotSize = dotSizeIn;
    FadeRate = FadeRateIn;
    procession = processionIn;
    bigRadius = maxRadius; // radius of main circle
    gapAngle = TWO_PI / segments;
    dotCentre[0] = centre[0] + bigRadius;
    dotCentre[1] = centre[1];
  }
 
  void update() {
    //println("cx " + centre[0] + " cy " + centre[1] + " seg " + segments + " prc " + procession + " ga " + gapAngle);
    runningGapAngle = radians(d);//angleOffset;
    //FillValue = 0;
   
    for (int i = 0; i<segments; i++) {
     
      dotCentre[0] = centre[0] + bigRadius * cos(runningGapAngle);
      dotCentre[1] = centre[1] + bigRadius * sin(runningGapAngle);
      AlphaValue = 255f * exp(-i / FadeRate);
      //if (FillValue >= 40) {
        //println("x-coord = " + dotCentre[0] + ", y-coord = " + dotCentre[1] + ", angle = " + degrees(runningGapAngle) + ", FillValue = " + FillValue + ", i = " + i);
        fill(200,200,255,255-AlphaValue);
        stroke(300,35,280,510-AlphaValue);
        ellipse(dotCentre[0], dotCentre[1], dotSize, dotSize);
       
      //}
      //println("x-coord = " + dotCentre[0] + ", y-coord = " + dotCentre[1] + ", angle = " + degrees(runningGapAngle) + ", FillValue = " + FillValue + ", i = " + i);
      runningGapAngle += gapAngle;
    
    }
   
    d += procession;
   
    radiusScale = cos(radians(d));
   
    bigRadius = (maxRadius - minRadius) * ((radiusScale + 1) / 2) + minRadius;
  }
}


