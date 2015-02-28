
PImage PlateBowl, Plate, Bowl, time816, time842;
PImage desmaOnTime, desmaLate, desmaEnd;
PImage board1, board2, boardSleep, boardWake;
PImage dance1, dance2, dance3, dance4, dance5;
PImage dance6, dance7, dance8, dance9, dance10;
PImage dance11, dance12, dance13;
PImage danceFall1, danceFall2, danceFall3, danceFall4;
PImage danceFall5, danceFall6, danceFall7;
PImage danceStretch1, danceStretch2;

PFont fontL, fontN;

String introText1, introText2, introText3, introEnter, introExit;
String FirstWakeText, snoozeText, wakeText;
String lateText1, lateText2, lateText3, lateText4;
String boardText1, boardText2, boardText3;
String sleepText1, sleepText2;
String solveBoard1, solveBoard2, solveBoard3, solveBoard4, solveBoard5;

float scaleFact, moveLeft;
boolean isIntro, isWakeUp, isBreakfast, isSnooze;
boolean isPlate, isBowl;
boolean isDesmaOnTime, isDesmaLate;
boolean isComSci, isPaper, isBoardSleep;
boolean isDance, isStretch, isNoStretch, isDone;

int bowlCount, plateCount, desmaCount, comSciCount, sleepCount;
int danceCount, paperCount, stretchCount;

void setup() {
  size(600, 450);
  frameRate(60);
  cursor(HAND);
  //initialize images
  imageMode(CENTER);
  colorMode(RGB);
  smooth();

  PlateBowl = loadImage("PlateBowl.jpg");
  Bowl = loadImage("Bowl.jpg");
  Plate = loadImage("Plate.jpg");
  time816 = loadImage("816.jpg");
  time842 = loadImage("842.jpg");
  desmaOnTime = loadImage("desmaOnTime.jpg");
  desmaLate = loadImage("desmaLate.jpg");
  desmaEnd = loadImage("desmaEnd.jpg");
  board1 = loadImage("board1.jpg");
  boardSleep = loadImage("boardSleep.jpg");
  boardWake = loadImage("boardWake.jpg"); 

  //initialize text
  introText1 = "Welcome to the";
  introText2 = "Everyday Life of"; 
  introText3 = "Alex Wong";

  introEnter = "Enter";
  introExit = "Exit";

  lateText1 = "... it takes";
  lateText2 = "30 minutes";
  lateText3 = "to walk from here to Broad"; 
  lateText4 = "walk";

  FirstWakeText = "to snooze or not to snooze...";
  snoozeText = "snooze!";
  wakeText = "wake up...";

  boardText1 = "eyes are starting to droop,";
  boardText2 = "stay awake.";
  boardText3 = "nap time.";

  sleepText1 = "Everyone is...";
  sleepText2 = "GONE!";

  solveBoard1 = "QuickSort the array:";
  solveBoard2 = "2 7 5 10 1 0 4 8 3 9 6";
  solveBoard3 = "0 1 2 3 4 5 6 7 8 9 10";
  solveBoard4 = "the sorting was too quick";
  solveBoard5 = "for your eyes to see...";

  //initialize variables
  moveLeft = 0;
  scaleFact = 1;
  bowlCount = -1;
  plateCount = 0;
  desmaCount = 0;
  comSciCount = 0;
  sleepCount = 0;
  paperCount = 0;
  danceCount = 0;
  stretchCount = 0;

  background(255);
  textAlign(CENTER, CENTER);

  isBreakfast = false;
  isSnooze = false;
  isIntro = true;
  isWakeUp = false;
  isDesmaLate = false;
  isDesmaOnTime = false;
  isComSci = false;
  isPaper = false;
  isBoardSleep = false;
  isDance = false;
  isStretch = false;
  isNoStretch = false;
  isDone = false;
}

void draw() {
  println("MX: " + mouseX);
  println("MY: " + mouseY);


  pushMatrix();
  if (isIntro) {
    pushMatrix();
    //load font
    fontL = loadFont("AngsanaNew-Bold-110.vlw");
    fontN = loadFont("AngsanaNew-Bold-72.vlw");
    textFont(fontL);
    background(255, 255, 255);
    frameRate(60);
    translate(width/2, height/2);
    textFont(fontN);
    textAlign(LEFT, CENTER);

    noStroke();
    fill(255, 255, 255);
    rect(width/4-10, height/4-10, 130, 50);
    rect(width/4-10, height/4-10+50, 105, 50);

    fill(0, 0, 0);
    text(introEnter, width/4, height/4);
    text(introExit, width/4, height/4+50);

    fill(0, 0, 0);
    rotate(radians(335));
    textFont(fontL);
    textAlign(CENTER, CENTER);
    text(introText1, -40, -120);
    text(introText2, 20, -60);
    text(introText3, 80, 0);
    popMatrix();

    pushMatrix();
    translate(width/2, height/2);
    textFont(fontN);
    textAlign(LEFT, CENTER);


    if (mouseX > 440 && mouseX < 440+130 &&
      mouseY > 330 && mouseY < 330+50) {
      fill(0, 0, 0);
      rect(width/4-10, height/4-10, 130, 50);
      fill(255, 255, 255);
      text(introEnter, width/4, height/4);
      if (mousePressed) {
        isIntro = false;
        isWakeUp = true;
      }
    }

    if (mouseX > 440 && mouseX < 440+105 &&
      mouseY > 330+50 && mouseY < 330+50+50) {
      fill(0, 0, 0);
      rect(width/4-10, height/4-10+50, 105, 50);
      fill(255, 255, 255);
      text(introExit, width/4, height/4+50);
      if (mousePressed) {
        isIntro = false;
        exit();
      }
    }
    popMatrix();
  }
  popMatrix();

  if (isWakeUp) {
    fontN = loadFont("ArialRoundedMTBold-45.vlw");
    frameRate(2);
    pushMatrix();
    if (scaleFact < 2.00) {
      translate(width/2+moveLeft, height/2);  
      scale(scaleFact);
      image(time816, 0, 0, 675, 506);
      scaleFact+=0.34;
      moveLeft+=130;
    }  
    popMatrix();

    pushMatrix();
    if (scaleFact > 2.00) {
      frameRate(60);
      if (scaleFact < 3.00) {
        noTint();
        fill(180, 180, 180, 120);
        rect(0, 0, width, height/4+5);
        scaleFact += 1;
      }
      translate(width/2+moveLeft-575, height/2);  
      fontN = loadFont("ArialRoundedMTBold-45.vlw");
      textFont(fontN);
      fill(255, 255, 255);
      text(FirstWakeText, -100, -200);
      text(snoozeText, -50, -140);
      text(wakeText, 175, -140);

      if (mouseX > 65 && mouseX < 230 &&
        mouseY > 80 && mouseY < 115) {
        fill(0, 0, 0);
        text(snoozeText, -50, -140);
        if (mousePressed) {
          isWakeUp = false;
          isSnooze = true;
          scaleFact = 1;
          moveLeft = 0;
        }
      }
      if (mouseX > 290 && mouseX < 520 &&
        mouseY > 80 && mouseY < 115 ) {
        fill(0, 0, 0);
        text(wakeText, 175, -140);
        if (mousePressed) {
          isWakeUp = false;
          isBreakfast = true;
          scaleFact = 1;
          moveLeft = 0;
        }
      }
    }
    popMatrix();
  }

  if (isSnooze) {
    pushMatrix();
    frameRate(2);
    if (scaleFact < 2) {
      translate(width/2+moveLeft, height/2);  
      scale(scaleFact);
      image(time842, 0, 0, 675, 506);
      scaleFact+=0.34;
      moveLeft+=130;
    }
    popMatrix();
    if (scaleFact > 2.00) {
      frameRate(60);
      if (scaleFact < 3.00) {
        noTint();
        fill(180, 180, 180, 120);
        rect(0, 0, width, height/4+5);
        scaleFact += 1;
      }
      fill(255, 255, 255);
      textFont(fontN);
      text(lateText1, 10, 30);
      textFont(fontL);
      text(lateText2, 240, 10);
      textFont(fontN);
      text(lateText3, 10, 80);

      if (mouseX > 62 && mouseX < 167 &&
        mouseY > 70 && mouseY < 110) {
        fill(0, 0, 0);
        text(lateText4, 64, 80);
        if (mousePressed) {
          isSnooze = false;
          isDesmaLate = true;
          background(0, 0, 0);
          fill(255, 255, 255);
          //fontL = loadFont("AngsanaNew-Bold-110.vlw");
          textFont(fontL);
          text("late.", width/2-200, height/2+100);
        }
      }
    }
  }
  pushMatrix();
  if (isBreakfast) {
    frameRate(60);
    noTint();
    translate(width/2, height/2);
    image(PlateBowl, 0, 0, width, height);

    float bowlRange = dist(470, 165, 485, 315);
    float plateRange = dist(145, 100, 150, 290);


    if (dist(mouseX, mouseY, 485, 315) < bowlRange) {
      fill(255, 255, 255, 100);
      ellipse(175, 80, 280, 280);
      if (mousePressed) {
        isBreakfast = false;
        isBowl = true;
      }
    }
    if (dist(mouseX, mouseY, 150, 290) < plateRange) {
      fill(255, 255, 255, 100);
      ellipse(-150, 60, 370, 370);
      if (mousePressed) {
        isBreakfast = false;
        isPlate = true;
      }
    }
  }
  popMatrix();

  pushMatrix();
  if (isPlate) {
    frameRate(2);
    translate(width/2, height/2);
    image(Plate, 0, 0, width, height);

    if (plateCount > 0) {
      fill(255, 255, 255);
      ellipse(50, 30, 200, 200);
      fill(255, 215, 0, 150);
      ellipse(50, 30, 100, 100);
      fill(255, 215, 0, 150);
      ellipse(50, 30, 80, 80);
    }

    if (plateCount > 1) {
      stroke(160, 82, 45, 200);
      strokeWeight(30);
      line(-125, -25, 0, 200);
      strokeWeight(20);
      line(-125, -25, 0, 200);
      noStroke();
    }

    if (plateCount > 2) {
      stroke(160, 82, 45, 200);
      strokeWeight(30);
      line(-170, -10, -50, 190);
      strokeWeight(20);
      line(-170, -10, -50, 190);
      noStroke();
    }

    if (plateCount > 4) {
      isPlate = false;
      isDesmaOnTime = true;
      background(0, 0, 0);
      fill(255, 255, 255);
      //fontL = loadFont("AngsanaNew-Bold-110.vlw");
      textFont(fontL);
      text("on time!", -260, 100);
    }


    plateCount++;
  }
  popMatrix();

  pushMatrix();
  if (isBowl) {
    frameRate(2);
    translate(width/2, height/2);
    fill(255, 255, 255);
    if (bowlCount < 0)   
      image(Bowl, 0, 0, width, height);

    bowlCount++;

    if (bowlCount == 1)
      ellipse(-10, 10, 150, 150);
    if (bowlCount == 2)
      ellipse(-10, 10, 200, 200);
    if (bowlCount == 3)
      ellipse(-10, 10, 350, 350);

    fill(255, 215, 0, 200);
    if (bowlCount == 4) {
      for (int i = 0; i < 15; i++) {
        ellipse(random(-110, 110), random(-100, 100), 40, 40);
      }
    }
    if (bowlCount == 5) {
      for (int i = 0; i < 15; i++) {
        ellipse(random(-110, 110), random(-100, 100), 40, 40);
      }
    }
    if (bowlCount == 6) {
      for (int i = 0; i < 15; i++) {
        ellipse(random(-110, 110), random(-100, 100), 40, 40);
      }
    }
    if (bowlCount == 7) {
      for (int i = 0; i < 15; i++) {
        ellipse(random(-110, 110), random(-100, 100), 40, 40);
      }
    }
    if (bowlCount == 8) {
      for (int i = 0; i < 8; i++) {
        ellipse(random(-110, 110), random(-100, 100), 40, 40);
      }
    }
    if (bowlCount == 9) {
      isBowl = false;
      isDesmaOnTime = true;
      background(0, 0, 0);
      fill(255, 255, 255);
      //fontL = loadFont("AngsanaNew-Bold-110.vlw");
      textFont(fontL);
      text("on time!", -260, 100);
    }
  }
  popMatrix();


  if (isDesmaLate) {
    pushMatrix();
    frameRate(10);
    translate(width/2, height/2);
    if (desmaCount < 30) {
      tint(255, 255, 255, 25);
      image(desmaLate, 0, 0, width, height);
    }
    if (desmaCount > 40) {
      image(desmaEnd, 0, 0, width, height);
      if (desmaCount > 80) {
        background(0, 0, 0);
        textFont(fontN);
        text("next class.", 0, -150);
        if (desmaCount > 100) {
          isComSci = true;
          isDesmaLate = false;
        }
      }
    }
    desmaCount++;
    popMatrix();
  }


  pushMatrix();
  if (isDesmaOnTime) {
    frameRate(10);
    translate(width/2, height/2);
    if (desmaCount < 30) {
      tint(255, 255, 255, 25);
      image(desmaOnTime, 0, 0, width, height);
    }
    if (desmaCount > 30) {
      image(desmaEnd, 0, 0, width, height);
      if (desmaCount > 70) {
        background(0, 0, 0);
        textFont(fontN);
        text("next class.", 0, -150);
        if (desmaCount > 90) {
          isComSci = true;
          isDesmaOnTime = false;
        }
      }
    }
    desmaCount++;
  }
  popMatrix();

  pushMatrix();
  if (isComSci) {
    textFont(fontN);
    frameRate(30);
    noTint();

    if (comSciCount == 0) {
      pushMatrix();
      translate(width/2, height/2);
      image(board1, 0, 0, width, height);
      popMatrix();
    }

    fill(180, 180, 180, 200);
    rect(0, 0, width, height/4+5);

    fill(255, 255, 255);
    text(boardText1, 10, 30);
    text(boardText2, 50, 80);
    text(boardText3, 360, 80);

    if (mouseX > 50 && mouseX < 310 &&
      mouseY > 70 && mouseY < 110) {
      fill(0, 0, 0);
      text(boardText2, 50, 80);

      if (mousePressed) {
        isComSci = false;
        isPaper = true;
      }
    }
    if (mouseX > 360 && mouseX < 565 &&
      mouseY > 70 && mouseY < 110) {
      fill(0, 0, 0);
      text(boardText3, 360, 80);

      if (mousePressed) {
        isComSci = false;
        isBoardSleep = true;
      }
    }
  }

  if (isPaper) {
    frameRate(1);
    pushMatrix();
    textFont(fontN);

    if (paperCount == 0) {
      background(255, 255, 255);
      text(solveBoard1, 50, 50);
    }  
    if (paperCount == 1) {
      text(solveBoard2, 50, 100);
    }

    if (paperCount == 2) {
      text(solveBoard3, 50, 400);
    }

    if (paperCount == 4) {
      text(solveBoard4, 30, 200);
      text(solveBoard5, 30, 250);
    }

    if (paperCount > 6) {
      background(0, 0, 0, 120);
      fill(255, 255, 255);
      textFont(fontN);
      text("dance practice.", 200, 60);
      if (paperCount > 8) {
        isPaper = false;
        isDance = true;
      }
    }
    paperCount++;
    popMatrix();
  }

  if (isBoardSleep) {
    frameRate(10);
    if (sleepCount < 30) {
      pushMatrix();
      translate(width/2, height/2);
      tint(255, 255, 255, 45);
      image(boardSleep, 0, 0, width, height);
      popMatrix();
    }

    if (sleepCount > 30) {
      pushMatrix();
      tint(255, 255, 255, 25);
      translate(width/2, height/2);
      image(boardWake, 0, 0, width, height);

      popMatrix();
      fill(180, 180, 180, 120);
      rect(0, 0, width, height/4+5);
      fill(255, 255, 255);
      textFont(fontN);
      text(sleepText1, 30, 50);
      textFont(fontL);
      text(sleepText2, 340, 30);

      if (sleepCount > 60) {
        tint(255, 255, 255, 25);
        background(0, 0, 0, 120);
        fill(255, 255, 255);
        textFont(fontN);
        text("dance practice.", 200, 70);

        if (sleepCount > 80) {
          isBoardSleep = false;
          isDance = true;
        }
      }
    }
    sleepCount++;
  }

  if (isDance) {
    frameRate(15);

    if (danceCount == 0) {

      pushMatrix();
      translate(width/2, height/2);
      dance1 = loadImage("dance1.jpg");
      image(dance1, 0, 0, width, height);
      popMatrix();

      tint(255, 255, 255, 120);
      fill(180, 180, 180, 120);
      rect(0, 0, width, height/4+5);
      fill(255, 255, 255);
      textFont(fontN);
      text("should I stretch?", 30, 30);
      text("definitely.", 30, 80);
      text("nah, no need!", 280, 80);

      if (mouseX > 30 && mouseX < 250 &&
        mouseY > 45 && mouseY < 105) {
        fill(0, 0, 0);
        text("definitely.", 30, 80);

        if (mousePressed) {
          isStretch = true;
          isDance = false;
        }
      }
      if (mouseX > 280 && mouseX < 575 &&
        mouseY > 45 && mouseY < 105) {
        fill(0, 0, 0);
        text("nah, no need!", 280, 80);

        if (mousePressed) {
          isNoStretch = true;
          isDance = false;
        }
      }
    }
  }

  if (isStretch) {
    frameRate(7);
    pushMatrix();
    if (stretchCount < 10) {
      translate(width/2, height/2);
      tint(255, 255, 255, 120);
      danceStretch1 = loadImage("danceStretch1.jpg");
      image(danceStretch1, 0, 0, width, height);
    }
    if (stretchCount > 10 && stretchCount < 25) {
      translate(width/2, height/2);
      danceStretch2 = loadImage("danceStretch2.jpg");
      tint(255, 255, 255, 120);
      image(danceStretch2, 0, 0, width, height);
    }
    popMatrix();


    if (stretchCount > 25 && stretchCount < 40) {
      background(0, 0, 0);
      fill(255, 255, 255);
      text("ready.", 400, 70);
    }

    pushMatrix();
    if (stretchCount >= 40) {
      noTint();
      translate(width/2, height/2);

      if (stretchCount == 40) {
        image(dance1, 0, 0, width, height);
      } 
      if (stretchCount == 45) { 
        dance2 = loadImage("dance2.jpg");
        image(dance2, 0, 0, width, height);
      }

      if (stretchCount == 50) { 
        dance3 = loadImage("dance3.jpg");
        image(dance3, 0, 0, width, height);
      }

      if (stretchCount == 55) { 
        dance4 = loadImage("dance4.jpg");
        image(dance4, 0, 0, width, height);
      }

      if (stretchCount == 60) { 
        dance5 = loadImage("dance5.jpg");
        image(dance5, 0, 0, width, height);
      }

      if (stretchCount == 65) { 
        dance6 = loadImage("dance6.jpg");
        image(dance6, 0, 0, width, height);
      }

      if (stretchCount == 70) { 
        dance7 = loadImage("dance7.jpg");
        image(dance7, 0, 0, width, height);
      }

      if (stretchCount == 75) { 
        dance8 = loadImage("dance8.jpg");
        image(dance8, 0, 0, width, height);
      }

      if (stretchCount == 80) { 
        dance9 = loadImage("dance9.jpg");
        image(dance9, 0, 0, width, height);
      }

      if (stretchCount == 85) { 
        dance10 = loadImage("dance10.jpg");
        image(dance10, 0, 0, width, height);
      }

      if (stretchCount == 90) { 
        dance11 = loadImage("dance11.jpg");
        image(dance11, 0, 0, width, height);
      }

      if (stretchCount == 95) { 
        dance12 = loadImage("dance12.jpg");
        image(dance12, 0, 0, width, height);
      }

      if (stretchCount == 100) { 
        dance13 = loadImage("dance13.jpg");
        image(dance13, 0, 0, width, height);
      }

      pushMatrix();
      if (stretchCount > 110) {
        translate(-300, height/2*-1);
        background(0, 0, 0);
        fill(255, 255, 255);
        text("after a rather eventful day", 20, 50);
      }
      if (stretchCount > 130) {
        text("Alex ends the day with", 20, 150);
      }
      if (stretchCount > 150) {
        text("a successful windmill jump", 20, 250);
      }
      if (stretchCount > 170) {
        noTint();
        background(0, 0, 0);
        text("thank you for", 50, 150);
        text("joining me (o.o)v", 200, 250);
        if (stretchCount > 200) {
          isStretch = false;
        }
      }
      popMatrix();
    }
    popMatrix();

    stretchCount++;
  }

  if (isNoStretch) {
    pushMatrix();
    frameRate(7);
    translate(width/2, height/2);
    if (stretchCount == 0) {
      stretchCount = 40;
    }

    if (stretchCount == 40) {
      image(dance1, 0, 0, width, height);
    } 
    if (stretchCount == 45) { 
      noTint();
      dance2 = loadImage("dance2.jpg");
      image(dance2, 0, 0, width, height);
    }

    if (stretchCount == 50) { 
      dance3 = loadImage("dance3.jpg");
      image(dance3, 0, 0, width, height);
    }

    if (stretchCount == 55) { 
      dance4 = loadImage("dance4.jpg");
      image(dance4, 0, 0, width, height);
    }

    if (stretchCount == 60) { 
      dance5 = loadImage("dance5.jpg");
      image(dance5, 0, 0, width, height);
    }

    if (stretchCount == 65) { 
      dance6 = loadImage("dance6.jpg");
      image(dance6, 0, 0, width, height);
    }

    if (stretchCount == 70) { 
      dance7 = loadImage("dance7.jpg");
      image(dance7, 0, 0, width, height);
    }

    if (stretchCount == 75) { 
      dance8 = loadImage("dance8.jpg");
      image(dance8, 0, 0, width, height);
    }

    if (stretchCount == 80) { 
      dance9 = loadImage("dance9.jpg");
      image(dance9, 0, 0, width, height);
    }

    if (stretchCount == 85) { 
      dance10 = loadImage("dance10.jpg");
      image(dance10, 0, 0, width, height);
    }

    if (stretchCount == 90) { 
      danceFall1 = loadImage("danceFall1.jpg");
      image(danceFall1, 0, 0, width, height);
    }

    if (stretchCount == 95) { 
      danceFall2 = loadImage("danceFall2.jpg");
      image(danceFall2, 0, 0, width, height);
    }

    if (stretchCount == 100) { 
      danceFall3 = loadImage("danceFall3.jpg");
      image(danceFall3, 0, 0, width, height);
    }

    if (stretchCount == 105) { 
      danceFall4 = loadImage("danceFall4.jpg");
      image(danceFall4, 0, 0, width, height);
    }

    if (stretchCount == 105) { 
      danceFall5 = loadImage("danceFall5.jpg");
      image(danceFall5, 0, 0, width, height);
    }

    if (stretchCount == 110) { 
      danceFall6 = loadImage("danceFall6.jpg");
      image(danceFall6, 0, 0, width, height);
    }
    if (stretchCount == 115) { 
      danceFall7 = loadImage("danceFall7.jpg");
      image(danceFall7, 0, 0, width, height);
    }
    popMatrix();

    pushMatrix();

    if (stretchCount > 120) {

      background(0, 0, 0);
      fill(255, 255, 255);
      if (stretchCount > 120) {
        text("after a rather eventful day", 20, 50);
      }
      if (stretchCount > 135) {
        text("Alex ends the day with", 20, 150);
      }
      if (stretchCount > 150) {
        text("a windmill jump and", 20, 250);
      }
      if (stretchCount > 165) {
        text("an injured kneecap...", 20, 350);
      }
      if (stretchCount > 185) {
        noTint();
        background(0, 0, 0);
        text("we should really stretch", 50, 150);
        text("next time", 200, 250);
        if (stretchCount > 200) {
          background(0, 0, 0);
          text("the end.", 200, 250);
          isNoStretch = false;
        }
      }
    }
    stretchCount++;
    popMatrix();
  }
  popMatrix();
}


