
/* @pjs crips=true; font="LABTOP.ttf"; */

/*@pjs preload="splat.png";*/


Timer timer;
Critter[] critters= new Critter[2];
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
int time=10;
int time2=10;
int time3=10;
int time4=10;
int time5=10;
int time6=10;
int time7=10;
int time8=10;


PImage one;
PImage three;
PImage four;
PImage five;
PImage six;
PImage seven;
PImage eight;
PImage nine;
PImage planet;
PImage screen;
PImage startscreen;
PImage green;
PImage blue;
PImage fiveLives;
PImage fourLives;
PImage threeLives;
PImage twoLives;
PImage oneLife;
PFont fontOne;
Boolean start;
Boolean restart;

void setup() {
  size (800, 800);
  colorMode(HSB, 360, 100, 100);
  opacity=60;
  blink=true;
  timer=new Timer(14000);
  one=loadImage("levelone.png");
  three=loadImage("levelthree.png");
  four=loadImage("levelfour.png");
  five=loadImage("levelfive.png");
  six=loadImage("levelsix.png");
  seven=loadImage("levelseven.png");
  eight=loadImage("leveleight.png");
  nine=loadImage("levelnine.png");
  planet=loadImage("Planet.png");
  screen=loadImage("breakscreen.png");
  fiveLives=loadImage("hearts.png");
  fourLives=loadImage("hearts2.png");
  threeLives=loadImage("hearts3.png");
  twoLives=loadImage("hearts4.png");
  oneLife=loadImage("hearts5.png");
  fontOne=createFont("LABTOP.ttf");
  startscreen=loadImage("startscreen.png");
  green=loadImage("greenplanet.png");
  blue=loadImage("blueplanet.png");
  start=true;
  wait=true;
  restart=false;
  smooth();
}


void draw() {
  
  //draws background color
  //background(267, 18, 30);
  //places background image 
  imageMode(CORNER);
  noTint();
  if (level==1 && start==false) {
    image(one, 0, 0);
  } 
  else if (level==2 && start==false) {
    image(three, 0, 0);
  } 
  else if (level==3 && start==false) {
    image(four, 0, 0);
  }
  else if (level==4 && start==false) {
    image(five, 0, 0);
  }
  else  if (level==5 && start==false) {
    image(six, 0, 0);
  }
  else if (level==6 && start==false) {
    image(seven, 0, 0);
  }
  else if (level==7 && start==false) {
    image(eight, 0, 0);
  }
  else if (level==8 && start==false) {
    image(nine, 0, 0);
  }



  //gives a frame rate of 10 frames per second
  frameRate=10;

  //every 10 seconds add a new critter to the screen as long as the array has not reached its length
  if (frameCount % (10*10) == 0 && start==false && (totalCritters < critters.length)) { 

    //gives objects in the class random starting points
    critters[totalCritters]= new Critter(random(width), 810);
    //println("are you working?");//only assigns a value if true

    //adds critters when the if statement is true
    totalCritters++;
    //
    //println(totalCritters);
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
    //println("timer is resetting");
    wait=false;
  }


  ////////////////////////////////COUNTDOWN TIMERS START////////////////////////
  if (critters.length==totalCritters&&level==1) {
    textSize(30);
    textAlign(CENTER);
    text("TIME LEFT: " + time, 400, 45);
    if (frameCount % (10*8) == 0) {
      time--;
    }
    if (time<0) {
      time=0;
    }
  }

  if (critters.length==totalCritters&&level==2) {
    textSize(30);
    textAlign(CENTER);
    text("TIME LEFT: " + time2, 400, 45);
    if (frameCount % (10*8) == 0) {
      time2--;
    }
    if (time2<0) {
      time2=0;
    }
  }

  if (critters.length==totalCritters&&level==3) {
    textSize(30);
    textAlign(CENTER);
    text("TIME LEFT: " + time3, 400, 45);
    if (frameCount % (10*8) == 0) {
      time3--;
    }
    if (time3<0) {
      time3=0;
    }
  }

  if (critters.length==totalCritters&&level==4) {
    textSize(30);
    textAlign(CENTER);
    text("TIME LEFT: " + time4, 400, 45);
    if (frameCount % (10*8) == 0) {
      time4--;
    }
    if (time4<0) {
      time4=0;
    }
  }

  if (critters.length==totalCritters&&level==5) {
    textSize(30);
    textAlign(CENTER);
    text("TIME LEFT: " + time5, 400, 45);
    if (frameCount % (10*8) == 0) {
      time5--;
    }
    if (time5<0) {
      time5=0;
    }
  }

  if (critters.length==totalCritters&&level==6) {
    textSize(30);
    textAlign(CENTER);
    text("TIME LEFT: " + time5, 400, 45);
    if (frameCount % (10*8) == 0) {
      time6--;
    }
    if (time6<0) {
      time6=0;
    }
  }

  if (critters.length==totalCritters&&level==7) {
    textSize(30);
    textAlign(CENTER);
    text("TIME LEFT: " + time7, 400, 45);
    if (frameCount % (10*8) == 0) {
      time7--;
    }
    if (time7<0) {
      time7=0;
    }
  }

  if (critters.length==totalCritters&&level==8) {
    textSize(30);
    textAlign(CENTER);
    text("TIME LEFT: " + time8, 400, 45);
    if (frameCount % (10*8) == 0) {
      time8--;
    }
    if (time8<0) {
      time8=0;
    }
  }

  ////////////////////////////////COUNTDOWN TIMERS END////////////////////////

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
  if(start==false){
  textAlign(CORNER);
  fill(0, 0, 99);
  textFont(fontOne, 25);
  text("Lives left: " + lives, 20, 40);
  text("Score: " + score, 675, 70);
  text("Level: " + level, 675, 40);
  
  noTint();
  if(lives==5){
  image(fiveLives,20,50);
  }else if (lives==4){
  image(fourLives,20,50);
  }else if (lives==3){
  image(threeLives,20,50);
  }else if (lives==2){
  image(twoLives,20,50);
  }else if (lives==1){
  image(oneLife,20,50);
  }
  }


  if (lives<=0) {
    //You lose blinking circles
    endPage();
  }

  if (level>8 && lives != 0) {
    youWin();
  }
  
    
 if(start){
  startPage();
  }
  
  if(mousePressed){
  start=false;
  }
}


//////////////////////START PAGE FUNCTION//////////////////////////
void startPage(){


imageMode(CORNER);
  image(startscreen, 0, 0);

  fill(60, 72, 95, opacity);
  noStroke();
  ellipseMode(CENTER);
  for (int i=500; i<650; i=i+15) {
    ellipse(width/2, height/2, i, i);
  }

  imageMode(CENTER);
  image(planet, 400, 400);
  
  image(green,600,200);
  image(blue,200,650);
  
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
  
  textAlign(CENTER);
  textFont(fontOne);
  textSize(70);
  fill(43, 90, 90);
  text("INVASION", 400, 350);
  textSize(40);
  text("of the", 400, 400);
  textSize(70);
  text("SPACE BUGS", 400, 475);
  
  textSize(15);
  text("squash all the bugs before they take over!", 400, 500);
}
//////////////////////START PAGE FUNCTION//////////////////////////

//////////////////////WIN PAGE FUNCTION//////////////////////////
void youWin() {
  image(screen, 0, 0);

  fill(60, 72, 95, opacity);
  ellipseMode(CENTER);
  for (int i=500; i<650; i=i+15) {
    ellipse(width/2, height/2, i, i);
  }

  imageMode(CENTER);
  image(planet, width/2, height/2);
 // textFont(fontOne);

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
  
  textSize(20);
  text("play again" , 400, 500);
  
}
//////////////////////WIN PAGE FUNCTION//////////////////////////
//////////////////////END PAGE FUNCTION//////////////////////////
void endPage() {
  image(screen, 0, 0);

  fill(60, 72, 95, opacity);
  ellipseMode(CENTER);
  for (int i=500; i<650; i=i+15) {
    ellipse(width/2, height/2, i, i);
  }


  imageMode(CENTER);
  image(planet, width/2, height/2);

  fill(43, 90, 90);
  textAlign(CENTER);
  textSize(30);
  text("score: " + score, 400, 450);

  textSize(70);
  fill(43, 90, 90);
  text("GAME OVER", 400, 400);
  
  textSize(20);
  text("play again" , 400, 500);
  
  

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
//////////////////////END PAGE FUNCTION//////////////////////////

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
      //println("critter "+ i + " squashed");
      critters[i].squashIt=true;
      score++;
      //println("critter# "+ i + " : " + critters[i].squashIt);
    }
  }
  
  if(lives<=0 && mouseX>300 && mouseX<600 && mouseY>350 && mouseY<600){
  start=true;
  lives=5;
  level=1;
  score=0;
  time=10;
  
  }
  
    
  else if(level>8 && lives != 0 && mouseX>300 && mouseX<600 && mouseY>350 && mouseY<600){
  start=true;
  lives=5;
  level=1;
  score=0;
  time=10;
  
  
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

  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  void setTime(int t) {
    totalTime = t;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  /*void stopTimer() {
   passedTime = totalTime +1;
  }*/
  
  void displayTimer(){
    
    text("TIME LEFT ", 400,40);
  }
  
  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    
    } else {
      return false;
    }
  }
}


