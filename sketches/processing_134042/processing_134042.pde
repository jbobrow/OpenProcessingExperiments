
StrandGroup strandgroup;
StrandGroup strandgroup1;
StrandGroup strandgroup2;

void setup() {
  size(640, 360); 
  stroke(255);
  noFill();
  
  //StrandGroup( tipx, tipy, spacingx, spacingy, curve1x, curve1y, curve2x, curve2y);
  //tip: location of the tip of the first strand
  //spacing: how far apart the strands are spaced
  //curve1: first bezier curve ctrl point
  //curve2: 2nd ctrl point
  
  strandgroup =     new StrandGroup(40, 40, 40, 40, 40,40,400,height/2);
//    strandgroup1 =  new StrandGroup(40, 40, 40, 40,40,40,0,height*.75);
  strandgroup2 = new StrandGroup(480, 20, -10, 25,550,40,600,height*.75);
}

void draw() {
  background(0);
  strandgroup.display();
//  strandgroup1.display();
    strandgroup2.display();

}

class Strand {
  float tipX, //bezier tip x position
  tipY, //bezier tip y position
  swayTipX, //the swaying of tipx (adding sin wave to movement)
  swayTipY, //the swaying of tipy
  curve1X, //bezier first control point x
  curve1Y, //bezier first control point y
  swayCurve1X, //etc....
  swayCurve1Y, 
  curve2X, 
  curve2Y, 
  swayCurve2X, 
  swayCurve2Y, 
  a;            //alpha for pulsing tips

  float foldingTime=0;  //counter for when the strand is folding
  float sleepTime = 0;  //counter for sleeping
  boolean isFolding=false;
  boolean isUnfolding = false;
  boolean isSwaying=true;
  boolean isSleeping=false;

  Strand(float xPos, float yPos, float curve1XPos, float curve1YPos, float curve2XPos, float curve2YPos) {
    tipX = xPos;
    tipY = yPos;
    curve1X = curve1XPos;
    curve1Y = curve1YPos;
    curve2X = curve2XPos;
    curve2Y = curve2YPos;
  }

  boolean update() {

    //calculate folding
    swayTipX = map(sin(radians(foldingTime-90)), -1, 1, tipX, width/2);
    swayTipY = map(sin(radians(foldingTime-90)), -1, 1, tipY, width/2);
    swayCurve1X = map(sin(radians(foldingTime-90)), -1, 1, curve1X, width/2);
    swayCurve1Y = map(sin(radians(foldingTime-90)), -1, 1, curve1Y, width/2);

    //calculate sinusoidal sways
    swayCurve2X = map(sin(radians(frameCount)), -1, 1, curve2X-20, curve2X+20);
    swayCurve2Y = map(sin(radians(frameCount)), -1, 1, curve2Y-20, curve2Y+20);

    //default state: isSwaying
    if (isSwaying) {

      //calculate glowing blob alpha
      a = map(sin(radians(frameCount*.75)), -1, 1, 0, 22);

      //during isSwaying, if tip of strand is touched, state -> isFolding
      if (overCircle(tipX, tipY, 20)) {
        callFold();
      }
    }

    //state: isFolding. Do the fold().
    if (isFolding) {
      a=0;
      fold();
    }
    //state: sleeping. Do the sleep().
    if (isSleeping) {
      return true;
    }

    //state: isUnfolding. Do the unfold().
    if (isUnfolding) {
      unfold();
      return false;
    }
    return false;
  }

  void callFold() {
    isFolding=true;
    isSwaying=false;
  }
  void fold() {
    foldingTime++;
    if (foldingTime > 180) { //set max folding time here
      isFolding =false;
      isSleeping = true;
    }
    else {
      isFolding=true;
    }
  }

  void sleep() {
    sleepTime++;
    if (sleepTime>200) { //set max sleeping time here
       callUnfold();
      sleepTime=0;
    }
  }
  
  void callUnfold() {
    isUnfolding=true;
    isSleeping=false;
  }
  void unfold() {
    if (foldingTime > 0) { //rewind the folding
      foldingTime = foldingTime-1;
    }
    else {
      isUnfolding = false;
      isSwaying=true;
    }
  }

  void display() {

    //display pulsing tips
    fill(255, a);
    noStroke();
    ellipse(tipX, tipY, 20, 20);

    //display strand
    noFill();
    stroke(255);

    bezier(
    //tip coordinates
    swayTipX, 
    swayTipY, 
    //curve1 coordinates
    swayCurve1X, 
    swayCurve1Y, 
    //curve2 coordinates
    swayCurve2X, 
    swayCurve2Y, 
    //endpoint coordinates
    width/2, 
    360);
  }


  //rollover!
  boolean overCircle(float x, float y, float diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } 
    else {
      return false;
    }
  }
}//END CLASS

class StrandGroup {
  boolean sleep[] = new boolean[7];
  boolean wake = false;
  Strand strands[];

  StrandGroup(float xPos, float yPos, float xSpacing, float ySpacing, float curve1XPos, float curve1YPos, float curve2XPos, float curve2YPos ) {

    strands = new Strand[7]; //number of strands in strandgroup
    for (int i = 0; i<strands.length;i++) {
      strands[i] = new Strand(
      xPos+(i)*xSpacing, 
      yPos+(i)*ySpacing, 
      curve1XPos+(i)*xSpacing, 
      curve1YPos+(i)*ySpacing, 
      curve2XPos, 
      curve2YPos);
    }
  }

  void display() {
    for (int i = 0; i<strands.length;i++) {
      sleep[i] = strands[i].update();
      strands[i].update();
      strands[i].display();
    }
    for (int i = 0; i<strands.length;i++) {
      if (sleep[i]==false) {
        return;
      }
    }

    for (int j = 0; j<strands.length;j++) {
      strands[j].sleep();
    }
  }
}//END CLASS



