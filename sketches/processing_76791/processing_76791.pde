
//Allignment Score
float law;
float neutral;
float chaos;
float good;
float evil;
 
// Action Buttons
boolean lawbutton = false;
boolean neutralbutton = false;
boolean chaosbutton = false;
boolean gameovertest = false;
boolean levelTwo = false;
boolean levelThree = false;
 
//Action values
int did = 10;
int dont = 3;
 
//Law button
int lx = 800;
int ly = 200;
int lw = 950;
int lh = 300;
 
//Neutral button
int nx = 800;
int ny = 400;
int nw = 950;
int nh = 500;
 
//Chaos button
int cx = 800;
int cy = 600;
int cw = 950;
int ch = 700;
 
//LawGOOD Button
int xLG = 800;
int yLG = 350;
int wLG = 850;
int hLG = 325;
 
//LawBAD Button
int xLB = 900;
int yLB = 350;
int wLB = 950;
int hLB = 325;
 
//NeutralGOOD Button
int xNG = 800;
int yNG = 550;
int wNG = 850;
int hNG = 525;
 
//NeutralBAD Button
int xNB = 900;
int yNB = 550;
int wNB = 950;
int hNB = 525;
 
//ChaosGOOD Button
int xCG = 800;
int yCG = 750;
int wCG = 850;
int hCG = 725;
 
//ChaosBAD Button
int xCB = 900;
int yCB = 750;
int wCB = 950;
int hCB = 725;
 
//LAW needs bar
int needsL = constrain (200,200,700);
 
//NEUTRAL needs bar
int needsN = constrain (200,200,700);
 
//CHAOS needs bar
int needsC = constrain (200,200,700);
 
//Needs subtraction speed over time
int needSub = 5;
 
//timer
int time;
int needsTime;
int wait = 100;
int needsWait = 1000;
int tX = 950;
 
void setup() {
  size (1000,800);
  rectMode (CORNERS);
  time = second();//store the current time
  needsTime = second ();
 
//End of setup
}
  
void draw(){
  if (gameovertest == true){
   gameOver();
  } else if (gameovertest == false){
    levelOne();
  }
  if (levelTwo == true) {
    levelTwo();
  }
}
 
void levelOne (){
  background (255);
  stroke(0);
  strokeWeight(1);
   
  //LAW button
  fill(100,100,255);
  rect(lx,ly,950,300);
  //NEUTRAL button
  fill(100,255,100);
  rect(nx,ny,950,500);
  //CHAOS button
  fill(255,100,100);
  rect(cx,cy,950,700);
   
  //LAWneeds bar
  fill (255);
  rect (50, 700, 100, 200);
   
  //LAWneeds fill
  fill (0,0,255);
  rect(50, 700, 100, needsL);
   
  //NEUTRALneeds bar
  fill (255);
  rect (125, 700, 175, 200);
   
  //NEUTRALneeds fill
  fill (0,255,0);
  rect (125, 700, 175, needsN);
   
  //CHAOSneeds bar
  fill (255);
  rect (200, 700, 250, 200);
   
  //CHAOSneeds fill
  fill (255,0,0);
  rect (200, 700, 250, needsC);
   
  //Timer bar
  fill (255);
  rect (50, 100, 950, 150);
   
  //Timer fill
  fill (0);
  rect (50, 100, tX, 150);
   
// The button is pressed if (mouseX,mouseY) is inside the rectangle and mousePressed is true.
//LAW NEED BUTTON
  if (mouseX > lx && mouseX < lx+lw && mouseY > ly && mouseY < ly+lh && mouseY < ny  && mousePressed) {
    lawbutton = true;
    stroke (0);
    strokeWeight(1);
    fill(255);
    rect (xLG, yLG, wLG, hLG);
    fill(0);
    rect (xLB, yLB, wLB, hLB);
  } else {
    lawbutton = false;
  }
 
//NEUTRAL NEED BUTTON
  if (mouseX > nx && mouseX < nx+nw && mouseY > ny && mouseY < ny+nh && mouseY < cy && mousePressed) {
    neutralbutton = true;
    stroke (0);
    strokeWeight(1);
    fill(255);
    rect (xNG, yNG, wNG, hNG);
    fill(0);
    rect (xNB, yNB, wNB, hNB);
  } else {
    neutralbutton = false;
  }
 
//CHAOS NEED BUTTON
  if (mouseX > cx && mouseX < cx+cw && mouseY > cy && mouseY < cy+ch && mousePressed) {
    chaosbutton = true;
    stroke (0);
    strokeWeight(1);
    fill(255);
    rect (xCG, yCG, wCG, hCG);
    fill(0);
    rect (xCB, yCB, wCB, hCB);
  } else {
    chaosbutton = false;
  }
 
//Reset needs for test
 if (keyPressed) {
   if (key == 'r' || key == 'R') {
     needsL=700;
     needsN=700;
     needsC=700;
   }
  }
   
//Level timer
  if(tX > 50 && second() - time >= wait){
   tX = tX - 10;
    time = second();//also update the stored time
  } else if (tX <= 50) {
    tX = 50;
  }
   
//Needs timer
  if(millis() - needsTime >= needsWait && needsL < 700 && needsN < 700 && needsC < 700 ){
   needsL = needsL + needSub;
   needsN = needsN + needSub;
   needsC = needsC + needSub;
   tX = tX - 10;
    needsTime = millis();//also update the stored time
  }
   
//End level
  if ( tX <= 50) {
  levelTwo = true;
  needsL = 700;
  needsN = 700;
  needsC = 700;
  tX = 50;
  }

//NEEDS FAILURE
if (tX > 50 && needsL >= 700 || needsN >= 700 || needsC >=700) {
  gameovertest = true;
  }
  
//CREATURE
 fill (123, 123, 123);
 ellipse(500, 500, 200, 300);
  
}
 
//*********** LEVEL TWO *******************

void levelTwo (){
   background (255);
  stroke(0);
  strokeWeight(1);
   
  //LAW button
  fill(100,100,255);
  rect(lx,ly,950,300);
  //NEUTRAL button
  fill(100,255,100);
  rect(nx,ny,950,500);
  //CHAOS button
  fill(255,100,100);
  rect(cx,cy,950,700);
   
  //LAWneeds bar
  fill (255);
  rect (50, 700, 100, 200);
   
  //LAWneeds fill
  fill (0,0,255);
  rect(50, 700, 100, needsL);
   
  //NEUTRALneeds bar
  fill (255);
  rect (125, 700, 175, 200);
   
  //NEUTRALneeds fill
  fill (0,255,0);
  rect (125, 700, 175, needsN);
   
  //CHAOSneeds bar
  fill (255);
  rect (200, 700, 250, 200);
   
  //CHAOSneeds fill
  fill (255,0,0);
  rect (200, 700, 250, needsC);
   
  //Timer bar
  fill (255);
  rect (50, 100, 950, 150);
   
  //Timer fill
  fill (0);
  rect (50, 100, tX, 150);
   
// The button is pressed if (mouseX,mouseY) is inside the rectangle and mousePressed is true.
//LAW NEED BUTTON
  if (mouseX > lx && mouseX < lx+lw && mouseY > ly && mouseY < ly+lh && mouseY < ny  && mousePressed) {
    lawbutton = true;
    stroke (0);
    strokeWeight(1);
    fill(255);
    rect (xLG, yLG, wLG, hLG);
    fill(0);
    rect (xLB, yLB, wLB, hLB);
  } else {
    lawbutton = false;
  }
 
//NEUTRAL NEED BUTTON
  if (mouseX > nx && mouseX < nx+nw && mouseY > ny && mouseY < ny+nh && mouseY < cy && mousePressed) {
    neutralbutton = true;
    stroke (0);
    strokeWeight(1);
    fill(255);
    rect (xNG, yNG, wNG, hNG);
    fill(0);
    rect (xNB, yNB, wNB, hNB);
  } else {
    neutralbutton = false;
  }
 
//CHAOS NEED BUTTON
  if (mouseX > cx && mouseX < cx+cw && mouseY > cy && mouseY < cy+ch && mousePressed) {
    chaosbutton = true;
    stroke (0);
    strokeWeight(1);
    fill(255);
    rect (xCG, yCG, wCG, hCG);
    fill(0);
    rect (xCB, yCB, wCB, hCB);
  } else {
    chaosbutton = false;
  }
 
//Reset needs for test
 if (keyPressed) {
   if (key == 'r' || key == 'R') {
     needsL=700;
     needsN=700;
     needsC=700;
   }
  }
   
//Level timer
  if(tX > 50 && second() - time >= wait){
   tX = tX - 10;
    time = second();//also update the stored time
  } else if (tX <= 50) {
    tX = 50;
  }
   
//Needs timer
  if(millis() - needsTime >= needsWait && needsL < 700 && needsN < 700 && needsC < 700 ){
   needsL = needsL + needSub;
   needsN = needsN + needSub;
   needsC = needsC + needSub;
   tX = tX - 10;
    needsTime = millis();//also update the stored time
  }
   
//End level
  if ( tX <= 50) {
  levelTwo = true;
  needsL = 700;
  needsN = 700;
  needsC = 700;
  tX = 50;
  }

//NEEDS FAILURE
if (tX > 50 && needsL >= 700 || needsN >= 700 || needsC >=700) {
  gameovertest = true;
  }
}
   
//End of draw
 
 
//Action scores 
void mouseReleased() {
     //LAW GOOD ACTION
 if (needsL>200 && mouseX > xLG && mouseX < wLB-10 && mouseY < yLG && mouseY > hLG) {
    needsL = needsL - did;
    needsN = needsN + dont;
    needsC = needsC + dont;
    law = law + 1;
    good = good +1;
  }
   
    //LAW BAD ACTION
if (lawbutton == true && mouseX > xLB && mouseX < wLB && mouseY < yLB && mouseY > hLB) {
    needsL = needsL - did;
    needsN = needsN + dont;
    needsC = needsC + dont;
    law = law + 1;
    evil = evil + 1;
    }
     
        //NEUTRAL GOOD ACTION
 if (neutralbutton == true && mouseX > xNG && mouseX < wNG && mouseY < yNG && mouseY > hNG) {
    needsN = needsN - did;
    needsL = needsL + dont;
    needsC = needsC + dont;
    neutral = neutral + 1;
    good = good + 1;
    }
     
        //NEUTRAL BAD ACTION
if (neutralbutton == true && mouseX > xNB && mouseX < wNB && mouseY < yNB && mouseY > hNB) {
    needsN = needsN - did;
    needsL = needsL + dont;
    needsC = needsC + dont;
    neutral = neutral + 1;
    evil = evil + 1;
    }
     
        //CHAOS GOOD ACTION
 if (chaosbutton == true && mouseX > xCG && mouseX < wCG && mouseY < yCG && mouseY > hCG) {
    needsC = needsC - did;
    needsN = needsN + dont;
    needsL = needsL + dont;
    chaos = chaos +1;
    good = good +1;
    }
     
        //CHAOS BAD ACTION
if (chaosbutton == true && mouseX > xCB && mouseX < wCB && mouseY < yCB && mouseY > hCB) {
    needsC = needsC - did;
    needsN = needsN + dont;
    needsL = needsL + dont;
    chaos = chaos +1;
    evil = evil +1;
    }
  
}


//Creature determinate 

void creature () {
  ellipseMode (CENTER);
  rectMode (CENTER);
  fill (156, 156, 156);
  if (law > chaos + 5){
    ellipse (500, 500, 100, 100);
  }else if (chaos > law+5){
    rect (500, 500, 100, 100);
  }else if (law/chaos < law/chaos+5){
    triangle (450, 400, 500, 350, 550, 400);
  }
} 
   
//Game Over Screen
void gameOver () {
  background (0);
  fill (0);
  rectMode (CENTER);
  rect (0,600, 600, 0);
  println("GAME OVER");
  if (law > chaos+5){
    println("LAW");
  }else if (chaos > law+5){
    println ("CHAOS");
  }else if (law/chaos < law/chaos+5){
    println ("NEUTRAL");
  }  
  if (good > evil + 5){
    println ("good");
  }else if (evil > good + 5){
    println ("evil");
  }else if (good == evil || good < evil + 5 || evil < good + 5){
    println ("neutral");
  }
}
