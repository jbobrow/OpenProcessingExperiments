
/* AGGLO Game */

//Sorry about having all the code in one PDE, It wouldn't upload with seperate files

//------------------------------Begin Globals--------------------------------
float drawSize; //size being passed into the Circle Class while the circle is being drawn
float dropSize; //size being passed into the Circle Class after it has been dropped
float tempCoverage; //temp variable to pass into coverage
float coverage; //final percentage of coverage displayed on board

int numBullets = 1;//bullets and level counter
int lives = 3;
int numCircles = 0; //increments after every new level to add a new circle to the array

//array and objects
ExpandCircle drawCirc = new ExpandCircle(); //Class for circle that's drawn by the user
Bullet[] bullet = new Bullet[numBullets]; //array of bullet objects
Circle[] circle = new Circle[numCircles]; //array of Circles that drop after mouse is released

//passed into the instructions variable on certain events
String s1 = "Press and hold the mouse to create orbs. Cover 75% of the screen with orbs while avoiding the pink bullets to advance to the next level";
String s2 = "                   GAME OVER! \n\n               Press 'r' to restart.";
String s3 = "                       Careful!\n\n              You just lost a life!";
String s4 = "                       Great Job! " + " \n\n            I knew you had it in ya!";
String inst = s1;

boolean temp;
//------------------------------END Globals----------------------------------------



//--------------------------BEGINNING of Setup-------------------------------------
void setup() {
  size(500, 500);
  smooth();

  //initialize each bullet
  for (int i = 0; i < bullet.length; i++ ) {
    bullet[i] = new Bullet(width/2, height/2, 5, color(255, 0, 255));
  }
}
//--------------------------END of Setup-------------------------------------


//-------------------------------BEGINNING of draw-------------------------------
void draw() {
  background(110, 199, 255);
  fill(114, 136, 147);
  text(inst, width/2, height/2, 250, 150);

  //draw each bullet that is created by moving through my bullet array
  for (int i = 0; i < bullet.length; i++ ) {
    bullet[i].display();
    bullet[i].move();
    bullet[i].hit(); //------------still need to calculate when bullet hits a growing circle
    bullet[i].bounce(); //---------still need to calculate when bullet hits a dropped ball and bounces off
  }

  //Drop the circle to the bottom of the canvas
  for (int j = 0; j < circle.length; j++) {
    circle[j].drop();
    circle[j].gravity();
    circle[j].collide(); //--------still need to calculate when a ball falls on top of another so they pile up
    circle[j].display();
  }
  
 // if(click()) {
  drawCirc.seeCircle();
  drawCirc.expand();
  drawCirc.display();
 // }

  //--------START ScoreBoard
  score();
  fill(70);
  noStroke();
  rectMode(CENTER);
  rect(250, 15, width, 30);

  fill(255);
  text("Lives: ", 10, 20);
  text("Coverage: ", 130, 20);
  text("Level: ", 425, 20);
  fill(0, 255, 255);
  text(lives, 60, 20);
  text(coverage + " % of 75% completed", 200, 20);
  text(numBullets, 475, 20);
  //--------END ScoreBoard

  nextLevel();
  if (lives < 0) {
    background(110, 199, 255);
    fill(114, 136, 147);
    text(inst, width/2, height/2, 250, 150);
  }
}
//--------------------------------------END of Draw------------------------------------





//--------------------------BEGINNING OF CLASSES-------------------------------
//------"http://www.openprocessing.org/visuals/?visualID=21130"---------
class Bullet {

  //every new bullet will have these attributes
  float posX;
  float posY;
  float speedX;
  float speedY;
  float radius;
  color c;

  //Constructor
  Bullet(float posX, float posY, float radius, color c) {
    //store these values into the object
    this.posX = posX;
    this.posY = posY;
    this.radius = radius;
    this.speedX = round(random(-3, 3));
    this.speedY = round(random(-3, 3));
    this.c = c;
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(posX, posY, radius*2, radius*2);
  }

  void move() {
    posX += speedX;
    posY += speedY;

    //detect the width edges
    if (posX > (width - radius) || posX < radius) {
      speedX *= -1;
    }

    //detect the height edges and make space for score bar
    if (posY > (height - radius) || posY-30 < radius) {
      speedY *= -1;
    }
  }

  void hit() {
    float distance = dist(mouseX, mouseY, posX, posY);
    float minDist = drawCirc.drSize/2 + radius;
    if (mousePressed) {
      if (distance < minDist) {
        lifeCount();
      }
    }
  }

  //bullets will bounce off of dropped circles
  void bounce() {
    //loop through dropped balls array
    for (int n=0; n < numCircles; n++) {
      float distance = dist(posX, posY, circle[n].posX, circle[n].posY);
      if (distance < (radius + circle[n].dpSize/2)) {
        float angle = atan2(circle[n].posY - posY, circle[n].posX - posX);
        float targetX = posX + cos(angle) * (radius + circle[n].dpSize/2);
        float targetY = posY + sin(angle) * (radius + circle[n].dpSize/2);
        float ax = (targetX - circle[n].posX)*2;
        float ay = (targetY - circle[n].posY)*2;
        speedX -= ax;
        speedY -= ay;
        speedX = speedX*0.8;
        speedY = speedY*0.8;
      }
    }
  }
}

class ExpandCircle {
  color c;
  float locX;
  float locY;
  float drSize;
  int n;
  boolean touchCirc = false;

  void drawCirc(float locX, float locY, float drSize, color c) {
    this.locX = mouseX;
    this.locY = mouseY;
    this.c = color(255);
    this.drSize = drSize;
  }

  void seeCircle() {
    float distance;
    float minDistance;
    if (mousePressed) {

      if (circle.length != 0) {//only runs this section if a dropped ball object has been added to the array

        for (n = 0; n < numCircles; n++) {//[numCircles-1] array goes through every previously created circle
          distance = dist(mouseX, mouseY, circle[n].posX, circle[n].posY);//distance between drawn circle and ALL previously dropped circles
          minDistance = drSize/2 + circle[n].dpSize/2;

          if (distance < (minDistance)) {//this detects when a drawn circle and a dropped circle are touching
            drSize-=4;//shrinks at double the speed because expand() is continuously incrementing by 2 for each frame, this cancels it out! haha
          }
        }
      }
    }
  }

  void expand() {
    //the Circe will expand or contract based on its proximity to the canvas edge
    if (mousePressed) {
      if (mouseX+(drSize/2) > width || mouseX-(drSize/2) < 0 || mouseY+(drSize/2) > height || (mouseY-30)-(drSize /2) < 0) {
        drSize-=2; //size decreases when near the edge
      }

      else {
        drSize+=2;//size increases when away from the edge
      }
      dropSize = drSize; //Very Important! makes the new dropped circle the same size as the final frame of the expanded circle
    }
    else {
      drSize = 0;//sets the expanded circle back to zero for the next click
    }
  }

  void display() {
    ellipseMode(CENTER);
    fill(255);     
    noStroke();
    ellipse(mouseX, mouseY, drSize, drSize);
  }
}




class Circle {

  //These are the Circle attributes
  color c;
  float posX;
  float posY;
  float dpSize;
  float speedX = 0;
  float speedY = 0;
  float gravity = .15;

  Circle(float posX, float posY, float dpSize, color c) {
    this.c = c;
    this.posX = posX;
    this.posY = posY;
    this.dpSize = dpSize;
  }

  // balls sit on top of each other
  // CODE BORROWED HEAVILY FROM "http://processing.org/learning/topics/bouncybubbles.html"
  void collide() {
    for (int i = 0; i < circle.length; i++) {
      float dx = circle[i].posX - posX;
      float dy = circle[i].posY - posY;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = circle[i].dpSize/2 + dpSize/2;

      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = posX + cos(angle) * minDist;
        float targetY = posY + sin(angle) * minDist;
        float ax = (targetX - circle[i].posX)*.5;
        float ay = (targetY - circle[i].posY)*.5;
        speedX -= ax;
        speedY -= ay;
        circle[i].speedX += ax;
        circle[i].speedY += ay;
      }
    }
  }

  void gravity() {
    speedY += gravity; //velocity of object increases by gravity as it falls
  }

  void drop() {
    posY += speedY; //Add speed to y location
    posX += speedX; //Add speed to x location

    // Reverse speed when it hits bottom
    if (posY > height - dpSize/2) { //wont fall through floor
      speedY *= -.3; //moves away when it hits the bottom
      posY = height - dpSize/2;
    }
    else if (posY < 30 + dpSize/2) {//wont fall through roof
      speedY *= -.4;
      posY = 30 + dpSize/2;
    }

    if (posX > width - dpSize/2) {//wont fall right wall
      speedX *= -.4;//moves away when it hits a wall
      posX = width - dpSize/2;
    }
    else if (posX < 0 + dpSize/2) {//wont fall left wall
      speedX *= -.4;
      posX = 0 + dpSize/2;
    }
  }

  void display() {
    ellipseMode(CENTER);
    fill(255);     
    noStroke();
    ellipse(posX, posY, dpSize, dpSize);
  }
}

//-------------------------------------END OF CLASSES--------------------------------






//--------------------------------BEGINNING OF FUNCTIONS----------------------------------------



void mouseReleased() {
  Circle newCirc= new Circle(pmouseX, pmouseY, dropSize, color(255));
  circle = (Circle[]) append(circle, newCirc); //adds a new index to Circles array and populates it with a circle

  numCircles++; //used later to delete array objects on restart

  if (lives < 1) { //keeps level from incrementing after Game Over
    coverage = 0;
  }
  else
    coverage = round(coverage+tempCoverage); // updates the coverage counter with every new circle area
}

void nextLevel() {
  //only runs when 75% mark has been hit
  if (coverage >= 75) { 
    setup();

    //removes every object from the array
    for (int k = 0; k < numCircles; k++ ) {
      circle = (Circle[]) shorten(circle); //Shorten the array by one element
    }

    //Adds one more bullet to the array at the start of a level
    Bullet newBullet= new Bullet(width/2, height/2, 5, color(255, 0, 255));
    bullet = (Bullet[]) append(bullet, newBullet);//adds a new index to Bullets array and populates it with a new bullet of class Bullet
    
    inst = s4;
    lives++;
    numCircles = 0; //reset number of objects in circles array
    coverage = 0;//reset coverage counter
    numBullets++; //bullets increase with level, level counter increases
  }
}

//subtracts lives when a 'hit' is detected and initiates a 'Game Over' sequence
void lifeCount() {

  if (lives < 1) {
    inst = s2; //change instructions to prompt user to restart game
    drawCirc.drSize = 0;
  }
  else {
    drawCirc.drSize = 0;
    inst = s3;
    setup();
  }
  lives--;
}

//resets game after 'game over'
void keyPressed() {
  if(key == 'r') {
     //removes every object from the array
    for (int k = 0; k < numCircles; k++ ) {
      circle = (Circle[]) shorten(circle); //Shorten the array
    }
    for (int m = 0; m < numBullets-1; m++ ) {
      bullet = (Bullet[]) shorten(bullet); //Shorten the array
    }
    
    inst = s1;
    lives = 3;
    numCircles = 0; //reset number of objects in circles array
    coverage = 0;//reset coverage counter
    numBullets = 1; //reset bullets back to 1
    setup();
  }
}

//tracks area covered
void score() {
  float circlesArea;
  circlesArea = PI*(pow(drawCirc.drSize/2, 2)); //calls in the previous size of the drawn circle to calculate circle area
  tempCoverage = (((circlesArea) * 100) / (width*height-30)); //finds percentage of area covered
}


