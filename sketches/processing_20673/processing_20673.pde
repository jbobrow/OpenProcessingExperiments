
// Define global variables: feather type, and feather position (x&y)
float featherType = 1; // 0-1. 0=flight feather. 1=down. Variable describes connection between this feather and the last
float[] featherPosition = {0,0}; // will be updated with each click to set the position(x) and height(y) of the new feather.
String instructions = "         ←← Vane                                                           ↕     Click above this line to make a feather, below it to clear    ↕                                                                               Down →→             ";
 
void setup() {
  size(900,700);
  background(0);
  stroke(255,80);
  smooth();
  
  // print instructions
  fill(200); text(instructions, 0, 650, 900, 20); fill(0);
}

void draw() {
}

void keyPressed() {
  if (key == 'a' ) {
    featherType = 0;
    drawFeather();
  }
  if (key == 's' ) {
    featherType = 0.2;
    drawFeather();
  }
  if (key == 'd' ) {
    featherType = 0.5;
    drawFeather();
  }
  if (key == 'f' ) {
    featherType = 1;
    drawFeather();
  }
}

// version 2.0 incorporates the mouse as the means of generating new feathers:
void mousePressed() {
  // the X position of the mouse click determines the feather type on the 0-1 scale. So we'll normalize the mouse position
  // in the frame, and then use that as the feather type definition.
  featherType = float(mouseX)/width;
  featherPosition[0] = float(mouseX);
  featherPosition[1] = float(mouseY);
  
  if (mouseY > 650) {background(0);}
  else {drawFeather();}
}

void drawFeather() {
  
  float startAngle = PI/8;
  float addAngle = 0;
  
  int totalBarbs = int((650-featherPosition[1])/2); // total number of barbs is in proportion to the feather height & type.
  if (featherPosition[0] > 400) {totalBarbs += random(1,3)*((featherPosition[0]-400)/50)*(650-featherPosition[1])/50; println(totalBarbs);}
  
  int maxRotatingBarbs = 100;
  float[] barbcurve = {3, 0, 25, -25, 75, 25, 100, 0};
  
  // Overall shape of feather:
  float r1 = 650-totalBarbs*2; // second control point Y value
  float r2 = featherPosition[0]+random(-50,50); // end point X value
  float[] rachiscurve = {featherPosition[0], 650, featherPosition[0], 650-(650-featherPosition[1])/3, featherPosition[0],  650-2*(650-featherPosition[1])/3, r2, featherPosition[1]};
  
  // Characteristics for barbs:
  float barbCurviness = 1; // 0-1. At 0, the barb should appear straight
  float barbLength = 1; // 0-1. At 1, the barb will have its full length
  float straightSection = 0; // 0-1. With 0 as the straight section, the feather will be short. with 1, we'll use the maximum straight (unrotated) section.
  
  noFill();
  float rotateBy = 0;
  float fixedRotation = 0;
  
  /// This loop will draw the top section, where the feather starts to bend back inwards
  for (int barbCount=0; barbCount<totalBarbs; barbCount+=1){
    
    // Prepare translations for this barb:
    resetMatrix(); // Start over with translations
    strokeWeight(1); // reset after downy feathers
    float t = float(barbCount) / totalBarbs;
    //float x = bezierPoint(450, 450, 450, r2, t);
    //float y = bezierPoint(650, 500, r1, 650-totalBarbs*2, t);
    float x = bezierPoint(featherPosition[0],  featherPosition[0], featherPosition[0], r2, t);
    float y = bezierPoint(650, 650-(650-featherPosition[1])/3, 650-2*(650-featherPosition[1])/3, featherPosition[1], t);    
    translate(x,y);
    // rotations occur differently for different feathers.
    
    if (featherType > 0.5) {addAngle = -PI/4*featherType*random(0.75);}
    else {addAngle = 0;}

    rotateBy = -((PI/2-startAngle)*(barbCount)/totalBarbs + startAngle + addAngle);
    rotate(rotateBy);
    
    
    // Prepare modifications to barb shape. Don't apply to array -- we don't want the effect to be saved for the next iteration
    if (featherType < 0.6) {barbCurviness = 1 - float(barbCount)/float(totalBarbs);} // barbs straighten towards the top
    barbLength = 4*float(barbCount)/float(totalBarbs)+random(1); // bottom barbs are randomly shorter, but get longer towards the vane
    if (barbLength > 1) {barbLength = 1;}
    
    // reset curve params based on prior iteration and feather type, which introduces randomness sequentially
    if (featherType < 0.25 && random(1) > (1-featherType/2)) // it's a flight feather. Move the last point ONLY, in proportion to feathertype value
    {
      barbcurve[7] = barbcurve[7] + random(-20,20)*barbCurviness;
    }
    else if (featherType > 0.25 && featherType < 0.6 && random(1) > (1-featherType/2)) // it's a flight feather. Move the last point ONLY, in proportion to feathertype value
    {
      barbcurve[5] = barbcurve[5] + random(-20,20);
      barbcurve[7] = random(-50,50)*barbCurviness;
    }
    else if (featherType > 0.6 ) 
    {
      barbCurviness = 1;
      barbLength = random(0.5,2);
      barbcurve[3] = barbcurve[3]/5 + random(-20,20)*featherType;
      //barbcurve[4] = barbcurve[4]*random(0.7,2);
      barbcurve[5] = random(-40,40)*barbCurviness*featherType;
      barbcurve[7] = random(-60,60)*barbCurviness*featherType;
    }

    // make the down finer
    if (featherType > 0.6) {scale(0.5,0.5);strokeWeight(2);}
    
    ///// Draw right side of feather
    bezier(barbcurve[0],barbcurve[1],barbcurve[2]*barbLength,barbcurve[3]*barbCurviness,
    barbcurve[4]*barbLength,barbcurve[5]*barbCurviness,barbcurve[6]*barbLength,barbcurve[7]*barbCurviness);
    
    rotate(-rotateBy); // Undo rotation before flipping
    scale(-1, 1);
    rotate(rotateBy); // redo rotation in opposite direction
    
    ////// Draw left side of feather
    bezier(barbcurve[0],barbcurve[1],barbcurve[2]*barbLength,barbcurve[3]*barbCurviness,
    barbcurve[4]*barbLength,barbcurve[5]*barbCurviness,barbcurve[6]*barbLength,barbcurve[7]*barbCurviness);
  }
  
}

