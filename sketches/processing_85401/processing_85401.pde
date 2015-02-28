
/* Andre Blyth
 rule 1. Objects are created by a timer.
 rule 2. Collisions trigger events.
 rule 3. Mouse movement affects creation of objects.
 
 */

//vars
Base myBase;
//Target myTarget;
//Target[] tarArray;
ArrayList bullets;
ArrayList targets;
int counter, savecounter;
float beginX= random(width);
float beginY= random(height);
float endX= random(width);
float endY= random(height);
float distX, distY;
float exponent= 2;
float ex = 0.0;
float ey = 0.0;
float step = 0.01;
float pct = 0.0;
boolean dronehit;
//end vars

//set up
void setup() {

  counter=0;
  savecounter=0;
  size(600, 600);
  frameRate(60);
  smooth();
  background(0);
  dronehit = false;

  myBase = new Base (width/2, 550); //draws "Base" where bullets are fired from

  //myTarget = new Target (width/2, random(0,300)); //Target Creation

  bullets = new ArrayList(); //Bullet reference
  targets = new ArrayList(); //Targets

  //distance formula for drone
  distX = endX - beginX;
  distY = endY - beginY;
}
//end setup

//draw
void draw() {
  background(0); 

  //  Initiate Targets
  for (int i=frameCount; i<5; i++) {
    targets.add(new Target(random(25, 575), random(0, 450)));
  }

  //check for drone / target collision
  checkCollision2(ex, ey, targets);




  for (int i = bullets.size()-1; i>=0; i--)        // I got this code online for bullet creation.
  {
    Bullet bullet =(Bullet) bullets.get(i);
    checkCollision(bullet.xPos, bullet.yPos, targets);
  }

  for (int i=targets.size()-1; i>0; i--) {                // generate targets
    Target target = (Target) targets.get(i);               
    target.display();
    target.move();
  }

  //myTarget.display();

  myBase.display();                        // calls Base display.

  for (int i = bullets.size()-1; i>=0; i--)        // I got this code online for bullet creation.
  {
    Bullet bullet =(Bullet) bullets.get(i);
    bullet.movement();
    bullet.display();
  }

  //begin: create random objects once timer reaches certain milestones.
  // 50, 150, 350, 650, 1050, and 1550.
  if (counter>50) {
    ellipse(random(width), random(height), 50, 50);
  }

  if (counter>150) {
    ellipse(random(width), random(height), 10, 40);
  }

  if (counter>350) {
    ellipse(random(width), random(height), 60, 20);
  }

  if (counter>650) {
    triangle(random(width), random(height), random(width), random(height), random(width), random(height));
  }

  if (counter>1050) {
    triangle(random(width), random(height), random(width), random(height), random(width), random(height));
  }

  if (counter>1550) {
    fill(random(255), random(255), random(255));
  }
  //end timer variations

  //drone creation, repurposed code from: http://processing.org/learning/topics/movingoncurves.html
  pct += step;
  if (pct <1.0) {
    ex = beginX + (pct * distX);
    ey = beginY + (pow(pct, exponent) * distY);
  }
  fill(255, 0, 0);
  ellipse(ex, ey, 20, 20);
  fill(0);
  //end drone creation

  //what happens when drone collides with target
  //make random curves based upon mouseposition
  if (dronehit) {
    stroke(random(255), random(255), random(255));
    strokeWeight(10);
    curve(mouseX, mouseY, (mouseX-mouseY), (mouseY-mouseX), random(width), random(height), random(width), random(height));
    strokeWeight(1);
  }
  //end drone collision stuff
}
//end draw

//  Shoot
//  If Spacebar is pressed, fire bullet.
//  I put it herem because in the draw loop it wold fire a stream
//  until the key was released.
//
//  Drone
//  When Spacebar is pressed, drone flies to random location along a x^2 curve.
//
//  Save
//  When S key is hit, save .tif from current frame.
void keyPressed() {
  if (key == ' ') {
    bullets.add(new Bullet(myBase.xPosition, myBase.yPosition-30, 5, 5));

    pct=0.0;
    beginX = ex;
    beginY = ey;
    endX = random(width);
    endY = random(height);
    distX = endX - beginX;
    distY = endY - beginY;
  }

  if (key == 's' || key== 'S') {
    save("SecondSketch"+savecounter+".tif");
    savecounter++;
  }
}
//end keyPressed variables.


// collision check
//
// first collision check is for bullets against targets
// 
// second collision check is for drone against targets


void checkCollision( float x, float y, ArrayList targs) {


  for (int i=0; i<targs.size(); i++) {
    Target temptarg = (Target) targs.get(i);
    if ( dist (x, y, temptarg.txPos, temptarg.tyPos)< 10 +(temptarg.targSize/2)) {
      counter++;
      println(counter);
      background(random(255), random(255), random(255));
    }
  }
}

void checkCollision2( float x2, float y2, ArrayList targs2) {
  for (int i=0; i<targs2.size(); i++) {
    Target temptarg = (Target) targs2.get(i);
    if (dist (x2, y2, temptarg.txPos, temptarg.tyPos)<10 +(temptarg.targSize/2)) {
      println("BAM");
      dronehit = true;
    }
  }
}

//end collision check

//end sketch.


