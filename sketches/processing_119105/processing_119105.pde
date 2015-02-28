
// This is an attempt to use various amount of screens with 
// different functions on each screen.
// There are many screens these are as follows.
// 1. Start screen
// 2. Screen to enter name
// 3. Screen saying hello and the name entered
// 4. A screen with 4 options
// 5. A screen with a simple matching game
// 6. A screen with breakout game
// 7. A game with a simple adding game
// 8. A screen with a clock
//
// There are interactions with both the keyboard and mouse.
// There are 3 examples use which can be found in the processing
// under file then examples, there are some really good codes there
// which have great animation for background effects.
// There is an example of Bubbles, atoms and a clock.
// TAB key pauses game and animations,
//==========================================================
 
// PROGRAM BEGINS
//====================

boolean isPaused; // TAB key pauses games

PFont font;// Create font

// Input strings for name
//============================
String lastInput = new String();
String currentInput = new String();

// state switches between screens
//=================================
int state;
color[] colors = { 
  color(0), color(0), color(0), color(0), color(0), color(0), color(0)
};

//===============================//
//              SETUP            //
//===============================//
void setup() {
           
  background(0); // Set background black  
  size(600, 600);// Set screen to 600, 600
  
  // Arrays for Game 3
  //=================================
  answ = new String [5];// answers array 
  answ[0] = "6";
  answ[1] = "5";
  answ[2] = "7";
  answ[3] = "4";
  answ[4] = "8";
  Sums = new String [5];// sums array
  Sums[0] = "1 + 5 = ";
  Sums[1] = "2 + 3 = ";
  Sums[2] = "4 + 3 = ";
  Sums[3] = "3 + 1 = ";
  Sums[4] = "0 + 8 = ";
  
  // Set start screen
  //==================
  state=0;
  
  // Animated background
  //=====================
  for (int i = 0; i < numBalls; i++) 
  {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
  }
  
  noStroke();
  fill(255, 204);   
  frameRate(FPS);
  smooth();
  stroke(Dot.COLOUR);
  fill(Dot.COLOUR);
  
  // Set animation on screens 2 and 3
  //====================================
  for (int i = 0; i != NUM; dots[i++] = new Dot());
  smooth ();
  
  //Setup for game 2
  //===================
  frameRate (50); // framerate set at 50, not too fast
  pos = new PVector ( width/2, height/2 ); // position of ball
  vel = new PVector ( 10, -5 ); // velocity of ball 
   
  stones = new int[13] [5]; // setting up first set of bricks 13 along
  for ( int x=0; x<13; x++ ){//  x axis and 5 down y axis 
   for ( int y=0; y<5; y++ ){
     stones[x] [y] = 1;
   }
 }
}






//------------------------------//
//   DRAW                       //
//==============================//
void draw() {
  // States in Draw 
  //----------------
  // First state (start screen)
  //=========================================
  
  if (state <=3){
     String[] lines= loadStrings("list.txt");
     background(colors[0]);
      // Places Bubbles on screen    
    //=================================
    for (int i = 0; i < numBalls; i++){
      balls[i].collide();
      balls[i].move();
      balls[i].display();
    }    
     textSize(20);  
     fill(255);
     rect(0,0, 250, 60, 255);       
     fill(0);     
     text(""+lines[0], 20, 35);// Puts button with text on screen
     
     // function call to enter name sreen
    //=====================================
    if (key == 's' ) {
      currentInput="";// clears text input from previous screen
      state =1;
    }
    ellipse(mouseX, mouseY, 10, 10); // mouse cursor
       
     if ( score == 4){
       fruit = 9;
  }// Second state (Enter name)
  //=====================================  
    if (state == 1){
      //Puts text at top of screen which allows you to enter name
    //==========================================================
    background(colors[1]);
    // puts flying dots on screen
    //===========================
    for (int i = 0; i != NUM; connectPoints(i++))   dots[i].script();
    textFont(createFont("ForteMT-48.vlw", 25));    
    fill (0, 0,255, 150);
    rect(0, 0, 600, 150, 255);    
    fill(255,255);
    textSize(30); 
    text(""+lines[1], LEFT,50);   
    text(""+lines[2], LEFT,70);        
    fill(255,255);
    text(currentInput, LEFT, 100);  // Where you enter name 
    
    ellipse(mouseX, mouseY, 10, 10);// ellipse at cursor
  }  
  // Third state (hello _ (name) )
  //===============================
  if ( state == 2 ){
    background(colors[2]);
        
    // puts flying dots on screen
    //===========================
    for (int i = 0; i != NUM; connectPoints(i++))   dots[i].script();
    
    // Puts text on screen to say hello and the name typed on previous screen
    //=======================================================================
    
    textFont(createFont("ForteMT-48.vlw", 25));    
    fill(0, 0,255, 170);
    rect(0, 0, 600, 150, 255);
    
    fill(255, 255, 0, 150);
    rect(30, 250, 200, 100, 7);  // first buttomn
    rect(300, 250, 200, 100, 7); // second button 
    rect(30, 400, 200, 100, 7); // third button 
    rect(300, 400, 200, 100, 7); // fourth button  
    
    fill(255, 255);
    textSize(40);
    text(currentInput, 100, 50);  // hello then your name
    textSize(25);    
    text(""+lines[3], 100,110);  // all text taken from text file  
    text(""+lines[4], 35, 320);
    text(""+lines[5] , 305, 320);
    text(""+lines[6] , 40, 470);
    text(""+lines[7] , 310, 470);    
    
    ellipse(mouseX, mouseY, 10, 10); // cursor
  }  
}  
  // Forth state (Game1)
  //========================
  if (state == 3){
    background(0);
    currentInput=""; // clears any keyboard input  
    game1 ();// Calls game 1
  }
    
  // Fifth state (Game2)
  //========================
  if (state == 4){
    currentInput=""; // clears any keyboard input
    game2 (); // Calls game 2
  }
  
  // Sixth state numbers game
  //=========================
  if (state == 5){
    currentInput=""; // clears any input
    game3(); // calls game 3   
  }
  
  // Seventh state clock
  //======================
  if (state == 6){
    background (0); // sets background to black
    currentInput="";// clears any text input
    drawClock();// calls clock 
  }
  // sets amount of states available 
  if ( state > 10 ){
    background(colors[state]);   
  }
}
//---------------------------------------------------//
//===================================================//
//                    BUBBLES                        //
// This code was taken from the processing examples  //
//===================================================//

int numBalls = 100;// change how many bubbles appear on screen
float spring = 0.1;
float gravity = 0.08;
float friction = -0.1;
Ball[] balls = new Ball[numBalls];
float inc = 0.0;

//  Bubbles on start screen
//==========================
class Ball {
  
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) 
  {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide()
  {
    
    for (int i = id + 1; i < numBalls; i++){
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/4;
      
      if (distance < minDist){
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }
  
  void move() 
  {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width){
      x = width - diameter/2;
      vx *= friction;
    }
    else if (x - diameter/2 < 0){
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height){
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0){
      y = diameter/2;
      vy *= friction;
    }
  }
  void display() {
    fill(255, 255, 0, 100);
    ellipse(x, y, diameter, diameter);
  }  
}


//-------------------------------
//=============================//
//          GAME 1             //        
//=============================//
int xposr = 30;
int xpose = 500;
int fruit ;
int counter = 0;
int score = 0;
float[] ypos2 = {300, 370, 440, 510};
color[] boxes = { color(255, 0, 0), color(255, 166, 31), 
                  color(255, 255, 0), color(0, 255,0)
                };

String[] fruits = {"pear.JPG","apple.JPG","orange.JPG","bananas.JPG",};

PImage img;

void game1 ()
{
  int i ;
  int j ;  
 
  if ( fruit == 0){    
    startscr();
    selectnum();
    selectfruit();   
  } 
  if (fruit == 9){
  background(0);   
  textSize(30);
  score = 0;
  fill(255);
  String[] lines= loadStrings("list.txt");
    text(""+lines[8], 100,110);
 text(""+lines[9], 25, 300);
  }
  
  // If 1 is clicked
  //=======================
  if (fruit ==1){
   background(0);
   selectnum();
   selectfruit();String[] lines= loadStrings("list.txt");
    text(""+lines[10], 20, 100);    
  }
  // If 2 is clicked
  //=======================
  if (fruit == 2){
    background(0);
    selectnum();
    selectfruit();String[] lines= loadStrings("list.txt");
    text(""+lines[11], 20, 100);
   }
  // If 3 is clicked
  //=======================
  if (fruit == 3){
    background(0);
    selectnum();
    selectfruit();String[] lines= loadStrings("list.txt");
    text(""+lines[12], 20, 100);
   }
  // If 4 is clicked
  //=======================
  if (fruit == 4){
    background(0);
    selectnum();
    selectfruit();String[] lines= loadStrings("list.txt");
    text(""+lines[13], 20, 100);
   }
  // connects red to apple
  //========================== 
  if (fruit == 5){
    background(0);         
    fill(255);
    selectnum();
    selectfruit();    
    strokeWeight(10); 
    line(140, 330, 500, 390);    
    textSize(40);String[] lines= loadStrings("list.txt");
    text(""+lines[14], 200, 100);  
  }
  
  // connects green to apple
  //===========================
  if (fruit == 6){
    background(0);       
    fill(255);
    selectnum();
    selectfruit();    
    strokeWeight(10);
    line(140, 550, 500, 320);    
     textSize(40);String[] lines= loadStrings("list.txt");
    text(""+lines[14], 200, 100);  
  }
  // connects orange to orange
  //==========================
  if (fruit == 7){
    background(0);       
    fill(255);
    selectnum();
    selectfruit();    
    strokeWeight(10);
    line(140, 390, 500, 450);    
    textSize(40);String[] lines= loadStrings("list.txt");
    text(""+lines[14], 200, 100);  
  }
  // connects yellow to banana
  //=============================
  if (fruit == 8){
    background(0);     
    fill(255);
    selectnum();
    selectfruit(); 
    strokeWeight(10);
    line(140, 470, 500, 530);    
    textSize(40);
    String[] lines= loadStrings("list.txt");
    text(""+lines[14], 200, 100); 
  }
} 
 // The start screen in game 1
//============================
void startscr()
{
  background(0);
  // Text on the start screen
  //=========================
  textSize(20);
  fill(255);
  String[] lines= loadStrings("list.txt");
    text(""+lines[15], 5, 30);
  text(""+lines[16], 5, 35, 550, 100);   
  selectnum();
}      
 
void selectnum()
{
  textSize(20);
  fill(255);  
  String[] lines= loadStrings("list.txt");
    text(""+lines[17], 5, 150);   
  text(""+lines[18], 5 , 200);
} 
 

 // The selection process in game 1
 //=================================
void selectfruit()
{
  // for placing coloured rectangle down left side
  //=============================================== 
  for (i=0; i<4; i++){
    for (j=0; j<4; j++){
      fill(boxes[j]);
      rect(xposr,ypos2[i],120,60, 15);
      if (j == i){
        i++;
      }
    }
  }// for placing fruit
  //========================
  for (i=0; i<4; i++){
    for (j=0; j<4; j++){
      img = loadImage(fruits[i]);  // fruit on screen scaled     
      image(img, xpose, ypos2[j]-20, width/8, height/8);
      i++;
    }
  }  
} 

  
//-----------------------------------
//===================================//
//             GAME 2                //
//===================================//

//  FUNCTIONS FOR GAME2
//=======================
boolean paused = true; // function to pause game
boolean done = false;  // function to determine if blocks are done
                       // and to reset blocks if mousepressed after game over
 
//    PVector CLASS
//================================
PVector pos; // Class for position
PVector vel; // Class for velocity
 
//    ARRAYS
//===================================
int[] []  stones; // array for bricks


void game2 ()
{ 
  background ( 0 ); // background and colour
  paused (); // pause function
  ball (); // ball function
  bat (); // bat function
  bricks (); // bricks or stones function
  if ( paused ){
    // when all bricks gone game over appears in text
    //in random colours flashing
    if ( done ){
      paused = true;  // function call game over
      fill(random ( 255), 0, 100 ); // text colour flashing
      textSize( 48 );         // text size
      // text displayed when game is over
     String[] lines= loadStrings("list.txt");
    text(""+lines[18], 125, 300 );
    }
    paused = !paused;
  }
}

//     CLASS BALL
//=======================
void ball () 
{ 
  fill ( 0, 255, 0 );    // ball colour
  ellipse ( pos.x, pos.y, 20, 20 ); // ball position and size
}
//     PAUSE FUNCTION CALL
// ==================================
void paused () 
{
  if (paused = !paused ) { // IF Game NOT Paused
    update();
  }
   
  // to stop ball bouncing on the bottom
  // and to return to the start position
  // if it goes through the bottom
  if (pos.x + 10 > width || pos.x - 10 < 0 ){
    vel = new PVector ( vel.x, -vel.y );
  }
   
  if ( pos.y + 10 > height || pos.y - 10 < 0){
    vel = new PVector ( -vel.x, vel.y );
  }
}

//          CLASS BRICKS
// =====================================
void bricks () 
{
  // check if ball hits blocks
  for (int x = 0; x < 13; x++){
    for (int y = 0; y < 5; y++){ //   CHECKS IF BALL HITS BRICKS
     if (stones [x] [y] > 0){    //  =============================
       if (pos.x + 10 > 10 + x*45 && pos.x - 10 < 10 + x*45 + 45
        && pos.y + 10 + y*20 > 10 && pos.y - 10 < 10 + y*20 + 20){
          stones [x] [y] = 0;
          // change velocity in y direction
          // if block is hit bottom or top
          if (pos.x > 10 + x*45 && pos.x < 10 + x*45 + 45){
            vel = new PVector ( vel.x, -vel.y );
          }
          // change velocity on x-axis if block hit on side
          if (pos.y > 10 + y*20 && pos.y < 10 + y*20 + 20){
            vel = new PVector ( vel.x, -vel.y );
          }
        }
      }
    }
  } 
  // if all blocks are gone game over 
  done = true; 
  for (int x = 0; x < 13; x++){
    for ( int y = 0; y < 5; y++){
      if (stones [x] [y] > 0){
        done = false; // if there are blocks left game continues
        fill ( 0, 0, 210, 255 );
        rect ( 10 + x*45, 10 + y*20, 44, 20 );
      }
    }
  }   
  if ( done ){
    paused = true;  // to check to see if all blocks gone
  }
}
//       CLASS BAT OR PADDLE
//==================================
void bat () 
{
  fill ( 255 ); // colour of bat or paddle
  rect ( mouseX-35, 570, 70, 20 ); // bat, controlled with mouse alond x-axis
  if ( pos.x + 10 > width || pos.x -10 < 0 ){// and size  
    vel = new PVector ( vel.x, -vel.y );}// check if bat or paddle was hit by ball   
  if ( pos.y + 10 > height || pos.y -10 <0 ){
    vel = new PVector ( -vel.x, vel.y );
  }   
  // this function maps the distance of the ball to
  // the mousepointer to the x coordinate of the speed
  if (pos.y >= 560 && pos.x >= mouseX - 35 && pos.x <= mouseX +35 ){
    vel = new PVector (  map(pos.x - mouseX, -35, 35, -10, 10), -vel.y );
  }                                 // -35, 35 was used because paddle is 70
}                                   // the x-axis is ranged -10, 10
 

//  UPDATE FUNCTION
//==========================
void update () {
  pos.add (vel);
    
  // UPDATING CHANGING POSITIONS OF BALL
  //====================================
  if (pos.x + 10 > width || pos.x -10 < 0 ) {
    vel = new PVector ( -vel.x, vel.y );
  }   
  if (pos.y - 10 < 0) {                    // Makes it visible to player ball has
    vel = new PVector ( vel.x, -vel.y );   // dropped through bottom of screen
  }   
  if ( pos.y + 10 > height) {
    vel = new PVector ( -vel.x, vel.y );
    pos = new PVector ( width/2, height/2 );
    paused = true;
    paused = !paused;
  }
}

//-------------------------------------------
//======================================//
//               GAME 3                 //
//======================================//
// variable function for animation in game 3
//==========================================

// Declaring arrays
//======================
String [] Sums;
String [] answ;

 // Delaring variables for game 3
 //===============================
 float xpos;
 float ypos = 150;
 String []num = {"0","1","2","3","4","5"} ;
 float k = 15;
 int i;
 int j;

int next;

void game3 ()
{
  
  // Start screen game 3
  //=====================
  if ( next == 0){
    if (key == '6') {
      currentInput="";
      next = 1;
      counter++;      
    }   
    smooth();
    scrnIns();
    text(Sums[0]+currentInput, 25, 300);
   }
   //Showing answer to first sum
   //===========================
   if (next == 1){
     if (key =='5'){
       currentInput="";
       next = 2;
      counter++; 
     }     
     scrnIns();
     String[] lines= loadStrings("list.txt");
    text(Sums[0] + answ[0]+"   "+lines[14], 25, 300);
     //text(Sums[0] + answ[0]+ "   correct", 25, 300);
     text(Sums[1], 25, 340);
   }
   //Showing answer to 2nd sum
   //=========================
   if (next == 2){
     if (key == '7'){
       currentInput="";
       next = 3;
       counter++; 
     }     
     scrnIns();
    String[] lines= loadStrings("list.txt");
    text(Sums[1] + answ[1]+"   "+lines[14], 25, 340);     
    
     text(Sums[2], 25, 380);
   }
   //Showing answer to 3rd sum
   //===========================
   if (next == 3){
     if (key == '4'){
       currentInput="";
       next = 4;
       counter++; 
     }   
     scrnIns();String[] lines= loadStrings("list.txt");
    text(Sums[2] + answ[2]+"   "+lines[14], 25, 380);  
     text(Sums[3], 25, 420);
   }
   // Showing answer to 4th sum
   //===========================
   if (next == 4){
     if (key == '8'){
       currentInput="";
       next =5;
       String[] lines= loadStrings("list.txt");
    text(Sums[4]+"   "+lines[14], 25, 420);  
       counter++; 
    }     
     scrnIns();     
     text(Sums[4], 25, 460);
   }
   // Showing answer to 5th sum
   //===========================
   if (next == 5){
     background(0);   
     textSize(30);
     score = 0;
     fill(255);String[] lines= loadStrings("list.txt");
    text(""+lines[8], 50, 250);
     text(""+lines[9], 25, 300);
   }
}

 
 // The abacus on screen
 //=====================
 void abacus()
 {
   for (i = 15; i<300; i++){
     fill(255);
     ellipse(xpos+i, ypos, 30, 30);
     i+=30;
   }
   fill(0);
   text("1",10, 155);
   text("2",40, 155);
   text("3",70, 155);
   text("4",100, 155);
   text("5",135, 155);
   text("6",165, 155);
   text("7",195, 155);
   text("8",225, 155);
   text("9",258, 155);
   text("10",282, 155);
 }
 //instruction screen
 //====================
 void scrnIns()
 {
   background(colors[1]);
   fill(255);
   textSize(20);
  fill(255);String[] lines= loadStrings("list.txt");
    text(""+lines[20], 05, 25, 255);
   text(""+lines[21], 0, 45, 255);
   text(""+lines[22], 0, 65, 255);
   abacus();
   fill(255);
   textSize(40);
 }


//------------------------------------------//
//==========================================//
// The clock is an example from processing  //
// found within the processing software     //
// draw clock                               //
//==========================================//

float x, y, r = 150;
float textH = 12;

void drawClock()
{
  translate(width/2, height/2);
  fill(255);fill(255);String[] lines= loadStrings("list.txt");
    text(""+lines[23],-200, -280);
  float px, py, angle = -60;
  fill(200);
  strokeWeight(4);
  ellipse(x, y, r*2, r*2);
  
  for (int i=1; i<13; i++){
    px = x+cos(radians(angle))*(r*.8);
    py = y+sin(radians(angle))*(r*.8);
    fill(0);
    // need to subtract 1/2 text width/height
    // to align center
    float textW = textWidth(str(i));
    text(i, px-textW/2, py+textH/2);
    angle+=360/12;
  }
  //hour hand
  //=============
  strokeWeight(2);
  stroke(50);
  float h = hour();
  float hourHandX = x+cos(radians(30*h-90))*(r*.5);
  float hourHandY = y+sin(radians(30*h-90))*(r*.5);
  line(x, y, hourHandX, hourHandY);
  
  //minute hand
  //================
  strokeWeight(1);
  stroke(150);
  float m = minute();
  float minuteHandX = x+cos(radians(6*m-90))*(r*.7);
  float minuteHandY = y+sin(radians(6*m-90))*(r*.7);
  line(x, y, minuteHandX, minuteHandY);
  
  //second hand
  //====================
  strokeWeight(1);
  stroke(200, 100, 30);
  float s = second();
  float secondHandX = x+cos(radians(6*s-90))*(r*.9);
  float secondHandY = y+sin(radians(6*s-90))*(r*.9);
  line(x, y, secondHandX, secondHandY);
}
//========================================//
//       MOUSE PRESSED FUNCTION           //
// =======================================//
void mousePressed()
{
  // mouse functions for screen selection
  //======================================
  if(state ==2 ){// mouse click only in state 2 menu page
    // mouse click for matching game button on menu screen
    if(pmouseX >29 && pmouseX <230 && pmouseY >250 && pmouseY <350){
      state = 3;// matching game screen
    }
    // mouse click for breakout game
    if(pmouseX >300 && pmouseX <450 && pmouseY >250 && pmouseY <350){
      state = 4;// breakout screen
    }
    // mouse click for number game
    if(pmouseX >29 && pmouseX <230 && pmouseY >400 && pmouseY <500){
      state = 5;// number game screen
    }
    // mouse click for clock screen
    if(pmouseX >300 && pmouseX <450 && pmouseY >400 && pmouseY <500){
      state = 6;// clock screen
    }
  } 
  // mouse functions for matching game
  //===================================
  // mouse click on number 1 in matching game screen
  if(pmouseX >0 && pmouseX <15 && pmouseY >175 && pmouseY <215){
   fruit = 1;
  }
  // mouse click on number 2 in matching game screen
  if(pmouseX >85 && pmouseX <115 && pmouseY >175 && pmouseY <215){
    fruit =3;// pops up text
  }
  // mouse click on number 3 in matching game screen
  if(pmouseX >205 && pmouseX <235 && pmouseY >175 && pmouseY <215){
    fruit =2;// pops up text
  }
  // mouse click on number 4 in  matching game screen
  if(pmouseX >315 && pmouseX <345 && pmouseY >175 && pmouseY <215){
    fruit =4;// pops text up
  } 
  if (fruit == 2){
    // mouse click on pear
    if(pmouseX >499 && pmouseX <549 && pmouseY >300 && pmouseY <340){
      score++;
      fruit = 6;// connects line
    }
  }
  if (fruit == 1){
  // mouse click on orange
    if(pmouseX >499 && pmouseX <549 && pmouseY >440 && pmouseY <480){
      score++;
      fruit = 7;// connects line
    }
  }  
  if (fruit == 3){
  //mouse click on banana    
     if(pmouseX >499 && pmouseX <549 && pmouseY >500 && pmouseY <550){
       score++;
       fruit = 8;// connects line
     }      
  }
  if (fruit == 4){
     if(pmouseX >499 && pmouseX <549 && pmouseY >370 && pmouseY <400){
       score++;
       fruit = 5;// connects line
     }     
  }  
 // if the game is over and TAB pressed then new load of bricks
 // are loaded and game starts again
 if ( done ) 
 {
   for( int x = 0; x < 13; x++ ){
     for( int y = 0; y < 5; y++ ){
       stones[x][y] = 1;
     }
   }
   pos = new PVector( width/2, height/2 ); // reset PVectors
   vel = new PVector( 10, -5 );            //==================
   done = false;
 }
}
//===============================================//
//       From example in processing              //
//          ATOMS IN BACKGROUND                  //
//===============================================//

final static int NUM = 200, FPS = 500;
final static Dot[] dots = new Dot[NUM];

final static void connectPoints(int i){
  for (int z = i+1; z != NUM; z++){
    if ( dots[i].areNear(dots[z]) ){
      dots[i].drawLine(dots[z]);
    }
  }
}
class Dot 
{
  final static short DIM = 15, MIN_DIST = 30, MAX_SPD = 10;
  final static color COLOUR = 0100;

  float x, y;
  float spx = random(-MAX_SPD, MAX_SPD);
  float spy = random(-MAX_SPD, MAX_SPD);

  Dot() 
  {
    x = width>>5;
    y = height>>5;
  }

  void script() 
  {
    move();
    display();
  }

  void move() 
  {
    if ((x += spx) > width  | x < 0)  spx *= -1;
    if ((y += spy) > height | y < 0)  spy *= -1;
  }

  void display() 
  {
    fill(255, 255);
    ellipse(x, y, DIM-10, DIM-10);
  }

  boolean areNear(Dot other) 
  {
    //return dist(x, y, other.x, other.y) < MIN_DIST;
    //return sq(abs(other.x - x)) + sq(abs(other.y - y)) < MIN_DIST*MIN_DIST;
    return abs(other.x - x) < MIN_DIST && abs(other.y - y) < MIN_DIST;
  }

  void drawLine(Dot other) 
  {
    fill (255, 255 );
    line(x, y, other.x, other.y);
  }
}
//=================================//
//        KEYPRESSED               //
//=================================//
void keyPressed()
{
  // Fuction to call PAUSE
  //======================
  if (key == TAB){
    if (isPaused = !isPaused)
    noLoop();
    else
    loop();
  }
  // Function Call to start screen
  //================================  
  if (key == '0'){
    
    fruit = 0; // resets matching game
    next = 0; // resets number game
    
  }
  // function call to hello screen and game menu
  //=============================================
  if(key == ENTER) {
    
    state = 2;
    lastInput = currentInput = currentInput + key;
    currentInput = "Hello     "+ lastInput;
  }else 
  if (state == 1)
  if(key == BACKSPACE && currentInput.length() > 0){// fuction to delete if your had typed wrong
    currentInput = currentInput.substring(0, currentInput.length() - 1);}
    else {
    currentInput = currentInput + key;
  }
}

