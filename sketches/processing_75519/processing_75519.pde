
// Action Button
boolean button = false;
boolean gameover = false;
//BIGbutton
int x = 500;
int y = 300;
int w = 550;
int h = 375;

//RED Button
int xR = 500;
int yR = 400;
int wR = 520;
int hR = 420;

//BLUE Button
int xB = 530;
int yB = 400;
int wB = 550;
int hB = 420;

//RED needs bar
int nR = 100;

//BLUE needs bar
int nB = 100;


//timer
int time;
int needsTime;
int wait = 100;
int needsWait = 1000;
int tX = 500;

void setup() {
  size (600,600);
  rectMode (CORNERS);
  time = millis();//store the current time
  needsTime = millis ();

//End of setup
}
 
void draw(){
  if (gameover == true){
    levelOneOver();
  } else if (gameover == false){
    levelOne();
  }
}

void levelOne (){
  background (255);
  stroke(0);
  strokeWeight(1);
  
  //action button
  fill(175);
  rect(x,y,550,375);
  
  //REDneeds bar
  fill (255);
  rect (50, 500, 75, 100);
  
  //REDneeds fill
  fill (255,0,0);
  rect(50, 500, 75, nR);
  
  //BLUEneeds bar
  fill (255);
  rect (100, 500, 125, 100);
  
  //Blueneeds fill
  fill (0,0,255);
  rect (100, 500, 125, nB);
  
  //Timer bar
  fill (255);
  rect (100, 75, 500, 50);
  
  //Timer fill
  fill (0);
  rect (100, 75, tX, 50);
  
// The button is pressed if (mouseX,mouseY) is inside the rectangle and mousePressed is true.
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed) {
    button = true; 
    stroke (0);
    strokeWeight(1);
    fill(255,0,0);
    rect (xR, yR, wR, hR);
    fill(0,0,255);
    rect (xB, yB, wB, hB);
  } else {
    button = false;
  }

//Reset needs for test
 if (keyPressed) {
   if (key == 'r' || key == 'R') {
     nR = 500;
     nB = 500;
   }
  }
  
//Level timer
  if(tX > 100 && millis() - time >= wait){
   tX = tX - 1;
    time = millis();//also update the stored time
  } else if (tX <= 100) {
    tX = 100;
  }
  
//Needs timer
  if(millis() - needsTime >= needsWait && nR < 500 && nB < 500){
   // println("tick");//if it is, do something
   nR = nR + 5;
   nB = nB + 5;
   tX = tX - 1;
    needsTime = millis();//also update the stored time
  } 
  
//End Game
  if ( tX <= 100 && nR < 500 && nB < 500) {
  gameover = true;
  nR = 500;
  nB = 500;
  tX = 100;
  }

if (tX > 100 && nR == 500 || nB == 500) {
  gameover = true;
  nR = 500;
  nB = 500;
  tX = 100;
  }

  
//End of draw
}

//Action scores
void mouseReleased() {
     //RED ACTION
 if (nR >100 && mouseX > xR && mouseX < wR && mouseY > yR && mouseY < hR) {
    nR = nR - 5;
    nB = nB + 5;
  } 
  
    //BLUE ACTION
 else if (nB >100 && mouseX > xB && mouseX < wB && mouseY > yB && mouseY < hB) {
    nB = nB - 5;
    nR = nR + 15;
    } 
  } 
  
//Game Over Screen
void levelOneOver () {
  background (0);
  fill (0);
  rectMode (CENTER);
  rect (0,600, 600, 0);
  println("GAME OVER");
}
