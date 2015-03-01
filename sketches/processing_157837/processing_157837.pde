
/**
 * Sketch designed with support of Frame Differencing 
 * by Golan Levin. 
 *
 * Quantify the amount of movement in the video frame using frame-differencing.
 */


import processing.video.*;

int numPixels;
int[] previousFrame;
int[] colDiffPrev;
Capture video;

ArrayList<Flame> fire;
ArrayList<Drop> water;
ArrayList<Wood> tree;



//Wood tr;

float movementSumPP, movementSumP;

float easing = 0.09;

float fireStartX, fireStartY, waterStartX, waterStartY, treeStartX, treeStartY;

float dropNum, sparkNum, branchNum;

int maxMove, moveSum, moveSumL, moveSumR, maxDiff, maxDiffPos, maxDiffL, maxDiffLPos, maxDiffR, maxDiffRPos;

int boomCount, bamCount;

float prevWaterX, prevFireX;
int elState;

void setup() {
  size(1280, 720, P2D);
  background(0);

  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, width, height);

  // Start capturing the images from the camera
  video.start(); 

  numPixels = video.width * video.height;
  // Create an array to store the previously captured frame
  previousFrame = new int[numPixels];
  colDiffPrev = new int[numPixels];
  loadPixels();

  fire = new ArrayList<Flame>();

  water = new ArrayList <Drop>();

  tree = new ArrayList <Wood>();

  //  fireStartX = width*4/5;
  fireStartX = width/2;
  fireStartY = height/2;

  //  waterStartX = width*1/5;
  waterStartX = width/2;
  waterStartY = height/2;

  //  treeStartX = width*1/5;
  //  treeStartY = height;

  boomCount = 0;
  bamCount = 0;

  elState = 1;

  prevWaterX = waterStartX;
  prevFireX = fireStartX;



  //  startWater();




  //  tr = new Wood(treeStartX, treeStartY, 2, 6, width*3/4, 0);
}

void draw() {
  if (video.available()) {
    // When using video to manipulate the screen, use video.available() and
    // video.read() inside the draw() method so that it's safe to draw to the screen
    video.read(); // Read the new frame from the camera
    video.loadPixels(); // Make its pixels[] array available

    moveSum = 0; // Amount of movement in the frame
    moveSumL =0;
    moveSumR = 0;
    maxDiffL = 0;
    maxDiffLPos = 0;
    maxDiffR = 0;
    maxDiffRPos = width;
    maxDiff=0;
    for (int i = 0; i < numPixels; i+=5) { // For each pixel in the video frame...
      color currColor = video.pixels[i];
      color prevColor = previousFrame[i];

      // Extract the red, green, and blue components from current pixel
      int currR = (currColor >> 16) & 0xFF; // Like red(), but faster
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
      // Extract red, green, and blue components from previous pixel
      int prevR = (prevColor >> 16) & 0xFF;
      int prevG = (prevColor >> 8) & 0xFF;
      int prevB = prevColor & 0xFF;
      // Compute the difference of the red, green, and blue values
      int diffR = abs(currR - prevR);
      int diffG = abs(currG - prevG);
      int diffB = abs(currB - prevB);

      int colorDiff = diffR+diffG+diffB;

      if (colorDiff > maxDiff) {
        maxDiff=colorDiff;
        maxDiffPos=i;
      }
      moveSum += colorDiff;

      if (i% (width+1) <= width*2/5) {
        if (colorDiff > maxDiffL) {
          maxDiffL=colorDiff;
          maxDiffLPos=i;
        }
        moveSumL += colorDiff;
      } else if (i% (width+1) >= width*3/5) {
        if (colorDiff > maxDiffR) {
          maxDiffR=colorDiff;
          maxDiffRPos=i;
        }
        moveSumR += colorDiff;
      }



      //UNCOMMENT THIS TO DRAW THE SCREEN:
      //pixels[i] = color(diffR, diffG, diffB);

      colorMode(RGB, 255, 255, 255, 100);
      //     pixels[i] = color(currR, currG, currB);

      // The following line is much faster, but more confusing to read
      //pixels[i] = 0xff000000 | (diffR << 16) | (diffG << 8) | diffB;
      // Save the current color into the 'previous' buffer
      previousFrame[i] = currColor;
      colDiffPrev[i]= colorDiff;
    }

    // To prevent flicker from frames that are all black (no movement),
    // only update the screen if the image has changed.

    if (maxDiffL > 0 || maxDiffR> 0) {
      updatePixels();
    }

    //    if ((movementSum+movementSumP+movementSumPP)/3>12500000) {

    //       fill(0, 1);
    //       rect(0, 0, width, height);

    maxMove = 12000000;

    //    if (frameCount == 2) {
    //      elState ++;
    //    }

    //    if (elState == 1) {
    //      if (waterStartX > width/4 && waterStartX < width/4*3 && boomCount == 0) {
    //        //  boomCount = 0;
    //        callWater();
    //      } else if (waterStartX < width/4 && boomCount <500 ) {
    //        boomCount ++;
    //        callWave(waterStartX, waterStartY);
    //      } else if (waterStartX > width/4*3 && boomCount <500) {
    //        boomCount ++;
    //        callWave(waterStartX, waterStartY);
    //      }
    //
    //      if (boomCount >90) {
    //        elState ++;
    //      }
    //
    //      if (boomCount >=500) {
    //        boomCount = 0;
    //        waterStartX = width/2;
    //        waterStartY = width/2;
    //      }
    //    }


    if (elState == 1) {
      if (waterStartX > width/4 && waterStartX < width/4*3 && boomCount == 0) {
        //  boomCount = 0;
        callWater();
      } else 
        //      if (fireStartX < width/4 && bamCount <500 ) {
      boomCount ++;

      //      } else if (fireStartX > width/4*3 && bamCount <500) {
      //        bamCount ++;
      //        callExplosion(fireStartX, fireStartY);
    }
    if (boomCount >= 90) {
      elState =2;
      waterStartX = width/2;
      waterStartY = width/2;
    }

    if (boomCount > 0 && boomCount <= 90) {
      callWave(waterStartX, waterStartY);
      //      boomCount ++;
    } else if (boomCount > 90) {
      boomCount = 0;
    }

    if (elState == 2) {
      if (fireStartX > width/4 && fireStartX < width/4*3 && bamCount == 0) {
        //  boomCount = 0;
        callFire();
      } else 
        //      if (fireStartX < width/4 && bamCount <500 ) {
      bamCount ++;

      //      } else if (fireStartX > width/4*3 && bamCount <500) {
      //        bamCount ++;
      //        callExplosion(fireStartX, fireStartY);
    }
    if (bamCount >= 90) {
      elState =1;
      fireStartX = width/2;
      fireStartY = width/2;
    }

    if (bamCount > 0 && bamCount <= 90) {
      callExplosion(fireStartX, fireStartY);
      //      boomCount ++;
    } else if (bamCount > 90) {
      bamCount = 0;
    }

    //  if (bamCount >=500) {
    //    bamCount = 0;
    //    fireStartX = width/2;
    //    fireStartY = width/2;
    //  }
    //}
    //
    //if (boomCount > 0 && boomCount < 500) {
    //  callWave(waterStartX, waterStartY);
    //} else if (boomCount
    //
    //if (boomCount > 90 || boomCount < 0) {
    //  bamCount = 0;
    //}
    //
    //if (elState == 2) {
    //  if (fireStartX > width/4 && fireStartX < width/4*3 && bamCount == 0) {
    //    //  boomCount = 0;
    //    callFire();
    //  } else if (waterStartX < width/4 && boomCount <500 ) {
    //    boomCount ++;
    //  } else if (waterStartX > width/4*3 && boomCount <500) {
    //    boomCount ++;
    //  } else if (boomCount >=500) {
    //    boomCount = -1;
    //  }

    //
    //|| waterStartX > width/6*5
    //  
    //boomCount++;
    //
    //callWave(width/2,height/2);




    //if ElementalState is something, summon fire

    //    if (boomCount <90) {
    //
    //      boomCount++;
    // 
    //        callExplosion(width/2, height/2);
    //      }


    //    callWater();


    println("elState:" + elState + " Boom:" + boomCount + " Bam:" + bamCount);
    //  println("maxDiffL:" + maxDiffL + ", " + "maxDiffR:" + maxDiffR + ", " + moveSum + ", " + movementSumP + ", " + movementSumPP + " L:" + moveSumL + " R:" + moveSumR + " Spark:" + sparkNum + " Drop:" + dropNum); 
    // Print stuff

    movementSumPP = movementSumP;
    movementSumP = moveSum;

    if (keyPressed) {
      if (key == 's') {
        saveFrame("line-######.jpg");
      }
    }
    prevWaterX = waterStartX;
  }
}

class Drop {
  float dropX;
  float dropY;
  float size;
  float xSpeed;
  float ySpeed;
  int a;
  float randStart;
  float fallDist;
  int type;

  //CREATE CONSTRUCTOR
  Drop(float dropS, float xMin, float xMax, float yMin, float yMax, float xStart, float yStart, int dropT, int dropA) {
    dropX = xStart;
    dropY = yStart;
    size = dropS;
    //    sizeY= random(2, 6);
    xSpeed = random(xMin, xMax);
    ySpeed = random(yMin, yMax);
    a = dropA;
    randStart = random(.1, .5);
    //    fallDist = map(y, 0, height, 1, 2);
    fallDist = 1.001;
    type=dropT;
  }

  //update function
  void update() {

    //gravity -- CAN BE USED FOR OTHER ACCELERATION!!!
    ySpeed += 0.50;

    dropX += xSpeed;
    dropY += ySpeed;
    a--;
    //    sizeY += fallDist;
  }


  //display function
  void display() {
      colorMode(RGB, 255, 255, 255, 100);
    //    float totalSpeed = abs(xSpeed)+abs(ySpeed);
    float r = random(0, 50);
    float g = random(50, 150);
    float b = random(200, 255);
    float aSine = map(sin((frameCount)*randStart), -1, 1, 50, 255);


    stroke(r+20, g+20, b+20, a+20);
    //    strokeWeight(2);
    fill(r, g, b, a);
    //noSmooth();
    ellipse(dropX, dropY, size, size);

    noStroke();
    fill(255, aSine);
    ellipse(dropX-4, dropY-4, size/2, size/2);
  }

  void dropCollide(Drop drop, int dropIndex) {
    if (drop.dropY > height) {
      water.remove(dropIndex);
      if (drop.type == 0) {
        water.add(new Drop(drop.size/2, -4, 4, -abs(drop.ySpeed)*.6, -abs(drop.ySpeed)*.4, dropX, dropY, 1, int(random(10, 30))));
        water.add(new Drop(drop.size/2, -4, 4, -abs(drop.ySpeed)*.6, -abs(drop.ySpeed)*.4, dropX, dropY, 1, int(random(10, 30))));
        water.add(new Drop(drop.size/2, -4, 4, -abs(drop.ySpeed)*.6, -abs(drop.ySpeed)*.4, dropX, dropY, 1, int(random(10, 30))));
      }
    } else if (drop.a < 0) {
      water.remove(dropIndex);
    }
  }
}

//WOOD STUFF


void callWood() {


  for (int i = 0; i < tree.size (); i++) {
    Wood tr = tree.get(i);
    tr.update();
    tr.display();

    if (tr.woodY <0) {
      tree.remove(i);
    }
  }

  if (moveSum < 1000000) {
    branchNum = int(random(1, 3));
  } else {
    branchNum = map(moveSum, 0, maxMove, 1, 10);
  }

  float minSpeedTr = map(moveSum, 0, maxMove, -0.5, -20);
  float maxSpeedTr = map(moveSum, 0, maxMove, -1.5, -50);
  float maxSpeedXTr = map(moveSum, 0, maxMove, 0, 5);
  float minSizeTr = map(moveSum, 0, maxMove, 5, 5);
  float maxSizeTr = map(moveSum, 0, maxMove, 10, 10);



  float treeTargetX = abs((maxDiffPos % (width+1)) - width);
  float treeTargetY = maxDiffPos/height;

  treeStartX += (treeTargetX - treeStartX)*easing*.01;
  treeStartY += (treeTargetY - treeStartY)*easing*.01;

//  for (int i = 0; i < int (branchNum); i++) {

    tree.add(new Wood(treeStartX, treeStartY, 10, 20,0));

//  }
}


//FIRE STUFF
void callFire() {


  for (int i = 0; i < fire.size (); i++) {
    Flame f = fire.get(i);
    f.update();
    f.display();

    if (f.flameY <0) {
      fire.remove(i);
    }
  }

  if (moveSum < 900000) {
    sparkNum = int(random(1, 3));
  } else {
    sparkNum = map(moveSum, 0, maxMove, 1, 70);
  }

  float minSpeedF = map(moveSum, 0, maxMove, -3, -15);
  float maxSpeedF = map(moveSum, 0, maxMove, -10, -40);
  float maxSpeedXF = map(moveSum, 0, maxMove, 1, 5);
  float minSizeF = map(moveSum, 0, maxMove, 5, 30);
  float maxSizeF = map(moveSum, 0, maxMove, 20, 40);



  float fireTargetX = abs((maxDiffPos % (width+1)) - width);
  float fireTargetY = maxDiffPos/height;

  fireStartX += (fireTargetX - fireStartX)*easing;
  fireStartY += (fireTargetY - fireStartY)*easing;

  for (int i = 0; i < int (sparkNum); i++) {

    fire.add(new Flame(fireStartX, fireStartY, maxSpeedXF, random(minSpeedF, maxSpeedF), map(moveSum, 0, maxMove, 10, 100), minSizeF, maxSizeF));
    fire.add(new Flame(fireStartX, fireStartY, maxSpeedXF, random(minSpeedF, maxSpeedF), map(moveSum, 0, maxMove, 10, 100), minSizeF, maxSizeF));
  }
}

//WATER STUFF
void callWater() {

  for (int i=0; i < water.size (); i++) {
    Drop d = water.get(i);
    d.update();
    d.display();
    d.dropCollide(d, i);
  }

  if (moveSum < 900000) {
    dropNum = int(random(-2, 2));
  } else {
    dropNum = map(moveSum, 0, maxMove, 1, 60);
  }
  float minSpeedW = map(moveSum, 0, maxMove, -5, -20);
  float maxSpeedW = map(moveSum, 0, maxMove, -10, -50);
  float minSizeW = map(moveSum, 0, maxMove, 5, 20);
  float maxSizeW = map(moveSum, 0, maxMove, 8, 30);


  float waterTargetX = abs((maxDiffPos % (width+1)) - width);
  float waterTargetY = maxDiffPos/height;


  waterStartX += (waterTargetX - waterStartX)*easing;
  waterStartY += (waterTargetY - waterStartY)*easing;

  for (int i = 0; i < int (dropNum); i++) {
    water.add(new Drop(random(minSizeW, maxSizeW), -2, 2, -3, 7, waterStartX, waterStartY, 0, int(random(60, 75))));
  }
}

//FIRE STUFF
void callExplosion(float expStartX, float expStartY) {


  for (int i = 0; i < fire.size (); i++) {
    Flame f = fire.get(i);
    f.update();
    f.display();

    if (f.flameY <0 || f.flameY > height || f.flameX < 0 || f.flameX > height) {
      fire.remove(i);
    }
  }


  sparkNum = 70;


  float minSpeedF = -300;
  float maxSpeedF = 300;
  float maxSpeedXF = 250;
  float minSizeF = 5;
  float maxSizeF = 40;



  //  float fireTargetX = abs((maxDiffPos % (width+1)) - width);
  //  float fireTargetY = maxDiffPos/height;
  //
  //  fireStartX = fireStartX + random(-10,10);
  //  fireStartY += fireStartY + random(-10,10);



  if (bamCount > 0  && bamCount <20) {
    for (int i = 0; i < int (sparkNum); i++) {

      fire.add(new Flame(expStartX, expStartY, maxSpeedXF, random(minSpeedF, maxSpeedF), int(random(20, 98)), minSizeF, maxSizeF));
      fire.add(new Flame(expStartX, expStartY, maxSpeedXF, random(minSpeedF, maxSpeedF), int(random(20, 98)), minSizeF, maxSizeF));
    }
    println(bamCount);
  }
}
  //else set NEW STATE



class Flame {


  float flameX, flameY;
  float xSpeed, ySpeed;
  float flameW, flameH;
  float distO;
  int fH, fHStart, fS, fB, fA;

  float[] xTail = new float[15];
  float[] yTail = new float[15];




  Flame(float xStart, float yStart, float XSpeed, float YSpeed, float FA, float fSizeMin, float fSizeMax) {

    flameX = xStart + random(-10, 10);
    flameY = yStart + cos(xStart) * random (6, 10);
    flameW = random(fSizeMin, fSizeMax);
    ySpeed=YSpeed;
    xSpeed=random(-XSpeed, XSpeed);
    distO = dist(flameX, flameY, xStart, yStart);
    fHStart = int(random(50, 70));
    fH =fHStart;
    fS = 100;
    fB = 100;
    fA = int(FA);
    for ( int i = 0; i < xTail.length; i++ ) {
      xTail[i] = xStart;
      yTail[i] = yStart;
    }
    //    for ( int i = 0; i < xTail.length; i++ ) {
    //      xTail[xTail.length - 1] = xStart;
    //      yTail[yTail.length - 1] = yStart;
    //    }
    //    for ( int i = 0; i < xTail.length-1; i++ ) {
    //      xTail[i] = xTail[i+1];
    //      yTail[i] = yTail[i+1];
    //    }
  }

  void update() {
    xSpeed= xSpeed+sin(frameCount*random(.01, .1))*random(xSpeed*.5, xSpeed);
    ySpeed=ySpeed*random(.9, 1.4);
    flameX+=xSpeed;
    flameY+=ySpeed;
    flameW=flameW+random(0.7);
    if (fH > 0) {
      fH-= abs(ySpeed*.2);
    } else {
      fH = 0;
    }
    if (fB > 0) {
      fB-= abs(ySpeed*.25);
    } else {
      fB = 0;
    }
    fA=fA-int(random(-5, 15));

    xTail[xTail.length-1] = flameX;
    yTail[yTail.length -1] = flameY;

    for ( int i = 0; i < xTail.length-1; i++ ) {
      xTail[i] = xTail[i+1];
      yTail[i] = yTail[i+1];
    }
  }

  void display() {
    colorMode(HSB, 360, 100, 100, 100);
    noStroke();

    for (int i = 0; i < xTail.length - 1; i++ ) {
      float sTail = map(i, 0, xTail.length, 0, 100);
      float szTail = map(i, 0, xTail.length, -flameW, 0);
      fill(fH, abs(sTail), fB, fA);
      ellipse(xTail[i], yTail[i], abs(szTail), abs(szTail));
      //fill(b);
      //ellipse(xpos[i], ypos[i], sz, sz);
      //      stroke(fH, fS, bTail, fA); 
      //      strokeWeight(abs(szTail));
      //      line(xTail[i], yTail[i], xTail[i+1], yTail[i+1]);
      //      stroke(fH, fS-50, bTail, fA); 
      //      strokeWeight(abs(szTail)*0.4);
      //      line(xTail[i], yTail[i], xTail[i+1]+(xTail[i]-xTail[i+1]), yTail[i+1]+(yTail[i]+yTail[i+1]));
    }
    fill(fH, fS, fB, fA);
    ellipse(flameX, flameY, flameW, flameW);
  }
}

//WATER STUFF
void callWave(float waveX, float waveY) {

  for (int i=0; i < water.size (); i++) {
    Drop d = water.get(i);
    d.update();
    d.display();
    d.dropCollide(d, i);
  }

  //  if (moveSumR < 50000000) {
  //    dropNum = int(random(-2, 2));
  //  } else {
  dropNum = 100;
  //}
  float minSpeedW = -40;
  float maxSpeedW = -100;
  float minSizeW = 5;
  float maxSizeW = 25;


  //  float waterTargetX = abs((maxDiffRPos % (width+1)) - width);
  //  float waterTargetY = maxDiffRPos/height;


  //  waterStartX += (waterTargetX - waterStartX)*easing;
  //  waterStartY += (waterTargetY - waterStartY)*easing;
  if (boomCount > 0  && boomCount <6) {
    for (int i = 0; i < int (dropNum); i++) {
      water.add(new Drop(random(minSizeW, maxSizeW), -40, 40, -50, 40, waveX, waveY, 0, int(random(60, 75))));
    }
  }
}

//class Wood {
//
//  float woodX, woodY;
//  float xSpeed, ySpeed;
//  float woodW, woodH;
//  float woDistO;
//  int woH, woHStart, woS, woB, woA;
//  int type;
//
//  float[] xBranch = new float[20];
//  float[] yBranch = new float[20];
//
//
//
//
//  Wood(float xStart, float yStart, float XSpeed, float YSpeed, float brSizeMin, float brSizeMax, int branchT) {
//
//
//
//
//    woodX = xStart;
//    woodY = yStart;
//    woodW = random(brSizeMin, brSizeMax);
//    ySpeed=YSpeed;
//    xSpeed=random(-XSpeed, XSpeed);
//    woDistO = dist(woodX, woodY, xStart, yStart);
//    woHStart = int(random(50, 100));
//    woH =woHStart;
//    woS = 90;
//    woB = 50;
//
//    type = branchT;
//    for ( int i = 0; i < xBranch.length; i++ ) {
//      xBranch[i] = xStart;
//      yBranch[i] = yStart;
//    }
//    //    for ( int i = 0; i < xTail.length; i++ ) {
//    //      xTail[xTail.length - 1] = xStart;
//    //      yTail[yTail.length - 1] = yStart;
//    //    }
//    //    for ( int i = 0; i < xTail.length-1; i++ ) {
//    //      xTail[i] = xTail[i+1];
//    //      yTail[i] = yTail[i+1];
//    //    }
//  }
//
//  void update() {
//    if (woDistO > 20) {
//      xSpeed = 0;
//      ySpeed = 0;
//    } else {
//
//
//      xSpeed= xSpeed+sin(frameCount*random(.01, .1))*random(xSpeed*.2, xSpeed);
//      ySpeed=ySpeed*random(.9, 1.1);
//    }
//    woodX+=xSpeed;
//    woodY+=ySpeed;
//    woodW=woodW-random(0.4);
//    if (woH > 0) {
//      woH-= abs(ySpeed*.2);
//    } else {
//      woH = 0;
//    }
//    //    if (woB > 0) {
//    //      woB-= abs(ySpeed*.25);
//    //    } else {
//    //      woB = 0;
//    //    }
//    woA=woA-int(random(-5, 15));
//
//    xBranch[xBranch.length-1] = woodX;
//    yBranch[yBranch.length -1] = woodY;
//
//
//    for ( int i = 0; i < xBranch.length-1; i++ ) {
//      if (woDistO > 100) {
//        xBranch[i] = xBranch[i+1];
//        yBranch[i] = yBranch[i+1];
//      } else {
//        xBranch[i] = xBranch[i];
//        yBranch[i] = yBranch[i];
//      }
//    }
//  }
//
//  void display() {
//    colorMode(HSB, 360, 100, 100, 100);
//    noStroke();
//
//    for (int i = 0; i < xBranch.length - 1; i++ ) {
//      float sBranch = map(i, 0, xBranch.length, 0, 100);
//      float szBranch = map(i, 0, xBranch.length, -woodW, 0);
//      //      fill(woH, abs(sBranch), woB, woA);
//      //      ellipse(xBranch[i], yBranch[i], abs(szBranch), abs(szBranch));
//      //fill(b);
//      //ellipse(xpos[i], ypos[i], sz, sz);
//      stroke(woH, woS, woB); 
//      strokeWeight(abs(szBranch));
//      line(xBranch[i], yBranch[i], xBranch[i+1], yBranch[i+1]);
//
//      stroke(woH, woS-20, woB); 
//      strokeWeight(abs(szBranch)*0.4);
//      line(xBranch[i], yBranch[i], xBranch[i+1], yBranch[i+1]);
//    }
//    //    fill(woH, woS, woB, woA);
//    //    ellipse(woodX, woodY, woodW, woodW);
//  }
//
//  void treeBranch(Wood branch, int branchIndex) {
//    if (branch.woodY < random(height-100, height-200)) {
//      if (branch.type == 0) {
//        tree.add(new Wood(branch.woodX, branch.woodY, branch.xSpeed, branch.ySpeed, woodW, woodW, 0));
//      }
//    } else if (branch.woodY < 100) {
//      branch.woodY=branch.woodY;
//      branch.woodX=branch.woodX;
//    }
//  }
//}

class Wood {

  float woodX, woodY;
  float woodEndX, woodEndY;
  float woodRot;
  float woodW;
  float woDistO;
  int woH, woHStart, woS, woB, woA;
  int type;

  //  float[] xBranch = new float[20];
  //  float[] yBranch = new float[20];




  Wood(float xStart, float yStart, float brSizeMin, float brSizeMax, int branchT) {


    woodX = xStart;
    woodY = yStart;

    woodEndX = xStart + random(-5, 5);
    woodEndY = yStart + random(-2, -7);
    //    woodRot = R;
    woodW = random(brSizeMin, brSizeMax);
    type = branchT;

    //    woDistO = dist(woodX, woodY, xStart, yStart);
    woHStart = int(random(60, 100));
    woH =woHStart;
    woS = 90;
    woB = 50;


    //    for ( int i = 0; i < xBranch.length; i++ ) {
    //      xBranch[i] = xStart;
    //      yBranch[i] = yStart;
  }
  //    for ( int i = 0; i < xTail.length; i++ ) {
  //      xTail[xTail.length - 1] = xStart;
  //      yTail[yTail.length - 1] = yStart;
  //    }
  //    for ( int i = 0; i < xTail.length-1; i++ ) {
  //      xTail[i] = xTail[i+1];
  //      yTail[i] = yTail[i+1];
  //    }


  void update() {
    woodX = woodEndX;
    woodY = woodEndY;
  }
  /*   if (woDistO > 20) {
   xSpeed = 0;
   ySpeed = 0;
   } else {
   
   
   xSpeed= xSpeed+sin(frameCount*random(.01, .1))*random(xSpeed*.2, xSpeed);
   ySpeed=ySpeed*random(.9, 1.1);
   }
   woodX+=xSpeed;
   woodY+=ySpeed;
   woodW=woodW-random(0.4);
   if (woH > 0) {
   woH-= abs(ySpeed*.2);
   } else {
   woH = 0;
   }*/
  //    if (woB > 0) {
  //      woB-= abs(ySpeed*.25);
  //    } else {
  //      woB = 0;
  //    }
  //    woA=woA-int(random(-5, 15));
  //
  //    xBranch[xBranch.length-1] = woodX;
  //    yBranch[yBranch.length -1] = woodY;
  //
  //
  //    for ( int i = 0; i < xBranch.length-1; i++ ) {
  //      if (woDistO > 100) {
  //        xBranch[i] = xBranch[i+1];
  //        yBranch[i] = yBranch[i+1];
  //      } else {
  //        xBranch[i] = xBranch[i];
  //        yBranch[i] = yBranch[i];
  //      }
  //    }
  //}


  void display() {
    colorMode(HSB, 360, 100, 100, 100);
    noStroke();

    /*  for (int i = 0; i < xBranch.length - 1; i++ ) {
     float sBranch = map(i, 0, xBranch.length, 0, 100);
     float szBranch = map(i, 0, xBranch.length, -woodW, 0);
     //      fill(woH, abs(sBranch), woB, woA);
     //      ellipse(xBranch[i], yBranch[i], abs(szBranch), abs(szBranch));
     //fill(b);
     //ellipse(xpos[i], ypos[i], sz, sz);*/
    stroke(woH, woS, woB); 
    strokeWeight(woodW);
    line(woodX, woodY, woodEndX, woodEndY);

    //      stroke(woH, woS-20, woB); 
    //      strokeWeight(abs(szBranch)*0.4);
    //      line(xBranch[i], yBranch[i], xBranch[i+1], yBranch[i+1]);
  }
  //    fill(woH, woS, woB, woA);
  //    ellipse(woodX, woodY, woodW, woodW);


  void treeBranch(Wood branch, int branchIndex) {
    if (branch.woodY < random(height-100, height-200) && branch.woodY >100) {
      if (branch.type == 0) {
        tree.add(new Wood(branch.woodX, branch.woodY, branch.woodW, branch.woodW, 0));
      }
    } 
    //    else if (branch.woodY < 100) {
    //      branch.woodY=branch.woodY;
    //      branch.woodX=branch.woodX;
    //    }
  }
}



