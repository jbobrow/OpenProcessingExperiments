

/*Mr. Nobody presents: "The Bone Smasher"
 An antipoetic and programming artifact by Felipe Castro 
 
 1-In “The Bone Smasher”, the user moves the heart-shaped “Mr. Nobody”,
 who in this game is a shooter located in the left side of the screen. 
 2-The character shoots his arm towards balls that bounce from the right 
 edge of the screen to the left, back and forth.
 There are 8 balls, and each one “contains” a hidden verse.
 3-The user interacts with the program using the “UP” and “DOWN” keys
 to move Mr. Nobody and the mouse button to shoot the balls. 
 4-The idea is to create a 4 verse poem. When the four verse poem is created, the game ends.
 
 */

//I- Declare Objects


Heart heart;
VerseBall verseBall;
VerseBall verseBall1;
VerseBall verseBall2;
VerseBall verseBall3;
VerseBall verseBall4;
VerseBall verseBall5;
VerseBall verseBall6;
VerseBall verseBall7;


WordsArea myWordsArea;
HeartArea myHeartArea;
ArmArrow arrows;

//II-Declare General Variables

PImage parra;
PImage parra1;

int count =0;
int y_message; 

int ball;
int ball1;
int ball2;
int ball3;
int ball4;
int ball5;
int ball6;
int ball7;



String message = "Ladies and gentlemen this is our first and final word: The poets have come down from Olympus";
String message1 = "THE TRUE PROBLEM of philosophy is who does the dishes: nothing otherworldly"; 
String message2 = "No president's statue escapes from those infallible pigeons: Those pigeons know exactly what they’re doing";
String message3 = "For the old folks Poetry was a luxury item; for us is an absolute necessity";
String message4= "We repudiate The poetry of dark glasses; The poetry of the cape and sword;  The poetry of the plumed hat"; 
String message5= "We propose The poetry of the naked eye; The poetry of the hairy chest; The poetry of the bare head";
String message6= "Inside the cage there is food. Not much, but some. Outside of the cage there are only vast stretches of liberty.";
String message7= "At last illumination hit and now I’m someone only passing through, who puts no faith in the whole or its parts";

// Loading a font file

PFont f;


//III-Initial properties


void setup() {

  size (800, 680);
  background(255);
  strokeWeight(2.5);
  smooth();

  heart = new Heart(-40, 5, 0.25, 60, color(255, 0, 0));
  arrows = new ArmArrow(-40, 5, 0.25, 60, color(255, 0, 0), 8);
  myWordsArea = new WordsArea (1);
  myHeartArea = new HeartArea (1);
  verseBall = new VerseBall(30, 800, 50, 2 );
  verseBall1 = new VerseBall(30, 800, 100, 1);
  verseBall2 = new VerseBall(30, 800, 150, 1.5);
  verseBall3 = new VerseBall(30, 800, 200, 3);
  verseBall4 = new VerseBall(30, 800, 250, 2.5);
  verseBall5 = new VerseBall(30, 800, 300, 0.5);
  verseBall6 = new VerseBall(30, 800, 350, random(0.5, 3));
  verseBall7= new VerseBall(30, 800, 400, 4);

  f = loadFont("ArialNarrow-Bold-20.vlw");
  parra = loadImage("Parra2ok.jpg");
  parra1 = loadImage("Parra1.jpg");
}//end setup

//IV-Display, draw and boolean statement

void draw() {

  image(parra, 150, 0);

  myWordsArea.display();
  myHeartArea.display();
  heart.display();
  arrows.display();
  verseBall.display();
  verseBall.move();
  verseBall1.display();
  verseBall1.move();
  verseBall2.display();
  verseBall2.move();
  verseBall3.display();
  verseBall3.move();
  verseBall4.display();
  verseBall4.move();
  verseBall5.display();
  verseBall5.move();
  verseBall6.display();
  verseBall6.move();
  verseBall7.display();
  verseBall7.move();

  if (count < 4) {

    if (arrows.intersect(verseBall)) {
      count ++; 
      ball = count;
      verseBall.caught();
    
  }

    if (arrows.intersect(verseBall1)) {
      count  ++ ;
      ball1 = count;
      verseBall1.caught();
    }


    if (arrows.intersect(verseBall2)) {
      count  ++ ;
      ball2 = count;
      verseBall2.caught();
    }


    if (arrows.intersect(verseBall3)) {
      count ++; 
      ball3 = count;
      verseBall3.caught();
    }



    if (arrows.intersect(verseBall4)) {
      count ++; 
      ball4 = count;
      verseBall4.caught();
    }


    if (arrows.intersect(verseBall5)) {
      count ++; 
      ball5 = count;
      verseBall5.caught();
    }


    if (arrows.intersect(verseBall6)) {
      count ++; 
      ball6 = count;
      verseBall6.caught();
    }


    if (arrows.intersect(verseBall7)) {
      count ++; 
      ball7 = count;
      verseBall7.caught();
    }
    
  }//end if count less than 4

//end of the game: display picture of parra and the verses once count is bigger than 4
  
  else {
    background(0);
    image(parra1, 300, 50);
  }

//display the messages in every ball and assigning them an order 

  if (ball > 0) {
    fill (255);
    text(message, 30, 480 + (ball * 30));
  }

  if (ball1 > 0) {
    fill (255);
    text(message1, 30, 480 + (ball1 * 30) );
  }

  if (ball2 > 0 ) {
    fill (255);
    text(message2, 30, 480 + (ball2 * 30) );
  }

  if (ball3 >0 ) {
    fill (255);
    text(message3, 30, 480 + (ball3 * 30) );
  }


  if (ball4 > 0 ) {
    fill (255);
    text(message4, 30, 480 + (ball4 * 30) );
  }

  if (ball5 > 0) {
    fill (255);
    text(message5, 30, 480 + (ball5 * 30) );
  }

  if (ball6 > 0) {
    fill (255);
    text(message6, 30, 480 + (ball6 * 30) );
  }

  if (ball7 > 0) {
    fill (255);
    text(message7, 30, 480 + (ball7 * 30) );
  }
}//end draw

//Key Pressed moves Mr. Nobody and his arm UP and Down

void keyPressed() {

  if (key == CODED) 

  {

    if (keyCode == DOWN) {

      heart.move();
      arrows.move();
    }

    else if (keyCode == UP) {
      heart.moveDos();
      arrows.moveDos();
    }
  }
}

//mousePressed shoots

void mousePressed() {
  arrows.shoot();
}

// II.1 Class Heart creates different versions of Mr.Nobody

class Heart {


  float scale;
  int translate;
  float x_heart;
  float y_heart;
  color c;
  float yspeed = 3;


  //II.1 Constructor

  Heart(float tempX, float tempY, float tempScale, int tempTranslate, color tempC) {

    x_heart = tempX;
    y_heart = tempY;
    scale = tempScale;
    translate = tempTranslate;
    c = tempC;
    
  }//end constructor

  //II.3 set display and functions

  void display () {

    pushMatrix();
    translate(x_heart, y_heart);
    scale(scale);
    heartOne();
    popMatrix();
  }//end display

  void move() {

    y_heart = y_heart + 2;
    if (x_heart > height/2) {
      y_heart = 0;
    }
    
  }//end move

  void moveDos() {

    y_heart = y_heart - 2;

    if (y_heart > height/2) {
      y_heart = 0;
    }
  }// end moveDos  


  void left() {

    x_heart = x_heart - 2;
  } //end left

  void right() {

    x_heart = x_heart + 2;
  }//end right

  //II. 4 Create the shape of the heart

  void heartOne() {  
    //leg left

    line(225, 250, 300, 250);
    line(225, 250, 225, 185);
    line(225, 200, 235, 190);
    line(225, 200, 235, 200);

    line(400, 250, 250, 440);
    line(250, 440, 220, 440);

    //leg right

    line(480, 250, 490, 440);
    line(490, 440, 510, 440);

    beginShape();
    fill(219, 2, 147);

    vertex(400, 420);
    bezierVertex(250, 200, 200, 150, 400, 215);
    vertex(400, 215);
    bezierVertex(480, 200, 650, 150, 400, 420);
    endShape(CLOSE);

    //eyes
    //left
    fill(255);

    ellipseMode(CENTER);
    ellipse(370, 270, 20, 60);
    //right

    ellipseMode(CENTER);
    ellipse(430, 270, 20, 60);


    //iris left
    fill(0);

    ellipseMode(CENTER);
    ellipse(370, 270, 10, 10);

    //iris right
    ellipseMode(CENTER);
    ellipse(430, 270, 10, 10);
  }//end void heart one
}//end class Heart

// III. 1 Class Arm/Arrow

class ArmArrow {


  float scale;
  int translate;
  float x_arm;
  float y_arm;

  color c;
  float xspeed;
  boolean shooting = false;
  float x_verse;
  float y_verse;
  float r_ball = 40;

  //III.2 Constructor

  ArmArrow(float tempX, float tempY, float tempScale, int tempTranslate, color tempC, float tempXspeed) {

    x_arm = tempX;
    y_arm = tempY;
    scale = tempScale;
    translate = tempTranslate;
    c = tempC;
    xspeed = tempXspeed;
  }//end constructor
 
  //III. 3 Set Functions

  void display () {

    pushMatrix();
    translate(x_arm, y_arm);
    scale(scale);
    if (shooting == true) {
      shoot();
    }
    arrow();
    popMatrix();
  }//end display

  void move() {

    y_arm = y_arm + 2;
    if (y_arm > height) {
      y_arm = 0;
    }
  }//end move

  void moveDos() {

    y_arm = y_arm - 2;

    if (y_arm > height) {
      y_arm = 0;
    }
  }//end moveDos

  void shoot() {
    shooting = true;
    x_arm = x_arm + xspeed;
    if (x_arm > width) {
      shooting = false;
      x_arm = -40;
    }
  }//end shoot

  //III . 4 Create the shape of the heart

  void arrow() {  
    //draw inside a rectangle 

    //noStroke();
    noFill();
    noStroke();
    ellipseMode(CENTER);
    ellipse(650, 250, r_ball, r_ball);
    stroke(0);
    line(500, 250, 680, 250);
    line(660, 250, 660, 270);
    line(660, 250, 645, 265);
  }//end void heart one

//III.5 Use Boolean to check intersection 

  boolean intersect(VerseBall d) {
    // Calculate distance
    float distance = dist(x_arm + 100, y_arm + 47, d.x_verse, d.y_verse ); 

    // Compare distance to sum of radius 
    if (distance < r_ball/3.5 + d.r_verse/3.5) { 
      return true;
    } 
    else {
      return false;
    }
  }
}//end class ArmArrow


// IV. 1 Class Verse/Balls

class VerseBall {

  float r_verse;   
  float x_verse;
  float y_verse; 
  float xspeed, yspeed;
  float BallsArea; 
  float HeartArea;


  //IV. 2  Constructor 
  VerseBall(float tempR, float tempX_verse, float tempY_verse, float tempX_Speed) {
    r_verse = 20;
    x_verse = tempX_verse;
    y_verse = tempY_verse;
    xspeed = tempX_Speed; 
    //yspeed = 1;
  } // end constructor

  //IV. 3 Define the balls  behaviors

  void move() {
    x_verse -= xspeed; 


    if (x_verse  > width || x_verse < 150) {
      xspeed *= - 1;
    }

    if (y_verse  > 480  || y_verse < 0) {
      yspeed *= - 1;
    }
  } // end move method

  //IV.4 Draw the ball verses

  void display() {

    stroke(0);
    fill(random(255), random(255), random(255));
    ellipseMode(CENTER);
    ellipse(x_verse, y_verse, r_verse, r_verse);
  } // end draw method

  void caught() {
    xspeed = 0;// rect stops
    yspeed = 0;
    y_verse = -1500;
  }//rect disappear from screen
}  // end class

//define specific areas where Mr. Nobody can display, without getting in contact with the ball/verses

class HeartArea{
  int x;
  
  HeartArea (int X){
    x = X;
 
  }
  
  void display(){
    fill(255);
  //noStroke();
  rect(0,0,150,480);
  }//end display balls
}//en class b
//define specific areas where Mr. Nobody and the verses can display, without getting in contact with the ball/verses

class WordsArea {
  int x;

  PFont f;
  WordsArea (int X) {
    x = X;
  }

  void display() {
    fill(75);
    rect(0, 480, 800, 480);
  }//end display words
}//en class words



