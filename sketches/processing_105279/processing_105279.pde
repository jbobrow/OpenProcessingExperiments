
/*Doug Blase, 12/30/2012
Just a simple game that involves catching a series
of rain drops in a small bucket. Intended to be a quick
and easy game to play.

*/
//Create the bucket, and array of raindrops
Bucket buck = new Bucket();
RainDrop[] rain = new RainDrop[50];
//to allow for smooth left and right movement
boolean right = false;
boolean left = false;
void setup() {
  textAlign(CENTER);
  smooth();
  size(400, 500);
  //create the raindrops in the array
  for (int i = 0; i<rain.length;i++) {
    rain[i] = new RainDrop();
  }
}
//counters to keep track of the game's status
int dropsMissed = 0;
int dropsCaught = 0;
int gameState = 1;
void draw() {

  background (0);
  if (gameState==1) {
    fill(0, 150, 0);
    rect(0, 401, width, height-401);
    stroke(0);
    line((width/4), 401, (width/4), height);
    line((3*width/4), 401, (3*width/4), height);
    fill(255);
    text("LEFT", (width/4) - 50, 450);
    text("STAY", (2*width/4), 450);
    text("RIGHT", (3*width/4) + 50, 450);

    if (mouseY>400) {
      checkMouse();
    }
    buck.display();

    //check to see if the raindrops should display
    for (int i = 0; i<rain.length;i++) {
      if ((int)(millis()/1000) ==rain[i].timeToDisplay) {
        rain[i].makeRain();
      }
    }
    //keep drawing the raindrops and making them fall
    for (int i=0; i<rain.length;i++) {

      if (rain[i].falling) {
        rain[i].display();
        rain[i].fall();
      }
      //if the bucket is under the raindrop, call it a catch, otherwise, call a miss
      if (abs(rain[i].locationY - buck.locationY+35)<=5 && abs(rain[i].locationX - buck.locationX)<=35) {
        rain[i].caught();
        dropsCaught ++;
      }
      if (rain[i].locationY>400) {
        rain[i].miss();
        dropsMissed++;
      }
    }
    //allows for smooth movement of the bucket
    if (right) {
      buck.moveRight();
    }
    if (left) {
      buck.moveLeft();
    }

    fill(255);
    text("Rain drops caught: " + dropsCaught, 200, 15);
    //is the game over?
    if (dropsMissed + dropsCaught == 50) {
      gameState = 2;
    }
  }
  //display end of game text
  if (gameState == 2) {
    text("Congratulations! You caught " +dropsCaught+ " rain drops!", 200, 100);
    if (dropsCaught >=dropsMissed) {
      text("YOU WIN!", 200, 200);
    }
    else text("YOU LOSE!", 200, 200);
  }
}
//again, allows for smooth left and right movement
void keyPressed() {
  if (keyCode==RIGHT) {
    right = true;
  }

  if (keyCode==LEFT) {
    left = true;
  }
}

void keyReleased() {
  if (keyCode==RIGHT) {
    right = false;
  }

  if (keyCode==LEFT) {
    left = false;
  }
}

void checkMouse() {
  if ((int)mouseX> (int)(3*width/4)) {
    right = true;
    left = false;
  }
  if ((int)mouseX< (int)(width/4)) {
    left = true;
    right = false;
  }
  if ((int)mouseX>(int)(width/4) && (int)mouseX< (int)(3*width/4)) {
    left = false;
    right = false;
  }
}

class Bucket{
 //centers of the bucket(kinda)
  int locationX;
  int locationY;
  int speedChange;
  
  Bucket(){
    //puts the bucket at the center of the screen
   locationX = 200;
   locationY = 390;
   speedChange = 2;
   
  }
  
  void moveRight(){
    locationX += speedChange;
    //keep the bucket on the screen
    if (locationX> 366){
      locationX = 366;
    }
  }
  
  void moveLeft(){
    locationX -= speedChange;
    //keep the bucket on the screen
    if (locationX< 34){
      locationX = 34;
    }
    
  }
  
  void display(){
    fill(100);
    quad(locationX-35,locationY-35,
        locationX-30,locationY + 10,
        locationX + 30,locationY + 10,
        locationX + 35,locationY - 35);
   
    
   
  }
  
}
class RainDrop{
  int locationX;
  int locationY;
  boolean falling;
  int timeToDisplay;
  int fallingSpeed;
  
  
  RainDrop(){
    locationY = 5;
    locationX = (int)random(5,400);
    //bucket should not be falling
    falling = false;
    //when the bucket should fall
    timeToDisplay = (int)random(2,60);
    fallingSpeed = (int)random(2,5);
  }
  
  void display(){
    noStroke();
    fill(84,162,224);
    ellipse(locationX,locationY, 10,10);
    triangle(locationX-5,locationY,
             locationX,locationY-10,
             locationX + 5, locationY);
             
  }
  
  void fall(){
    locationY +=fallingSpeed;
  }
  
  void makeRain(){
    falling = true;
  }
 //these two methods put the drop off the screen 
  void caught(){
    
    fallingSpeed = 0;
    locationX = 999;
  }
  void miss(){
   fallingSpeed = 0;
  locationY = -100; 
  }
  
}


