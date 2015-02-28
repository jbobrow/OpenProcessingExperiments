
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/143032*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/141749*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139860*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak ßof *@*http://www.openprocessing.org/sketch/139848*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

/*@pjs preload="splat.png";*/

Timer timer;
Critter[] critters= new Critter[5];
int totalCritters=0;
float opacity;
boolean blink;
boolean wait;

//int timePassed;

// Variables to keep track of score, level, lives left
int level = 1;      // What level are we on
int levelCounter = 0;
int lives = 5;     // 10 lives total
int score = 0;      // User's score

PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;
PImage seven;
PImage eight;
PImage nine;
PImage ten;
PImage planet;
PImage screen;
PFont font;

void setup() {
  size (800, 800);
  colorMode(HSB, 360, 100, 100);
  opacity=60;
  blink=true;
  timer=new Timer(10000);
  one=loadImage("levelone.png");
  two=loadImage("leveltwo.png");
  three=loadImage("levelthree.png");
  four=loadImage("levelfour.png");
  five=loadImage("levelfive.png");
  six=loadImage("levelsix.png");
  seven=loadImage("levelseven.png");
  eight=loadImage("leveleight.png");
  nine=loadImage("levelnine.png");
  ten=loadImage("levelten.png");
  planet=loadImage("Planet.png");
  screen=loadImage("breakscreen.png");
  font=loadFont("YanoneKaffeesatz-Light-48.vlw");
  wait=true;
}


void draw() {
  //draws background color
  background(267, 18, 30);
  //places background image
  imageMode(CORNER);
  noTint();
  if (level==1) {
    image(one, 0, 0);
  } 
  else if (level==2) {
    image(two, 0, 0);
  } 
  else if (level==3) {
    image(three, 0, 0);
  }
  else if (level==4) {
    image(four, 0, 0);
  }
  else  if (level==5) {
    image(five, 0, 0);
  }
  else if (level==6) {
    image(six, 0, 0);
  }
  else if (level==7) {
    image(seven, 0, 0);
  }
  else if (level==8) {
    image(eight, 0, 0);
  }
  else if (level==9) {
    image(nine, 0, 0);
  }
  else if (level==10) {
    image(ten, 0, 0);
  }

  //gives a frame rate of 10 frames per second
  frameRate=10;

  //every 10 seconds add a new critter to the screen as long as the array has not reached its length
  if (frameCount % (10*10) == 0 && (totalCritters < critters.length)) { 

    //gives objects in the class random starting points
    critters[totalCritters]= new Critter(random(width), 810);
    println("are you working?");//only assigns a value if true

    //adds critters when the if statement is true
    totalCritters++;
    //
    println(totalCritters);
  }


  //for loop to 

  for (int i=0; i<totalCritters; i++) {
    if (critters[i].squashIt) {
      critters[i].dead();
      //println(i + " is splatted");
    }
    else {
      critters[i].move();
      critters[i].display();
    }
  }

  if (critters.length==totalCritters && wait) {
    timer.start();
   // println("timer is resetting");
    wait=false;
  }



  if (critters.length==totalCritters&&allSquashed()) {
    //println("you win");
    level++;
    totalCritters=0;
    wait=true;
  }
  else if (timer.isFinished() && lives != 0 && !wait) {
    //println("Timer is finished = "+ timer.isFinished());
    level++;
    lives--;
    wait=true;
    //timer.stopTimer();
    totalCritters=0;
  }
  //DISPLAYS TEXT AT TOP OF SCREEN
  fill(0, 0, 99);
  textFont(font);
  textSize(16);
  textAlign(CORNER);
  text("Lives left: " + lives, 20, 40);
  rect(20, 44, lives*10, 10);
  text("Score: " + score, 700, 60);
  text("Level: " + level, 700, 40);
  
  textSize(25);
  textAlign(CENTER);
  fill(0, 99, 99);
  text("TIME LEFT: " + intervalTime-(millis()/1000),400,45);

  if (lives<=0) {
    //You lose blinking circles
    endPage();
  }

  if (level>10 && lives != 0) {
    youWin();
  }
}

void youWin() {
  image(screen, 0, 0);

  fill(60, 72, 95, opacity);
  ellipseMode(CENTER);
  for (int i=500; i<650; i=i+15) {
    ellipse(width/2, height/2, i, i);
  }

  imageMode(CENTER);
  image(planet, width/2, height/2);
  textFont(font);
  
  fill(43, 90, 90);
  textAlign(CENTER);
  textSize(30);
  text("score: " + score, 400, 450);


  textSize(70);
  fill(43, 90, 90);
  text("YOU WIN", 400, 400);

  //You lose blinking circles
  if (blink) {
    opacity-=0.25;
  } 
  else {
    opacity+=0.25;
  }

  if (opacity<=20) {
    blink=false;
  }

  if (opacity>=50) {
    blink=true;
  }
}


void endPage() {
  image(screen, 0, 0);

  fill(60, 72, 95, opacity);
  ellipseMode(CENTER);
  for (int i=500; i<650; i=i+15) {
    ellipse(width/2, height/2, i, i);
  }


  imageMode(CENTER);
  image(planet, width/2, height/2);
  textFont(font);

  fill(43, 90, 90);
  textAlign(CENTER);
  textSize(30);
  text("score: " + score, 400, 450);

  textSize(70);
  fill(43, 90, 90);
  text("GAME OVER", 400, 400);

  //You lose blinking circles
  if (blink) {
    opacity-=0.25;
  } 
  else {
    opacity+=0.25;
  }

  if (opacity<=20) {
    blink=false;
  }

  if (opacity>=50) {
    blink=true;
  }
}


boolean allSquashed() {
  if (critters[0]== null) {
      
    return false;
  }
  else {
    for (int i=0; i<critters.length; i++) {
      if (critters[i].squashIt) {
      
      }

      else {

        return false;
      }
    }
    return true;
  }
}


void mouseClicked() {
  for (int i=0; i<totalCritters; i++) {
    if (critters[i].squash()) {
      println("critter "+ i + " squashed");
      critters[i].squashIt=true;
      score++;
      println("critter# "+ i + " : " + critters[i].squashIt);
    }
  }
}






/*@pjs preload="splat.png"; */

class Critter {
  float cx;
  float cy;
  float spacing;
  float lineY;
  float speed;
  float angle;
  float antennaCirc;
  float critterSize;
  float critterRotate;


  int howManySets;
  int diameter;
  int lineLength;
  int eyeHeight;
  int startingHue;
  int endingHue;
  int randomNum;
  int randomHue;
  int colorDiff;
  int opacity;
  int radius;


  boolean up;
  boolean blink;
  boolean flashing;
  boolean squashIt;
  PImage splat;



  Critter(float centerX, float centerY) {
    cx=centerX;
    cy=centerY;
    lineY=cy-25;
    lineLength=int(random(50, 60));
    howManySets=int(random(1, 3));
    speed=2;
    angle=20;
    antennaCirc=5;
    eyeHeight=int(random(8, 15));
    critterSize=random(0.75, 1.25);
    critterRotate=random(-1, 1);
    startingHue=20;
    endingHue=80;
    colorDiff=endingHue-startingHue;
    randomNum= floor(random(colorDiff));
    randomHue= randomNum + startingHue;
    opacity=60;
    squashIt=false;
    flashing=true;
    blink=true;
    up=true;
    radius=100;
    splat=loadImage("splat.png");
    splat.loadPixels();
  }



  void display() {
    pushMatrix();

    translate(cx, cy);
    scale(critterSize);
    rotate(critterRotate);
    translate(-cx, -cy);



    fill(randomHue, 72, 95);
    strokeWeight(1);
    stroke(randomHue+101, 237, 210);
    line(cx, lineY, cx, lineY-lineLength);

    for (int i = 0; i < howManySets+1; i++) {

      spacing=lineLength/howManySets;
      diameter=5;

      ellipseMode(CENTER);

      line(cx, lineY-spacing*i, (cx+spacing/2+i)+1, (lineY-spacing*i)-angle);
      ellipse((cx+spacing/2+i)+1, (lineY-spacing*i)-angle, diameter, diameter);

      line(cx, lineY-spacing*i, (cx-spacing/2+i)-1, (lineY-spacing*i)-angle);
      ellipse((cx-spacing/2+i)-1, (lineY-spacing*i)-angle, diameter, diameter);

      //to move the antennas up and down
      if (up) {
        angle=angle-0.25;
      } 
      else {
        angle=angle+0.25;
      }


      if (angle<=-10) {
        up=false;
      }

      if (angle>=20) {
        up=true;
      }
    }

    //////////////////////////////

    //to set the opacity of the glow
    if (blink) {
      opacity--;
    } 
    else {
      opacity++;
    }

    if (opacity<=20) {
      blink=false;
    }

    if (opacity>=60) {
      blink=true;
    }


    noStroke();
    fill(randomHue, 72, 95, opacity);
    ellipse(cx, cy+30, 100, 105);
    ellipse(cx, cy+25, 90, 100);
    ellipse(cx, cy+25, 80, 100);
    ellipse(cx, cy+25, 75, 100);

    noStroke();
    fill(randomHue+117, 83, 78);

    ellipseMode(CENTER);
    //head
    ellipse(cx, cy, 72, 50);

    fill(randomHue+117, 83, 78);
    //left curve
    bezier(cx-36, cy, cx-36, cy+50, cx-21, cy+72, cx, cy+72);
    //right curve
    bezier(cx+36, cy, cx+36, cy+50, cx+21, cy+72, cx, cy+72);

    fill(randomHue, 72, 95);
    //eye
    ellipse(cx, cy-10, eyeHeight, eyeHeight);


    fill(randomHue+93, 30, 92);
    //triangle body
    triangle(cx, cy+72, cx-36, cy, cx+36, cy);

    fill(randomHue, 72, 95);
    //antenna big circle
    ellipse(cx, cy-115, 10, 10);

    //for flashing antenna circle
    if (flashing) {
      antennaCirc=antennaCirc+0.25;
    } 
    else {
      antennaCirc=antennaCirc-0.25;
    }


    if (antennaCirc>=15) {
      flashing=false;
    }

    if (antennaCirc<=2) {
      flashing=true;
    }


    ellipse(cx, cy-140, antennaCirc, antennaCirc);

    fill(randomHue, 72, 95, 98);
    ellipseMode(CORNER);
    //top left wing
    ellipse(cx-34, cy-5, -50, 10);
    //top right wing
    ellipse(cx+34, cy-5, 50, 10);

    fill(randomHue, 72, 95);
    //bottom left wing
    bezier(cx-33, cy, cx-45, cy+2, cx-70, cy+48, cx-48, cy+66);
    //bottom right wing
    bezier(cx+33, cy, cx+45, cy+2, cx+70, cy+48, cx+48, cy+66);

    //radius of kill area
    /*ellipseMode(CENTER);
     ellipse(cx,cy+25,radius,radius);*/

    popMatrix();
  }





  void move() {
    if (cy>-100) {
      cy=cy-speed;
      lineY=lineY-speed;
    }
    else {
      cy=800;
      lineY=800;
    }


    if (cx < -100) {
      cx = width +100;
    } 
    else if (cx > width+100) {
      cx = -100;
    }

    if (critterRotate>=0) {
      cx=cx+speed;
    }
    else {
      cx=cx-speed;
    }

    if (level>1) {
      speed=5;
    } 
    else if (level>2) {
      speed=8;
    }
    else if (level>3) {
      speed=11;
    }
    else if (level>4) {
      speed=14;
    }
    else if (level>5) {
      speed=17;
    } 
    else if (level>6) {
      speed=20;
    }
  }





  void dead() {
    //println("draw splat");
     pushMatrix();
     translate(cx, cy);
     scale(critterSize);
     rotate(critterRotate);
     translate(-cx, -cy);
     
     tint(randomHue, 72, 95,opacity);
     image(splat, cx, cy);


    // makes splat change opacity//
     if (blink) {
     opacity--;
     } 
     else {
     opacity++;
     }
     
     if (opacity<=20) {
     blink=false;
     }
     
     if (opacity>=60) {
     blink=true;
     }
     
     
     popMatrix();
  }

  boolean squash() {
    float distance=dist(mouseX, mouseY, cx, (cy+(25*critterSize)));
    if (distance<radius) {
      return true;
    }
    else {
      return false;
    }
  }
}

class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  int start;
  int intervalTime;


  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
    intervalTime=100;
  }

  void setTime(int t) {
    totalTime = t;
  }

  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
  }

  void showTimer() {
    fill(0, 0, 99);
    textFont(font);
    textSize(16);

   
  }

  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}



