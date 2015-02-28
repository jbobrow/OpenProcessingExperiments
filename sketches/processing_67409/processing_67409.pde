
int game = 1;

PImage home;

//text
PFont font;
float textx1 =450;

//center rectangle
float rectx = 240;
float recty = 160;
float rectwidth = 220;
float rectheight = 10;
float halfrw = 110;
float rectspeed = random (2, 5);

// top ball
int ballNum=6;
int ballRadius = 10;
 
float[] circleX= new float[ballNum];
float[] circleY= new float[ballNum];
float[] circlesize = new float[ballNum];
int rectdirection = 1;
int circledirection = 1;
float[] circleSpeed = new float [ballNum];

//bottom ball
int ballX =0;
int ballY = 400;
float radius = 20;

//shooting device
int shootx = 250;
int shooty = 200;
int shootwidth = 5;
int shootheight = 20;

//lives
int lives = 5;
int l = 0;

int rectcolor = 255;

//booleans
boolean missilemoving = false;


void setup () {
size (900,450);
  font = loadFont ("LiGothicMed-48.vlw");
  textFont (font);
  smooth();
  noStroke ();
  textAlign (CENTER);
  ellipseMode (RADIUS);
  rectMode (CENTER);
  home = loadImage ("shootinggame.jpg");
  
  // For LOOP giving ball random STARTING X location 
 for (int i = 0; i < ballNum; i++) {
    circleX[i] =random (300);
    circleY[i] = random (0,150);
    circleSpeed[i] = random(5,11);
 }
}

void draw () {

  if (game == 1) {
    gameOne();

  }
  else if (game == 2) {
    gameTwo(); 
  }

//top balls
 
fill(random(255), mouseX, mouseY);  
  ellipseMode(RADIUS);
   
  for (int i = 0; i < ballNum; i++) {
  ellipse(circleX[i], circleY[i], ballRadius, ballRadius); // draw ball
//constrain (circleX[i], 0, width);
  ballRadius = constrain(ballRadius-1,15,22);
   }
  
  for (int i = 0; i < circleX.length; i++) {
    if ((circleX[i] >= width) || (circleX[i] <= 0)) { // reverse direction (bounce balls back)
  circleSpeed[i] = circleSpeed[i] * -1; // change direction
  ballRadius = 30; // increase size when ball reaches end (wall) to give illusion of bouncing
    }
   circleX[i] = circleX[i] + circleSpeed[i]; // give speed along X  
 
  }
}



//my mouse function
void mousePressed() {

}

//game one
void gameOne (){
  image (home, 0, 0);

  if(mousePressed){
    game = 2; 
  }
}


//game two
void gameTwo (){

  background (0);
  fill (73, 50, 50);
  textSize (18);
  text ("LIVES: " + (5-l), 410, 305);


   //drawing our elements
  fill (255, rectcolor, rectcolor);
  rect (rectx, recty, rectwidth, rectheight);

  fill (255);
  ellipse (ballX, ballY, radius, radius);
  rect (shootx, shooty, shootwidth, shootheight);
  
//moving the center rect
  rectx += rectspeed * rectdirection;
  if ((rectx > width - halfrw) || (rectx < halfrw)) {
    rectdirection = -rectdirection;
  
  }

//moving the shooter
  if (missilemoving == true) {
    shooty = shooty - 10;
  }

  if (shooty < -10) {
    missilemoving = false;
  }

  //center rect
  if (rectRectIntersect(rectx-halfrw, recty-5, rectx-halfrw+rectwidth, recty-5+rectheight, shootx-1.5, shooty-10, shootx-1.5+10, shooty-10+20) == true) {
    missilemoving = false;
    lives -= 1;
    l += 1;
    rectcolor -= 85;
    println (lives);
  }  

  if (lives <= 0){
    textSize (32);
    text ("Game Over", textx1, 200);
    textSize (14);
    text ("click to play again", textx1, 250); 
  }

//CIRCLE INTERSECTION
  if (rectCircleIntersect(shootx, shooty, shootwidth, shootheight, circleX, circleY, circlesize) == true) {
    missilemoving = false;
    circlesize = random; //0
    println (circlesize);
  }

  if (circlesize <= 0){
    textSize (32);
    text ("YOU WIN", textx2, 200);
    textSize (14);
    text ("click to play again", textx2, 250);
  }

  //shooter start over
  if (missilemoving == false) {
    shooty = 250; 
  }

 //movements
  if (keyPressed == true){

    if (key == CODED) {
      if (keyCode == RIGHT) {
        if (keyPressed == true){
          ballX = ballX + 5;
          shootx= shootx + 5;
        }
      }
    }

    if (key == CODED){
      if (keyCode == LEFT){
        if (keyPressed == true){
          ballX = ballX - 5;
          shootx = shootx - 5;
        }
      }
    } 
  }

  if (mousePressed){
    rectx = 300;
    circlex = 300;
    circlesize = 15;
    ballX = 300;
    shootx = 300;
    lives = 5;
    l = 0;
    rectcolor = 280;
  }
}

//booleants
boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {

  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);

  if (circleDistanceX > (rw/2 + cr)) { 
    return false; 
  }
  if (circleDistanceY > (rh/2 + cr)) { 
    return false; 
  }
  if (circleDistanceX <= rw/2) { 
    return true; 
  } 
  if (circleDistanceY <= rh/2) { 
    return true; 
  }

  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}

//RECT/RECT
boolean rectRectIntersect(float left, float top, float right, float bottom, 
float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}


//start the game

void keyPressed(){

  
  if (key == ' '){
    missilemoving = true;      
  }
}

