

/* COMP1720 2014 Change Project
* Patrick Clarkson U5333265
* Standard Spec
*/

// Our objects.
Cloud cloud;
Mob mob;
Slime player;
// Image elements (edited in Photoshop).
PImage sun; PImage rainbow;

// Stuff for slimeballs and detection from Shiffman eg 10-10.
Catcher catcher;
Timer timer;
Drop[] drops;
int totalDrops = 0;

// Other global parameters.
boolean spawnSlime; // Should we be raining slime?
int currentScreen; // Used to change scene.
boolean restarted; // Check if we need to reset game variables.
int pB = 0; // Color for the planet's surface across states 2 and 3.
boolean jiggleDMG = false; // Shake the red border when damaged.
boolean contact = false; // Did the mob hit us?
 
void setup() {
  size(800, 600);
  textFont(createFont("Arial",30)); // Prepare our text.
  smooth();
  frameRate(32);
    
    // Set up the game objects.
  sun = loadImage("sun.png");
  rainbow = loadImage("rainbow.png");
  mob = new Mob(20, 480);
  cloud = new Cloud(120, 100); // Cloud starts with no rain.
  player = new Slime(400, 480, 1); // Start with a dangerously low health!
  particles = new ArrayList(); // Click the cloud to see rain.
  
  // Following are thanks to Daniel Shiffman eg 10-10
  catcher = new Catcher(50); // Create the catcher with a radius of 50
  drops = new Drop[1000];    // Create 1000 spots in the array
  timer = new Timer(300);   // Create a timer that goes off every 2 seconds
  timer.start();             // Starting the timer
}
 
void draw() {
  textAlign(CENTER); // Keep all our text centered.
  
  // Idea / code for frame changing was adapted from: http://amnonp5.wordpress.com/2012/01/28/25-life-saving-tips-for-processing/
  switch(currentScreen) {
      case 0: sZero(); break;
      case 1: sOne(); break;
      case 2: sTwo(); break;
      case 3: sThree(); break;
      case 4: sFour(); break;
      case 5: sFive(); break;
      default: background(0); break;
      }
      
   // Daniel Shiffman Example 10-10 Rain Catcher Game code
   // Very heavily adapted by me.
if(spawnSlime){
        // Only run the catcher in the game state.
    if(currentScreen == 3){
        catcher.setLocation(pX,slimeY); // Set to our slime character instead.
        catcher.display(); // Still run the display class for hitbox size.
    }      
            // Only when we flicker the spawnSlime boolean.
                      // Check the timer
                      if (timer.isFinished()) {
                        // Initialize one slimeball.
                        drops[totalDrops] = new Drop();
                        ++totalDrops;
                        // If we hit the end of the array
                        if (totalDrops >= drops.length) {
                          totalDrops = 0; // Start over
                        }
                        timer.start();
                      }
    
          // Move and display all slime all the time!
          for (int i = 0; i < totalDrops; i++ ) {
            drops[i].move();
            drops[i].display();
            if (catcher.intersect(drops[i])) {
              drops[i].caught();
            }
          }
    } // Stop spawning slime when turned off.
    
    // Use constrain to stop variables evolving too far.
    player.mouthH = constrain(player.mouthH, 8, 20);
    player.mouthW = constrain(player.mouthW, 12, 25);
    player.xSpeed = constrain(player.xSpeed, 4, 23); // Don't get out of control.
}

// Find out if we are moused over the intro circle.
boolean clickCirc(float tmpX, float tmpY, float cD) {
    return (dist(mouseX, mouseY, tmpX, tmpY) < cD*0.5); }
    
// Draw and jiggle the damage warning throughout game states.
   void dmg(boolean jiggleDMG) {
      // Bump it around a lot.
      int z = (int)random(-10,10);
          if(jiggleDMG){
              noStroke();fill(255,0,0);
                         beginShape(); // No need for confusing layering, directly draw the window shape.
                  vertex(0+z,0+z);vertex(800+z,0+z);vertex(800+z, 600+z);vertex(0+z, 600+z);
                  vertex(0+z, 0+z);vertex(50+z, 0+z);vertex(50+z, 550+z);vertex(750+z, 550+z);
                  vertex(750+z, 50+z);vertex(50+z,50+z);
                         endShape(CLOSE); 
               }
    }

// Call our scene graphics and methods.
void sZero() { drawS0(); }
 
void sOne() { drawS1(); }
 
void sTwo() { drawS2(); }

void sThree() { drawS3(); }
  
void sFour() { drawS4(); }

void sFive() { drawS5(); }

// Set our vars to default.
void reset(){ 
    x = 10; // Monster spawn location.
    pX = 400; slimeY = 480; 
    player.score = 1; player.xSpeed = 4;
    spawnSlime = false;
    victory = false;
    }
    

// Methods for mouse clicks need to be here to access 'global' methods.
void mousePressed() {
  if(currentScreen == 0){ // The initial state.
              // Press the red button...
          if(clickCirc(redBtnX, redBtnY, 30)) {
            jiggleDMG = !jiggleDMG;
          }
            
            // Restart scintillating pixels with the blue button!
          if (clickCirc(blueBtnX, blueBtnY, 40)) {
            delta = 0;
            restart = !restart;
          }
          
          // Registering a click on the green circle.
          if (clickCirc(introX, introY, diam)) { 
              currentScreen = 1;
          }
    }
    
    if(currentScreen == 1){ // Traverse the options menu.
            // Do you want bonus mode on?!
          if (clickCirc(250, 450, 45)) {
            bonusMode = !bonusMode;
          }
           
          if (clickCirc(btnX, btnY, 55)) { // Button press to hear the warning.
            showBtn2 = true; }
            
          if(showBtn2){ // Hide from clicking until shown.
              if (clickCirc(btnX2, btnY2, 55)) { // Continue if you're ready..
                showBtn3 = true; showBtn2 = false; }
          }
          if(showBtn3){ // Begin the game.
              if (clickCirc(menuBallX, menuBallY, 80)) {
                currentScreen++; }
          }
    }
    
        // Clicking on the top left corner in sTwo will flip to night.
    if(currentScreen == 2){
          if(mouseX < 120 && mouseY < 120) {
              sunClick = !sunClick; // Flip the change on and off.
          }
          pB = (pB+25) % 255; // Change the ground colour.
          rainGrow += 5; // Grow the rainbow size every click.
          
            // Click the door to continue.
          if (clickCirc(600, 420, 70)) {
                currentScreen = 3;
          }
    
            // Hard-code a click on the stationary monster.
          if (clickCirc(200, 480, 25+grow)) {
            grow += 2;
          }
                
           // Register a mouseclick on the moving cloud.
        if (mouseX < (cx+80) && mouseX > (cx-80) && (mouseY < (cy+60) && mouseY > (cy-60)) ) {
              noRain = !noRain; // Toggle on and off.
          }
    }
    
      // The interactive game-state!
    if(currentScreen == 3) {
      // Register a click on the door to go back a stage.
          if (clickCirc(145,90,50)) {
                currentScreen = 2;
          }
          
       // When you've earnt the ability to proceed out of the game.
          if (clickCirc(400,250,80)) {
                reset(); // Your score doesn't carry over through replays.
                currentScreen = 4;
          }
    }
    if(currentScreen == 4) {
      // Play again!
          if (clickCirc(400,350,50)) {
                victory = true; // Reset stats.
                currentScreen = 0;
          }
    }
    if(currentScreen == 5){
          if(clickCirc(400, 525, 80)) {
              currentScreen = 0;  // Click the respawn button to restart!
              reset(); // Start over.
              jiggleDMG = true; // Start with the ouch message!
          }
    }
} // End of mouseclicked.

void keyPressed() {
  if(currentScreen == 0){
          if(key != ' '){
             jiggleDMG = !jiggleDMG; // Shake the red damage detected border.
          } else {
            spawnSlime = !spawnSlime; // Spawn slime on spacebar press!
          }
  }
  
  // Press keys to shake the hp damage.
   if (currentScreen == 1 || currentScreen == 2){
      if(key == 'd' || key == ENTER || key == ' '){
        jiggleDMG = !jiggleDMG;
      }
  }
  
  // Change the planet surface colour on any button than spacebar.
  if(currentScreen == 2 || currentScreen == 3){
      if(key != ' '){
        pB = (pB + 25) % 255; 
      }
  }
      
  }// End of keyboard intake.


// These are needed to affect the user's character.
int mouthH; int mouthW; // Player character mouth to grow.
int score; // Player health and scoreboard tracker.
boolean backward; // Used to monitor which way the art faces for left and right movement.
int pX; int slimeY; // Need to be out here for interaction with platform.

class Slime {
  int mouthH; int mouthW; // Grow mouth size and gain speed when you eat slimeballs.
  int hp; int score; int xSpeed;
  Slime(int tmpX, int tmpY, int score){
        pX = tmpX; slimeY = tmpY;
        mouthH = 8; // Player character mouth to grow.
        mouthW = 12;
        xSpeed = 3; // Your side-scrolling speed increases!
        hp = score;
   }
         // Slime character GFX.
  void display() {
    // Need a boolean to see which way we are facing! Adjusted every left/right arrow-press.
    if(!backward){
          noStroke(); fill(0,205+score*2,0);
          beginShape();
          vertex(pX-20, slimeY-50);vertex(pX+20, slimeY-43);vertex(pX+20, slimeY+20);vertex(pX-15, slimeY+10);
          endShape(CLOSE);
          noStroke(); fill(0,80+score*2,0);
          beginShape();vertex(pX-20, slimeY-50);vertex(pX, slimeY-55);vertex(pX+32, slimeY-48);vertex(pX+29, slimeY+10);vertex(pX+20, slimeY+20);vertex(pX+20, slimeY-43);
          endShape(CLOSE);
      // Eyes.
              ellipseMode(CENTER);
          noStroke();fill(255);ellipse(pX-9,slimeY-27,8,12);
          noStroke();fill(255);ellipse(pX+8,slimeY-24,10,15);
          noStroke();fill(0);ellipse(pX-9,slimeY-26,4,6);
          noStroke();fill(0);ellipse(pX+8,slimeY-23,5,7);
      // Mouth ready for easy size growing.
          noStroke();fill(0);ellipse(pX,slimeY-5,mouthW,mouthH);
          noStroke();fill(0,205+score*2,0);
          rectMode(CORNERS);rect(pX-16,slimeY-15,pX+18,slimeY-5);
    } else {
          noStroke(); fill(0,205+score*2,0);
          beginShape();
          vertex(pX+20, slimeY-50);vertex(pX-20, slimeY-43);vertex(pX-20, slimeY+20);vertex(pX+15, slimeY+10);
          endShape(CLOSE);
          noStroke(); fill(0,80+score*2,0);
          beginShape();vertex(pX+20, slimeY-50);vertex(pX, slimeY-55);vertex(pX-32, slimeY-48);vertex(pX-29, slimeY+10);vertex(pX-20, slimeY+20);vertex(pX-20, slimeY-43);
          endShape(CLOSE);
              ellipseMode(CENTER);
          noStroke();fill(255);ellipse(pX+9,slimeY-27,8,12);
          noStroke();fill(255);ellipse(pX-8,slimeY-24,10,15);
          noStroke();fill(0);ellipse(pX+9,slimeY-26,4,6);
          noStroke();fill(0);ellipse(pX-8,slimeY-23,5,7);
          noStroke();fill(0);ellipse(pX,slimeY-5,mouthW,mouthH);
          noStroke();fill(0,205+score*2,0);
          rectMode(CORNERS);rect(pX+16,slimeY-15,pX-18,slimeY-5);
    }
  }
  
  void move() {
    xSpeed = xSpeed + (score/15); // Rapid evolution still!
    
    // Keep player in bounds and turn around.
    if(pX <= 0){ 
         pX = 15; }
    if(pX >= 800){ 
         pX = 785; }
         
    // Movement using the keyboard.
    if (keyCode == LEFT || key == 'a') {
               backward = false;
               pX = pX - xSpeed; 
           } else if (keyCode == RIGHT || key == 'd') {
               backward = true;
               pX = pX + xSpeed; 
             }
    if (keyCode == UP || key == 'w') {
               slimeY = 390;
    } else if (keyCode == DOWN || key == 's') {
               slimeY = 480;
         }
  }
  
  // Detect when we eat a slimeball.
  void eat() {
    if(caughtSlime) {
      score++;
      caughtSlime = false;  // Be sure to reset.
      mouthH++; mouthW++; // Evolve slime mouth size.
      }
  }
    
}// End of Slime class.


// Monster class and variables.
int x; int y;int slide = 3; boolean reverse;
class Mob {
  public Mob(int mobx, int moby){
    x = mobx;
    y = moby;
  }
  // Draw the monster.
  void create(){
        if(reverse){
             noStroke();fill(214);
            ellipse(x-4,y-13,9,14);ellipse(x+5,y-13,8,12);
            fill(0);
            ellipse(x-3,y-15,3,3);ellipse(x+6,y-15,4,4);
            stroke(0);fill(150);
            triangle(x+20,y-10,x-20,y+10,x+20,y+10);
            // Top jaw
            beginShape();
                vertex(x+20, y-10);vertex(x-20, y-14);vertex(x+20, y+10);
                endShape(CLOSE);
      } else {
        noStroke();fill(214);
        ellipse(x-10,y-13,9,14);ellipse(x-2,y-13,8,12);
        fill(0);
        ellipse(x-9,y-15,4,4);ellipse(x+1,y-15,3,3);
        stroke(0);fill(150);
        triangle(x-20,y-10,x+20,y+10,x-20,y+10);
        // Top jaw
        beginShape();
            vertex(x-20, y-10);vertex(x+20, y-14);vertex(x-20, y+10);
            endShape(CLOSE);
      }
}
  // Move across the screen.
  void patrol(){
   x = x + slide; 
  if((x > 750) || (x < 40)){ 
      slide = slide * -1;
      if(!reverse) { reverse = true; } else { reverse = false; }
     }
  }
  
  void detect(){
    if(x > (pX-10) && x < (pX+10) && slimeY == 480){
        contact = true; } // Switched off later.
  }
  
} // End of mob class.

// Cloud class below.
int cx; int cy;int drift = 2;
class Cloud {
  public Cloud(int tmpx, int tmpy){
    cx = tmpx;  cy = tmpy;
  }
  
  void show(){
    if(noRain){
         ellipseMode(CENTER);noStroke();fill(255);
            ellipse(cx,cy,80,40);ellipse(cx+30,cy+10,50,20);
            ellipse(cx-40,cy,20,20);ellipse(cx-15,cy-15,35,20);
            ellipse(cx-30,cy+5,60,25);
            ellipse(cx+30,cy-20,40,20);ellipse(cx-30,cy+10,70,35);
            ellipse(cx-10,cy-30,60,30);ellipse(cx-40,cy-15,60,25);
            ellipse(cx+40,cy+10,50,20);ellipse(cx+35,cy+10,40,15);
      } else {
            noStroke();fill(150);
            ellipse(cx,cy,80,40);ellipse(cx+30,cy+10,50,20);
            ellipse(cx-40,cy,20,20);ellipse(cx-15,cy-15,35,20);
            ellipse(cx-30,cy+5,60,25);
            ellipse(cx+30,cy-20,40,20);ellipse(cx-30,cy+10,70,35);
            ellipse(cx-10,cy-30,60,30);ellipse(cx-40,cy-15,60,25);
            ellipse(cx+40,cy+10,50,20);ellipse(cx+35,cy+10,40,15);
      }
}
  // Move across the screen.
  void push(){
      if(bonusMode) { drift = 6; } 
        else { drift = 2; } // Will run before we move the cloud.
   
   cx = (cx + drift) % width;
      }
  } // End of Cloud
  
  
  // Example 23-2: Simple particle system with ArrayList
  // Used for the cloud rain, edited by me.
class Particle {
  float x;float y;
  float xspeed;float yspeed;
  
  Particle() {
    x = (cx+10); y = cy; // Spawn at the center of the cloud.
    xspeed = random(0,3);
    yspeed = random(-2,0);
  }
  
  void run() { x = x + xspeed; y = y + yspeed; }
  
  void grav() { yspeed += 0.1; }
  
  void rain() {
    noStroke();fill(0,0,255);ellipse(x,y,8,8);
  }
}
    // Daniel Shiffman http://www.learningprocessing.com
    // Example 10-10: The raindrop catching game - adapted to become my slimeball exp game.
    
    // Patrick Clarkson 2014
    
    // Catcher class adapted by me. My edits are all commented lines.
class Catcher {
  float r; float x,y;
  Catcher(float tempR) {
    r = tempR; x = 0;  y = 0; }
  
  void setLocation(float tempX, float tempY) {
    x = tempX; y = tempY;
  }
  
  void display() {
    noStroke();fill(0,0); // Make the catcher transparent instead.
    ellipse(x,y,80,80); // Positioned on top of player coords elsewhere.
  }
  
  // Intercept the slimeball as it falls!
  // Unedited method from Daniel Shiffman Example 10-10.
  boolean intersect(Drop d) {
    float distance = dist(x,y,d.x,d.y);
    if (distance < r + d.r) { 
      return true;
      } else { return false; }
  }
}


      // Learning Processing-Daniel Shiffman http://www.learningprocessing.com
      // Example 10-10: The raindrop catching game - all comments are additions by me.
boolean caughtSlime = false; // Addition by me.
class Drop {
  float x,y;  float speed;  color c;
  float r; // Used in the catcher method.
  int s; // Speed of slimeball
  int i; // Grow y height to make it appear as if it's dripping.

  Drop() {
    x = random(width);
    y -= 11;
    speed = (int) random(1,4);
    c = color(0,255,0);
    r = 9; // Size of slimeball.
  }

  void move() {
    if(bonusMode){
        s = (int) random(3,6);
    } else if(currentScreen == 5){
             s = 0; // Set speed to zero.
    } else { s = (int) random(1,4); } // Reset to default
    
    if (y > 480) { 
        speed = 0; // Stop where we call the floor.
    } else { y += speed; }
  }
  
  // Edited to become a slimeball!
  void display() {
       if (bonusMode) { // Randomly colour the slime.
            fill((int)random(255),200,(int)random(255));
            stroke((int)random(255),200,(int)random(255));
            ellipse(x,y,r+3,r+3);
          } else if (currentScreen == 5) { // The respawn screen still rains a new slime...
            fill(255,0,0); // Blood red for death state.
            stroke(255,0,0);
            i+=3;
            ellipse(x,y,r+30,40+i); // Increment the y height to make them drip.
      } else { 
          fill(0,255,0); stroke(0);
          ellipse(x,y,r,r); // Normal slimeball.
       }
}
  
  // If the slimeball is caught (Daniel Shiffman Example 10-10).
  void caught() {
    speed = 0; y -= 1000;
    caughtSlime = !caughtSlime; // Flip the boolean to trigger score increment.
  }
}




// Daniel Shiffman Example 10-5: Object-oriented timer unedited. This is used for the "unable to fire laser" msg.
// This was included in eg 10-10 code.
class Timer {
    int savedTime; // When Timer started
    int totalTime; // How long Timer should last
  Timer(int tempTotalTime) {
      totalTime = tempTotalTime;
  }
  // Starting the timer
  void start() {savedTime = millis(); //milliseconds.
      }

  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {return false;}
  }
}
void drawS5(){
  bonusMode = false; // Show the red dripping ...slime instead.
  spawnSlime = true; // Show the slime drips.
  background(0);
  // Respawn button takes you back to screen zero.
  fill(255);noStroke();rectMode(CENTER);rect(400,525,110,70);
  textSize(18);fill(0);text("RESPAWN",400,525);
  
  
  textSize(26);fill(255);text("OH NO!",400,75); // You've died..
  
  // Our playable character is jumbled.
       noStroke(); fill(0,170,0);
          beginShape();
          vertex(380, 250);vertex(420, 267);vertex(420, 320);vertex(385, 310);
          endShape(CLOSE);
          noStroke(); fill(0,170,0);
          beginShape();vertex(380, 250);vertex(400, 345);vertex(432, 352);vertex(429, 310);vertex(420, 320);vertex(420, 457);
          endShape(CLOSE);
       ellipseMode(CENTER);
          noStroke();fill(255);ellipse(391,273,12,16);
          noStroke();fill(255);ellipse(408,376,12,17);
          noStroke();fill(0);ellipse(400,395,mouthW,mouthH);
          noStroke();fill(0,170,0);
          rectMode(CORNERS);rect(384,375,418,395);
          
}
void drawS4(){
  background(0);
rectMode(CORNERS);noStroke();fill(0);
  rect(0,0,50,600);rect(0,0,800,200);rect(750,0,800,600);rect(0,550,800,600);
  
  fill(255);text("YOU WON!",400,100);
  fill(0,255,0);text("How did you collect all that slime...",400,300);
  fill(255,0,0);text("MIGHT AS WELL PLAY AGAIN",400,500);
  
// Reset game variables when we reach this frame.
reset();

    // Back to start of the experience.
rectMode(CENTER);
stroke(0);fill(255,0,0);rect(400,350,30,30);
}

// Global variables for cross-class access.

boolean bonusMode; // Toggle the bonus mode on and off.
// Menu buttons
int btnX = 400; int btnY = 500;
int btnX2 = 400; int btnY2 = 420;
int menuBallX = 400; int menuBallY = 340;
// Which button press is next?
boolean showBtn2 = false;
boolean showBtn3 = false;
 
void drawS1() {
  background(255);
    // Framing.
rectMode(CORNERS);noStroke();fill(0,0,230);
  rect(0,0,50,600);rect(0,0,800,200);rect(750,0,800,600);rect(0,550,800,600);
  
if(!bonusMode) {
      fill(0);textSize(16);text("Bonus mode?",190,500);
   rectMode(CENTER);
      stroke(0);fill(255,255,0);rect(250,450,50,35);
    spawnSlime = false;
  } else {
    fill(random(255),random(255),0);textSize(22);text("BONUS MODE!!",170,510);
 rectMode(CENTER); // Needed here to stop a bug.
    stroke(0);fill(255,255,0);rect(248,450,52,37);
    spawnSlime = true;
  }
  
  // Fun menu screen interaction.
stroke(0);fill(0,200,170);rect(400,90,400,50);
        if(!showBtn2 && !showBtn3){ // Delete we start activating them.
          stroke(0);fill(0,255,0);rect(btnX,btnY,60,40);
           noStroke();fill(0);textSize(18);text("A great danger awaits you...",400,95);
          }
         if(showBtn2){
           stroke(0);fill(0,255,0);rect(btnX2,btnY2,60,40);
           noStroke();fill(0);textSize(18);text("You'll need to evolve by collecting slime.",400,95);
         }
         if(showBtn3){
           stroke(0);fill(0);textSize(18);text("GOOD LUCK YOU'LL NEED IT -",400,95);
           fill(0,255,0);ellipse(menuBallX, menuBallY, 80, 80); // Draw the moving green ball.
         }
         
  dmg(jiggleDMG); // Show the damage over the top.
  if(jiggleDMG){
    fill(255,0,0);text("LEARN NOT TO DO THAT!",320,400);
  }
  

  
 }
// Variables needed outside this page.
boolean blinker; // Flicker on and off using frameCount.
int time = -3000; // Lasts 3 seconds.
boolean victory = false;

void drawS3() {
  // When we reach the gamestate we need to adjust stats.
  if(restarted){
      player.score = 1;
      player.xSpeed = 4;
      slimeY = 480;
      pX = 400;
  }
  background(255);
  // Draw our floor.
  fill(90);noStroke();rectMode(CORNERS);rect(0,450,800,600);
  
  // Door to return to previous screen on the colour changing planet.
  ellipseMode(CENTER);noStroke();fill(0,0,pB);ellipse(110,160,150,150);
  strokeWeight(2);stroke(69,44,5);fill(102,64,2);
  rectMode(CENTER);rect(150,90,25,50);strokeWeight(1);
  noStroke();fill(190);ellipse(156,87,3,3);

  // Then draw everything else.
  mob.patrol();
  mob.create();
  mob.detect(); // Check if we are overlapping the player.
 // Including the player's slime character.
  player.move();
  player.display();
  player.eat();
  
  // Use frameCount to blink text.
   if (frameCount % 20 == 0) { blinker = !blinker; }
   if (blinker) {
       if(player.score < 20) { // Cannot use the attack move yet.
          textSize(20);fill(0);stroke(0);
          text("INSUFFICIENT SLIME TO POWER LASER",400,150);
        }
    }
        
    if(key == ' '){ 
      if (player.score >= 20) {
            fill(200,0,0); stroke(255,0,0);
              if(!backward){
                  // Call a method to check if we've lasered the monster!
                  if( (pX - x) > 0 && (pX - x) < 150 ) { // Check the distance between the player and the monster upon firing.
                        slide = 0;
                        x = -3000; }
                  triangle(pX+2,slimeY,pX-150,slimeY+20,pX-150,slimeY-30);
              } else {
                  // Monster must be to the right of the player to die.
                  if( (pX - x) < 0 && (pX - x) > -150 ) { // Player coord minus the mob coord should be negative.
                        slide = 0;
                        x = -3000; }
                  triangle(pX-2,slimeY,pX+150,slimeY+20,pX+150,slimeY-30);
              }
        }
     }
        
   if(contact){
          jiggleDMG = true;
          player.score--; // Lower the players health.
          player.xSpeed -= 2; // Deduct 2 speed as well!
          contact = false; // Flick it off right away.
      } else { jiggleDMG = false; } // Turn off the red border.
      
   spawnSlime = true; // Start raining experience!
   
   dmg(jiggleDMG); // Damage indicator underneath scoreboard!
   // Scoreboard over the top.
   stroke(0,255,0);fill(230);rectMode(CENTER);rect(400,550,150,50);
        textSize(22);fill(0);
        textAlign(CENTER);text("-- "+player.score+" --",400,560);
        
   // If you die, you get the choice to start over!
   if(player.score <= -5){
     currentScreen = 5; }
   else if(player.score > 21){
     victory = true; } // Advance when you're good and ready.
     
   if(victory){
     stroke(random(255));fill(0,255,0);
     rectMode(CENTER);rect(400,250,150,50);
   }
} 

// Variables for interaction and change!

int spin = 0; int angle = 1; // The Sun is spinning.
boolean sunClick; // Switch the background scene.
int rainGrow; // How big is the rainbow?
boolean noRain = true; // Boolean for the cloud click.
ArrayList particles; // Shiffman eg 23-2 : Particles of rain.
void drawS2() {
  background(180);
  // Draw the growing rainbow underneath everything else.
      if(!noRain) {
           rainbow.resize(600+rainGrow, 0); // Grow the size!
           tint(255, 190); // Change it's transparency when its not raining.
           image(rainbow,550-rainGrow,400-rainGrow);
       } else { 
           rainbow.resize(600+rainGrow, 0);
           tint(255, 0);
           image(rainbow,(550-rainGrow),(400-rainGrow));
       }
       
       
           // Spin our sun shape and text.
      spin = (spin + 1) % 360;
  // Draw the planet surface.
  fill(0,0,pB);ellipse(400, 700, 1300, 500);
  
  // Draw and rotate sun.
    tint(255, 255);
    pushMatrix();
   translate(-50,-50);rotate(spin);
   image(sun,-130,-130);
    popMatrix();

// We need a whole new draw call and codeblock if we've clicked the sun.
  if(sunClick){
    background(30);
          // We also draw the rainbow at night, in the right conditions.
      if(!noRain) {
           rainbow.resize(600+rainGrow, 0); // Grow the size!
           tint(255, 190); // Change it's transparency when its not raining.
           image(rainbow,550-rainGrow,400-rainGrow);
       } else { 
           rainbow.resize(600+rainGrow, 0);
           tint(255, 0);
           image(rainbow,(550-rainGrow),(400-rainGrow));
       }
    fill(0,0,pB);ellipse(400, 700, 1300, 500);
    fill(190);ellipse(-20,-10,300,300); // Draw a moon instead.
   }
   
  mob(200,480); // Clickable monster in state 1.
  // Door to exit state 1.
  strokeWeight(2);stroke(69,44,5);
  fill(102,64,2);rectMode(CENTER);rect(600,420,50,100);strokeWeight(1);
  noStroke();fill(190);ellipse(613,415,7,7);
  
  // Draw the rain of the cloud underneath it. 
  // Thanks to Daniel Shiffman Example 23-2. Edited by me to become rain.
  if(!noRain){
      particles.add(new Particle());
        for (int i = 0; i < particles.size(); i++ ) { 
          Particle p = (Particle) particles.get(i);
          p.run();  p.grav();  p.rain();
            }
   // If the ArrayList has more than 100 elements in it, we delete the first element, using remove().
        if (particles.size() > 100) {
          particles.remove(0); }
          
      }
      cloud.show(); // Clickable cloud on top of everything.
      cloud.push();
      
  if (millis() > 30000) { // Show a message after 30seconds has elapsed.
    fill(0);text("ARE YOU HAVING FUN YET?!",400,250);
  }
  
  dmg(jiggleDMG); // Re-use again on this scene.
  if(jiggleDMG){
    fill(255,0,0);text("GET READY FOR BATTLE",320,350);
  }
  
}
  // Introductory version to the monster which you can click on.
int grow = 0;
void mob(int sizeX, int sizeY){
  x = sizeX; y = sizeY;
     noStroke();fill(214);
     ellipse(x-10-grow,y-13-grow,9+grow,14+grow);
     ellipse(x-2+grow,y-13-grow,8+grow,12+grow);
     fill(0);ellipse(x-9-grow,y-15-grow,4+grow,4+grow);
     ellipse(x+1+grow,y-15-grow,3+grow,3+grow);
     stroke(0);fill(150);
     triangle(x-20-grow,y-10-grow,x+20+grow,y+10+grow,x-20-grow,y+10+grow);
        beginShape();
     vertex(x-20-grow, y-10-grow);vertex(x+20+grow, y-14-grow);
     vertex(x-20-grow, y+10+grow);
        endShape(CLOSE);
}


// Variables for access in mousePressed.
// Details for the 'click to begin' circle.
float introX = 400;float introY = 300;float diam = 30;
// An intriguing button in the intro state.
float redBtnX = 700; float redBtnY = 500;
// Reset the awesome intro flashiness.
float blueBtnX = 400; float blueBtnY = 300;

boolean restart; // Restart the colour choice of scintillating pixels.
int delta = 0; // Used in the colourful loading screen.

void drawS0(){
  /* Scintillating pixels example code edited by me.
      Dr Tim Brook February 2007 - Edited Henry Gardner August 2013. */
  for (int x = 0 ; x < width ; x = x + 1) {
    for (int y = 0 ; y < height ; y = y + 1) {
      set(x, y, color((x-y - delta*2) % 255, (x+y + 3*delta) % 255, 
      (x+y - 3*delta) % 255, delta/10 % 255)) ;
              }
      } delta += 5;
  
  // Hide some of the animated background.
rectMode(CORNERS);noStroke();fill(0);
  rect(0,0,50,600);rect(0,0,800,200);rect(750,0,800,600);rect(0,550,800,600);
  
  
  fill(255);text("Click the green circle to begin!",400,100); // Instructions.
  fill(0,255,0);ellipse(introX, introY, diam, diam); // Draw the moving green ball.
  // Tempting button.
rectMode(CENTER);
  stroke(0);fill(255,0,0);rect(redBtnX,redBtnY,30,30);
  
  // Change the button on and off when clicked.
  if(!restart){ 
    stroke(255);fill(0,27,255);rect(blueBtnX,blueBtnY,30,30);
      } else {
        stroke(0);fill(0,27,255);rect(blueBtnX,blueBtnY,36,36);
  }
  
  dmg(jiggleDMG); // Show the red damage warning if triggered.
  if(jiggleDMG){
    fill(255,0,0);text("OUCH!",360,400);
  }

  // Keep the shaking intro circle inside the bounds.
      if(introX < 800 && introY < 600) {
          introX = introX + random(-7,7); 
          introY = introY + random(-7,7); 
      } else { introX = 400; introY = 300; }
    
}



