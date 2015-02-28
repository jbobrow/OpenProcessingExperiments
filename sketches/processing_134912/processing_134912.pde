
// Created by Ruben Aguirre
PImage PUp; // powerup image
ArrayList rain;
ArrayList trash;
Boy boy;
Timer timer1;
Trashcan trashcan;
Powerup powerup; // powerup object
PVector v1;
Flowers[] flowers = new Flowers[25];
int trashCollected = 0;  // counter for how much trash the boy has collected
int trashDeposited = 0; // counter for how much trash the boy has deposited in the trashcan
int br = 47; // background red
int bg = 75; // background green
int bb = 75; // background blue
float Pupx; // x location of powerup
float Pupy; // y location of powerup
int t = 0; //  // part of the timer
int timer = 20; // the timer in seconds
int mode = 0; // will change to show different screens
int highscore = 0; // Sets the initial high score
int score; // initializes the current score
int speed = 10;
void setup() {
  size(800, 800); // size of the game window
  smooth();
  Pupx = random(width-10);
  Pupy = random(height/2, height-60);
  trashcan = new Trashcan();   //creating the objects
  boy = new Boy();
  rain = new ArrayList();
  trash = new ArrayList();
  timer1 = new Timer();
  PUp = loadImage("powerup2.png");
  powerup = new Powerup(Pupx, Pupy);
  for (int i = 0; i<45;i++) { // adds 45 pieces of trash into the ArrayList Trash

    trash.add(new Trash(random(width-50), random(height/2, height-50), random(25, 50), random(25, 50), random(255), random(255), random(255))); // makes random colored and sized trash that appear randomly on the grass
  }
  for (int i = 0; i<flowers.length;i++) { // creates the many flowers that appear on the grass
    flowers[i] = new Flowers(random(width), random(height/2, height));
  }
}
void draw() {

  if (mode == 0) {              // Introduction screen
    background(0);
    fill(255);
    textSize(50);
  
    textAlign(CENTER);                                  // text on introduction screen
    text("Taking out the Trash", 400, 100);
    textSize(25);
    text("Objective: Pick up the trash and throw it into the Trashcan.",400,200);
    text("Try to beat your highscore and see the park get more beautiful!",400,250);
    text("Controls:", 400, 300);
    text("Up Arrow - Move Up", 400, 350);
    text("Left Arrow - Move Left", 400, 400);
    text("Right Arrow - Move Right", 400, 450);
    text("Down Arrow - Move Down", 400, 500);
    image(PUp,125,550);
    text("Speed Boost- makes you faster!",400,600);
    
    text("Press space bar to play", 400, 700);
    if (key == ' ') {
      mode =1;
    }
  }

  else if (mode==1) { 
    background (br, bg, bb);
    fill(0, 155, 0);
    noStroke();
    rect(-25, 300, 1000, 700); // the green grass

    trashcan.display();


    if (trashDeposited>10) {
      for (int i = 0; i<flowers.length;i++) { // flowers popup after 10 trash is deposited
        flowers[i].display();
      }
    }
    if (trashDeposited>15) {  // shows how as more trash is removed, the park becomes more beautiful
      br =0;
      bg =175;             // changes the background to a more clear sky
      bb = 255;
      textSize(25);
      text("That's Much Better!", width/2-175, 100);
      //rain.remove(raindrops); // gets rid of the rain

      fill(255, 255, 0);  // a yellow sun drawn in the corrner
      ellipse(0, 0, 250, 250);
    } 

    for (int i = 0; i<trash.size(); i++) { // runs each trash object in the ArrayList trash
      Trash tp = (Trash) trash.get(i);
      tp.run();

      if ( boy.location.x > tp.location.x-15  && tp.location.x+50 > boy.location.x && boy.location.y>tp.location.y-50 && boy.location.y<tp.location.y+50) { // makes so that only 7 pieces of trash can be held at a time
        if (trashCollected==7) {
          fill(0);
          textSize(16);
          text("I can't carry any more!", boy.location.x-50, boy.location.y-100);
        }

        else {                        //after the trash is picked up, the trash is removed from the arrayList 
          trash.remove(i);  
          trashCollected+=1;         //adds 1 to the amount of trash collected
        }
      }
    }

    if ( boy.location.x > trashcan.location.x-25  && trashcan.location.x+75 > boy.location.x && boy.location.y>trashcan.location.y-50 && boy.location.y<trashcan.location.y+50) { // checks if the boy throws away the trash or not.
      //  This code is required so that the boy can deposit any amount of trash less than 7 if he desires.
      trashDeposited += trashCollected;
      trashCollected=0;
    }
    if (boy.location.x > powerup.location.x-50 && powerup.location.x+50> boy.location.x && boy.location.y > powerup.location.y-50 && boy.location.y < powerup.location.y+50) {
      powerup.location = new PVector (-100, -100); 
      speed=3*speed;            // checks if the powerup is picked up, then if it is, the boys speed is 3 times as fast
    }
    if (keyCode== RIGHT) { // keeps the appearance of the boy moving in the right position
      boy.runRight();
    }
    else if (keyCode== LEFT) { // keeps the appearance of the boy moving in the left position
      boy.runLeft();
    }

    else if (keyCode==UP) {//keeps the appearance of the boy moving in the up position
      boy.runUp();
    }
    else { // keeps the appearance of the boy moving in the down position
      boy.run();
    }

    //    Rain raindrops = new Rain(random(-800, width), -15); // made to start way off screen, so that the rain could appear everywhere
    //    rain.add(raindrops);
    //    for (int i = 0; i<rain.size();i++) {     //creates the many raindrops that start at top of screen.
    //      Rain rd = (Rain) rain.get(i);
    //      rd.run();
    //    }
    // 

    fill(0);


    textSize(16);
    text("Trash Deposited: "+trashDeposited, 600, 100);     // displays information on the screen
    text("Trash Collected: "+trashCollected, 600, 125);
    text("Trashcan", trashcan.location.x+100, trashcan.location.y+20);
    textSize(25);
    text("Highscore: "+ highscore, 600, 50); // 

    timer1.run();
    if (timer == 0) {                // updates the highscore
      score = trashDeposited;
      if (score> highscore) {
        highscore= trashDeposited;
      }    
      mode = 2;          // goes to score screen
    }
    else if (timer<15) {
      powerup.display();
    }
  }
  else if (mode==2) {  //score screen and gives chance to replay
    background(0);
    fill(255);
     textAlign(CENTER);
     textSize(50)
    text("High Score: "+highscore, 400, 200);
    text("Current Score: " +score, 400, 400);
    text("Press Spacebar to Play Again!", 400, 700);
    if (trash.size()<25) {
      for (int i = 0; i<45;i++) {          // adds new pieces of trash to the arrayList, since the others were removed. The size can become over 25.

        trash.add(new Trash(random(width-10), random(height/2, height-50), random(25, 50), random(25, 50), random(255), random(255), random(255))); // makes random colored and sized trash that appear randomly on the grass
      }
    }

  }
}
void keyPressed() {
  if (mode ==1) {        // since the game is setup already, I made it so the character can not move unless it is on game screen
    if (keyCode== RIGHT) { // changes the appearance of the boy as he moves to the right
      boy.runRight();
      boy.stepLeg();
      boy.velocity = new PVector (speed, 0);
      boy.location.add(boy.velocity);
    }
    else if (keyCode== LEFT) { // changes the appearance of the boy as he moves to the left
      boy.runLeft();
      boy.stepLeg();
      boy.velocity = new PVector (-speed, 0);
      boy.location.add(boy.velocity);
    }
    else if (keyCode== DOWN) { // the boy moves down.
      boy.velocity = new PVector (0, speed);
      boy.location.add(boy.velocity);
    }
    else if (keyCode==UP) { // the boy moves up.
      boy.runUp();
      boy.velocity = new PVector (0, -speed);
      boy.location.add(boy.velocity);
    }
  }
  if (mode ==2) {
    if (key == ' ') {         // resets the game basically
      timer = 20;
      trashDeposited =0;
      trashCollected =0;
      br = 47; // background red
      bg = 75; // background green 
      bb = 75; // background blue
      mode = 1;               // back to gamescreen
      speed=10;                 // speed back to normal
      Pupx= random(width-10);        // places the power up at another spot, when u replay
      Pupy= random(height/2, height-60);
      powerup= new Powerup(Pupx, Pupy);
    }
  }
}

int armAngle = 0;
int legAngle = 0;
int angleChange = 5;
final int ANGLE_LIMIT = 105;
final int LEG_ANGLE_LIMIT = 45;

class Boy {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float angle;

  Boy() {
    location = new PVector(200, 500);
    velocity = new PVector(speed, 0);
    acceleration = new PVector(0, 0);
  
  }
  void run() {  // the combination of many functions that draws the boy in a non-moving state(starts facing screen)
    display();
    face();
    drawLeftArm();
    drawRightArm();
    drawRightLeg();
    drawLeftLeg();
    step();
    scroll();
  }
  void runRight() { // the combination of the many functions when the boy is moving right
    display();

    pushMatrix();
    translate(location.x, location.y-40);  
    strokeWeight(5);
    stroke(255, 0, 0);
    line(10, 0, 20, 0);   // new side mouth
    strokeWeight(1);
    fill(255);
    noStroke();          
    ellipse(15, -10, 10, 10);  // new side eye
    fill(0);
    ellipse(15, -10, 5, 5);   // new side pupil
    popMatrix();
    drawLeftLegSide();
    drawRightLegSide();
    noStroke();
    drawLeftArm();
    scroll();
  }

  void runLeft() { // used for when the boy is going left
    display();
    pushMatrix();
    translate(location.x, location.y-40); 
    strokeWeight(5);
    stroke(255, 0, 0);
    line(-20, 0, -10, 0);   // new side mouth
    strokeWeight(1);
    fill(255);
    noStroke();          
    ellipse(-20, -10, 10, 10);  // new side eye
    fill(0);
    ellipse(-20, -10, 5, 5);   // new side pupil
    popMatrix();


    drawLeftLegSide();
    drawRightLegSide();
    noStroke();
    drawLeftArm();
    scroll();
  }
  void runUp() {   // used when boy is going up
    drawLeftArm();
    drawRightArm();
    display();
    drawRightLeg();
    drawLeftLeg();
    step();
    scroll();
  }
  void display() { // the body and the head
    smooth();

    stroke(0, 0, 255);
    fill(0, 0, 255);
    ellipse(location.x, location.y, 40, 120);// body
    fill(130, 80, 0);
    noStroke();
    ellipse(location.x, location.y-50, 50, 50);// head
  }
  void face() { // the mouth and eyes
    fill(255);
    ellipse(location.x-8, location.y-50, 10, 10); //eyes
    ellipse(location.x+8, location.y-50, 10, 10);
    fill(0);
    ellipse(location.x-8, location.y-50, 5, 5); //pupils
    ellipse(location.x+8, location.y-50, 5, 5);
    fill(255, 0, 0);
    ellipse(location.x, location.y-35, 30, 10);  //mouth 
    fill(0);
  }

  void drawLeftArm()
  {
    pushMatrix();
    translate(location.x-15, location.y);
    rotate(radians(-armAngle)); // waves arms
    fill(130, 80, 0);
    ellipse(-11, 0, 37, 12); // left arm
    popMatrix();
  }

  void drawRightArm()
  {
    pushMatrix();
    translate(location.x+15, location.y);
    rotate(radians(armAngle)); // waves arms
    fill(130, 80, 0);
    ellipse(12, 0, 37, 12); // right arm
    popMatrix();
  }

  void step() {
    armAngle += angleChange;        // taken from the robot example, makes the arm rotate within a range of radians

    if (armAngle > ANGLE_LIMIT || armAngle < 0)
    {
      angleChange = -angleChange;
      armAngle += angleChange;
    }
  }
  void stepLeg() {  // same as above, but for the legs to mimick walking
    legAngle += angleChange;

    if (legAngle > LEG_ANGLE_LIMIT || legAngle < 0)
    {
      angleChange = -angleChange;
      legAngle += angleChange;
    }
  }
  void drawRightLeg() {
    pushMatrix();
    translate(location.x+2, location.y+44);
    fill(0);
    ellipse(7, 40, 10, 15);//shoe
    stroke(0);
    fill(0, 0, 255);
    rect(0, 0, 12, 37); // right leg
    popMatrix();
  }
  void drawLeftLeg() {
    pushMatrix();
    translate(location.x-15, location.y+44);
    fill(0);
    ellipse(6, 40, 10, 15); // shoe
    fill(0, 0, 255);
    rect(0, 0, 12, 37); //left leg
    popMatrix();
  }
  void move() {       // the function that makes the boy move
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.limit(2);
   
  }

  void drawRightLegSide() { // draws the leg when moving,
    pushMatrix();
    translate(location.x, location.y+44);
    rotate(radians(legAngle)); // simulates walking
    fill(0);
    ellipse(7, 40, 10, 15);
    stroke(0);
    fill(0, 0, 255);
    rect(0, 0, 12, 37); // right leg
    popMatrix();
  }
  void drawLeftLegSide() {
    pushMatrix();
    translate(location.x+2, location.y+44);
    rotate(radians(-legAngle)); //same as above
    fill(0);

    ellipse(6, 40, 10, 15); // shoe
    fill(0, 0, 255);

    rect(0, 0, 12, 37); //left leg
    popMatrix();
  }
  
 void scroll(){                // Makes the boy goes from right side screen to left side of screen, and vice versa
 if (location.x>width){
    location.x= 0;
   }
   else if (location.x<0){
     location.x = width;
   }
    
  }
}

class Flowers {
  PVector location;

  Flowers(float x, float y) {
    location = new PVector(x, y);
  }


  void display() {           // creates the flower
    pushMatrix();
    translate(location.x, location.y);
    noStroke();
    fill(0, 255, 0);
    rect(-2, 0, 5, 50);
    fill(255);
    ellipse(0, 5, 15, 15);

    rotate(PI/4);
    fill(255, 255, 0);


    rect(8, -8, 10, 10);
    rect(8, 8, 10, 10);
    rect(-8, -8, 10, 10);
    rect(-8, 8, 10, 10);
    fill(0);

    popMatrix();
  }
}

class Powerup {
  PVector location;
  
  Powerup(float x, float y){
    location = new PVector(x,y);
  }
  
  
  
void display(){
  image(PUp, location.x,location.y);
}
}
class Trash {

  PVector location;
  PVector velocity = new PVector(0,0);
  PVector acceleration = new PVector(0,0);
  float wx;  //width
  float wy; //height
  float c1;
  float c2;      // colors
  float c3;
  float tx = 0;
  Trash(float x, float y, float w, float l, float r, float g, float b) {
    location = new PVector(x, y);
    wx = w;
    wy = l;
    c1 = r;
    c2 = g;
    c3 = b;
  }
  void run(){
    display();
    update();
    scroll();
    
  }
  void display() {
   
    fill(c1, c2, c3, 150);
    rect(location.x, location.y, wx, wy);
    
  }
  

  
  void update(){
    
  PVector acceleration= new PVector(7, 0); 
 

   
    velocity.add(acceleration);
    
    location.add(velocity); 
    acceleration.mult(0);
    velocity.limit(2);  
 
  }
  
  void scroll(){ // makes the trash stay on the screen
   if  (location.y<0){
    
   }
   else if (location.x>width){
    location.x= 0;
   }
   else if (location.x<0){
     location.x = width;
   }
   
   else if (location.y>height){
     
     location.y = height/2;
   }
    
  }
}

class Trashcan {

  PVector location;

  Trashcan() {
    location = new PVector(width/2, height/2 -100);
  }


  void display() {            // draws the trashcan

    fill(170);
    stroke(0);

    ellipse(location.x+25, location.y+75, 50, 20);
    noStroke();
    rect(location.x, location.y, 50, 75);
    stroke(0);
    line(location.x, location.y, location.x, location.y+75);
    line(location.x+50, location.y, location.x+50, location.y+75);
    line(location.x+40, location.y, location.x+40, location.y+82);
    line(location.x+10, location.y, location.x+10, location.y+82);
    line(location.x+25, location.y, location.x+25, location.y+85);
    ellipse(location.x+25, location.y, 50, 25);
  }
}


class Rain {



  float x = 0;
  float y = 0; 
  PVector location = new PVector(x, y);
  PVector velocity =new PVector (0, 0);
  PVector gravity = new PVector(0,.1);
  PVector acceleration = new PVector(0,0);
  float mass = 2;


  Rain(float _x, float _y) {
    location.x = _x;
    location.y = _y;
  }

  void run() {
    display();
    move();
  
  }     



 void applyForce(PVector force) {
    PVector f = PVector.div(force, mass); // taken from chapter 3 and TA's example. 
    acceleration.add(f);
  }

  void move() { //gives the rain its movement

    
    PVector wind = new PVector(7, 4);
    applyForce(wind);

    velocity.add(gravity);
    velocity.add(acceleration);
    
    location.add(velocity); 
    acceleration.mult(0);
    velocity.limit(5);    // makes sure the rain doesnt go too fast
   
   
  }

  void display() {
    noStroke();
    fill(0, 0, 255);

    ellipse(location.x, location.y, 5, 5);
  }
}


    
class Timer { 
   PVector location;
  
  Timer(){
   location = new PVector(width/2-50, height/2 -200);
  }
  void run(){
  fill(255);
  t++;
  if (t%70==0) {  // since the draw function happens so quickly. I made it so the timer goes down close to a second.
    if ( timer == 0) { // makes it so the timer doesnt go lower than 0;
    }

    else {
      timer--;
    }
  }
  textSize(32);
  if ( timer == 0) {
      
    textSize(50);  
      text("Times up!",location.x,location.y);
  }
  else if (timer<5){
    textSize(40); //size gets bigger as timer gets closer to 0. Shows  a sense of urgency.
    text("Time: "+timer,location.x,location.y);
  }
  else{
    text("Time: "+timer,location.x,location.y);
  }
  
  }
}

