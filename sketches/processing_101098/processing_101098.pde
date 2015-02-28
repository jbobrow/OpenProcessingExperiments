
Letter   letterA, letterD, letterE, letterI, letterK, 
letterM, letterN, letterO, letterR, letterS, letterT, 
letterU, letterV, letterH, letterL,letterS4, letterT2,

letterA2, letterA3, letterA4, letterA5, letterD2, letterE2, 
letterE3, letterE4, letterE5, letterI2, letterL2, letterL3, 
letterM2, letterO2, letterO3, letterR2, letterS2, letterS3; 

import controlP5.*;

ControlP5 cp5;
 int speed = 4;
 int red = 99;
 int green = 44;
 int blue = 2;
 int fade = 50;



void setup() {
    stroke(10);
  cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  
      cp5.addSlider("fade")
     .setPosition(50,30)
     .setRange(0,100)
     
;
      
  cp5.addSlider("speed")
     .setPosition(50,50)
     .setRange(1.5,10)
     ;
     
  
  cp5.addSlider("red")
     .setPosition(50,80)
     .setRange(0,255)
     ;
  cp5.addSlider("green")
     .setPosition(50,100)
     .setRange(0,255)
     ;
  cp5.addSlider("blue")
     .setPosition(50,120)
     .setRange(0,255)
     ;

  size(1366, 738);
  background(255);
  // println(myArray.length);
  //  noLoop();
  frameRate(20);
  smooth();
  colorMode(RGB);

  letterA = new Letter( 235, 120);

  letterS = new Letter( 320, 120);
  letterM = new Letter( 405, 120);
  letterO = new Letter( 495, 120);
  letterO2 = new Letter( 585, 120);
  letterT = new Letter( 665, 120);
  letterH = new Letter (740, 120);

  letterS2 = new Letter( 825, 120);  
  letterE = new Letter( 910, 120);
  letterA2 = new Letter( 995, 120);

  letterN = new Letter( 235, 280);
  letterE2 = new Letter( 320, 280);
  letterV = new Letter( 405, 280);
  letterE3 = new Letter( 495, 280);
  letterR = new Letter( 585, 280);

  letterM2 = new Letter( 665, 280);
  letterA3 = new Letter (740, 280);
  letterD = new Letter( 825, 280);  
  letterE4 = new Letter( 910, 280);

  letterA4 = new Letter( 995, 280);

  letterS3 = new Letter( 140, 460);
  letterK = new Letter( 220, 460);
  letterI = new Letter( 300, 460);
  letterL = new Letter( 380, 460);
  letterL2 = new Letter( 460, 460);
  letterE5 = new Letter( 540, 460);
  letterD2 = new Letter (620, 460);

  letterS4 = new Letter( 700, 460);  
  letterA5 = new Letter( 780, 460);
  letterI2 = new Letter( 860, 460);  
  letterL3 = new Letter( 940, 460);
  letterO3 = new Letter( 1020, 460);  
  letterR2 = new Letter( 1100, 460);
}
void draw() {
  // println(numPointsToDraw);
  //background(255, 0, 0, 10);

  fill(255, 255, 255, fade);
  rect(0, 0, width, height);

  noFill();
  //noStroke();

  stroke(red, green, blue);
  letterA.draw();
  letterA.update();

  letterS.draw();
  letterS.update();
  letterM.draw();
  letterM.update();
  letterO.draw();
  letterO.update();
  letterO2.draw();
  letterO2.update();
  letterT.draw();
  letterT.update();
  letterH.draw();
  letterH.update();

  letterS2.draw();
  letterS2.update();
  letterE.draw();
  letterE.update();
  letterA2.draw();
  letterA2.update();

  letterN.draw();
  letterN.update();
  letterE2.draw();
  letterE2.update();
  letterV.draw();
  letterV.update();
  letterE3.draw();
  letterE3.update();
  letterR.draw();
  letterR.update();

  letterM2.draw();
  letterM2.update();
  letterA3.draw();
  letterA3.update();
  letterD.draw();
  letterD.update();
  letterE4.draw();
  letterE4.update();

  letterA4.draw();
  letterA4.update();

  letterS3.draw();
  letterS3.update();
  letterK.draw();
  letterK.update();
  letterI.draw();
  letterI.update();
  letterL.draw();
  letterL.update();
  letterL2.draw();
  letterL2.update();
  letterE5.draw();
  letterE5.update();
  letterD2.draw();
  letterD2.update();

  letterS4.draw();
  letterS4.update();
  letterA5.draw();
  letterA5.update();
  letterI2.draw();
  letterI2.update();
  letterL3.draw();
  letterL3.update();
  letterO3.draw();
  letterO3.update();
  letterR2.draw();
  letterR2.update();

 //  saveFrame();
}
void keyReleased()
{
  if (key =='r') setup();
}

void keyPressed() {

  letterA.setLetter("A", 185, 120);

  letterS.setLetter("S", 320, 120);
  letterM.setLetter("M", 405, 120);
  letterO.setLetter("O", 505, 120);
  letterO2.setLetter("O2", 585, 120);
  letterT.setLetter("T", 666, 120);
  letterH.setLetter("H", 740, 120);

  letterS2.setLetter("S2", 890, 120);
  letterE.setLetter("E", 975, 120);
  letterA2.setLetter("A2", 1045, 120);

  letterN.setLetter("N", 180, 270);
  letterE2.setLetter("E2", 265, 270);
  letterV.setLetter("V", 335, 270);
  letterE3.setLetter("E3", 415, 270);
  letterR.setLetter("R", 495, 270);


  letterM2.setLetter("M2", 655, 270);
  letterA3.setLetter("A3", 745, 270);
  letterD.setLetter("D", 830, 270);
  letterE4.setLetter("E4", 915, 270);

  letterA4.setLetter("A4", 1045, 270);

  letterS3.setLetter("S3", 170, 420);
  letterK.setLetter("K", 250,420);
  letterI.setLetter("I", 300, 420);
  letterL.setLetter("L", 355, 420);
  letterL2.setLetter("L2", 420, 420);
  letterE5.setLetter("E5", 490, 420);
  letterD2.setLetter("D2", 575, 420);

  letterS4.setLetter("S4", 720, 420);
  letterA5.setLetter("A4", 800, 420);
  letterI2.setLetter("I2", 850, 420);
  letterL3.setLetter("L3", 905, 420);
  letterO3.setLetter("O3", 970, 420);
  letterR2.setLetter("R2", 1060, 420);
}

 class Letter {

  ArrayList letterShape;
  int startIndex = 0;
  int numPointsToDraw;
  int offsetx, offsety;

  Mover[] movers;

  Letter(int x, int y) {
    //contstructor
    setLetter("1", x, y);
  }

  void setLetter(String theLetter, int x, int y) {
    letterShape = new ArrayList();

    offsetx = x;
    offsety = y;

    String lines[] = loadStrings(theLetter+".txt");

    for (int i = 0 ; i < lines.length; i++) {
      String temp = lines[i];
      String[] coords = split(temp, ",");

      for (int c = 0; c<coords.length; c+=2) {
        int pos[] = {
          int(coords[c]), int(coords[c+1])
        };

        // println(c+" "+pos[0]+" "+pos[1]);

        letterShape.add(pos);
      }
    }

    movers = new Mover[letterShape.size()];

    for (int i=0; i<(letterShape.size());i++) {
      movers[i] = new Mover();
    }

    numPointsToDraw = letterShape.size()-1;
    // println(numPointsToDraw);
  }


  void update() {


    //  println(letterShape.size());

    // Update the location
    for (int i = 0; i<letterShape.size(); i++) {

      // println("i="+i+" nMovers= "+movers.length);

      int[] tempArr = (int[])(letterShape.get(i));
      //println(tempArr[0]+","+tempArr[1]);
      movers[i].update((int)(tempArr[0]*2)+offsetx, (int)(tempArr[1]*2)+offsety);
      //movers[i].update(myArray[i][0]*10, myArray[i][1]*10);

      movers[i].display();
    }
  }

  void draw() {

    beginShape();

    startIndex++;
    if (startIndex+numPointsToDraw>(letterShape.size()-1)) {
      startIndex = 0;
      //  println("RESET!"+letterShape.size()+" "+startIndex+" "+startIndex+numPointsToDraw);
    }
    else {
      //   println(">>>>"+letterShape.size()+" "+startIndex+" "+(startIndex+numPointsToDraw));
    }

    for (int i=startIndex; i<=startIndex+numPointsToDraw; i++) {
      //println(myArray[i]);
      //println(letterShape.size()+" "+i);

      vertex((movers[i].location.x), (movers[i].location.y));
    }
    endShape();
  }
}

class Mover {

  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;
  Mover() {
    // Start in the center
    location = new PVector(random(-300,-50), random(-400, 1756));
    velocity = new PVector(random(-10,10),random(-10,10));
    topspeed = speed ;
  }

  void update(int xpos, int ypos) {
    //println("in update with "+xpos+", "+ypos);
    // Compute a vector that points from location to mouse
    PVector mouse = new PVector(xpos, ypos);
    PVector acceleration = PVector.sub(mouse, location);
    // Set magnitude of acceleration
    acceleration.setMag(0.4);

    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(speed);
    // Location changes by velocity
    location.add(velocity);
  }

  void display() {
    //stroke(10);
    // strokeWeight(1);
    //noFill();  
    //fill(10);

    //noStroke();
    //ellipse(location.x, location.y, 8, 8);
  }
}



