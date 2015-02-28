
float toothHeight = 12.0; //height (in pixels) of each tooth
float bevel = 0.15; //constant for angle of teeth
float radPitch = 5.5; //constant for ratio between radius and # of teeth (small=more teeth, large=less teeth)
ArrayList gears;
//gear pickedGear;

//---------------------------------------------------------------------

void setup() {
  size(800,600);
  smooth();
  stroke(0);
  strokeWeight(.5);
  textSize(9);
  textAlign(CENTER, CENTER);
  
  gears = new ArrayList();
}

//---------------------------------------------------------------------

void draw() {
  background(32);
  fill(128);
  text("Left-click to add a gear.  Right-click to remove the selected gear.", 400, 550);
  text("Hold down shift while clicking to select a previous gear.", 400, 565);
  text("Move mouse up and down to adjust speed of first gear.", 400, 580);
  for (int i=0; i<gears.size(); i++) {
    gear g = (gear) gears.get(i);
    if (i == gears.size()-1) g.check(180); //last gear gets is shown brighter than rest
    else g.check(100); //normal
  }
}

//---------------------------------------------------------------------

void mousePressed() {
  if (mouseButton == LEFT)
    if (gears.size() > 0) { 
      if (keyPressed && key == CODED)
        if (keyCode == SHIFT) { //change order
          for (int i=gears.size()-1; i>=0; i--) {
            gear g = (gear) gears.get(i);
            if (sqrt(sq(mouseX-g.posX)+sq(mouseY-g.posY)) <= g.radius) {
              gears.remove(i);
              gears.add(g);
              break;
            }
          }
        }
      if (!keyPressed) { //add a gear
        gear last = (gear) gears.get(gears.size() - 1);
        if (sqrt(sq(mouseX - last.posX)+sq(mouseY - last.posY)) > last.radius + toothHeight*3)
          gears.add(new gear(mouseX, mouseY, last));
      }
    }
    if (gears.size() == 0) //add the first gear...      
      gears.add(new gear(mouseX, mouseY, random(70,100)));
  if (mouseButton == RIGHT && gears.size() > 0) //take away the last gear
    gears.remove(gears.size() - 1);
    
}

//---------------------------------------------------------------------

class gear {
  //each gear is composed of teeth and gaps both of which are the same size (it doesn't look like it because of the bevel)
  gear gearPrior; //quick reference to the prior gear
  float posX, posY; //the gear's axis position
  float radius; //the radius of the gear
  float thickness; //this is the size (in radians) of each tooth and each gap (which are the same size)
  float gearAngle = 0.0; //the current rotation angle (in radians) of the gear
  float posAngle = 0.0; //the angle (in radians) of the gear relative to the prior gear
  int cntTeeth; //the number of teeth on the gear (this is also the number of gaps, too)
  //int bright = 100; //for shading
  
  gear(float x, float y, float r) { 
    posX = x; 
    posY = y;
    radius = r;
    cntTeeth = int(radius/radPitch);
    thickness = PI/cntTeeth; //simplified from TWO_PI/cntTeeth/2
    //bright = 180;
  }
  
  gear(float x, float y, gear g) {
    posX = x; 
    posY = y;
    gearPrior = g;
    float distance = sqrt(sq(gearPrior.posX - x)+sq(gearPrior.posY - y));
    radius = distance - gearPrior.radius - toothHeight;
    cntTeeth = int(radius/radPitch);
    thickness = PI/cntTeeth; //simplified from TWO_PI/cntTeeth/2
    posAngle = getAngle(posX - gearPrior.posX, posY - gearPrior.posY);
  }
  
  void check(int bright) {
    fill(128);
    if (gearPrior == null) { //the master gear doesn't have a prior gear
      gearAngle = (gearAngle+PI/(mouseY+20)) % TWO_PI; //increase the angle depending on mouseY
    }
    else {
      gearAngle = (posAngle - gearPrior.gearAngle)/cntTeeth*gearPrior.cntTeeth + posAngle; //the angle of the gear is based on the prior gear and the positional angle
      if(cntTeeth%2 != 0) gearAngle -= thickness; //gears with an odd number of teeth need need a little bump to mesh nicely
    }
    fill(bright);
    pushMatrix();
      translate(posX, posY);
      pushMatrix();
        rotate(gearAngle);
        beginShape();
          for (int i=0; i<cntTeeth*2; i++) { 
            //we're going to draw each "segment" whether it's a tooth or a gap
            //that's two lines (three vertices)
            int l = (i==0 ? cntTeeth*2 - 1 : i - 1); //quick reference to the prior segment
            float inX = cos(i*thickness)*radius; //inner vertex
            float inY = sin(i*thickness)*radius;
            float lastInX = cos(l*thickness)*radius; //prior inner vertex
            float lastInY = sin(l*thickness)*radius;
            if (i%2==0) {
              //gap
              float outX = inX + cos(i*thickness + bevel)*toothHeight; //outer vertex (bevel is ADDED)
              float outY = inY + sin(i*thickness + bevel)*toothHeight; 
              vertex(lastInX, lastInY);
              vertex(inX, inY);
              vertex(outX, outY);
            }
            else {
              //tooth
              float outX = inX + cos(i*thickness - bevel)*toothHeight; //outer vertex (bevel is SUBTRACTED)
              float outY = inY + sin(i*thickness - bevel)*toothHeight;
              float lastOutX = lastInX + cos(l*thickness + bevel)*toothHeight; //prior outer vertex
              float lastOutY = lastInY + sin(l*thickness + bevel)*toothHeight;
              vertex(lastOutX, lastOutY);
              vertex(outX, outY);
              vertex(inX, inY);
            }
          }
        endShape(CLOSE);
        
        if(gearPrior == null) {
          //show arrows on driver gear
          arc(0, 0, radius*2-20, radius*2-20, -QUARTER_PI, 0);
          arc(0, 0, radius*2-20, radius*2-20, HALF_PI+QUARTER_PI, PI);
          line(radius-10, 0, radius-13, -10);
          line(radius-10, 0, radius-8, -10);
          line(-radius+10, 0, -radius+13, 10);
          line(-radius+10, 0, -radius+8, 10);
        }
      popMatrix();
      //fluff
      fill(bright - 20);
      ellipse(0,0, radius*2-40, radius*2 - 40);
      fill(0);
      ellipse(0, 0, 5, 5);
    popMatrix();
  }
}

//---------------------------------------------------------------------

float getAngle(float x, float y) {
  //getting the angle from x and y wasn't nearly as straight-forward as I would have thought.
  //this function returns the angle from 0 to TWO_PI
  float a = 0.0;
  if (x != 0) {
    a = atan(y/x);
    if (x < 0)
      if (y != 0) 
        a += PI * abs(y)/y;
      else 
        a += PI;
  }
  else 
    if (y != 0) 
      a = HALF_PI * abs(y)/y;
  if (y < 0) 
    a += TWO_PI;
  return a;
}

