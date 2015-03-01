
//Swarm Hw

//REFERENCES:
//Processing.org/examples/flocking.html -- Daniel Shiffman
//byrodrigo.wordpress.com -- Rodrigo Trevino Saenz

Pig[] pigs = new Pig[200];

void setup() {
  size(900, 900);

  //Initialize pig array
  for (int i=0; i<pigs.length; i++) {
    pigs[i] = new Pig();
  }
}

void draw() {
  background(0, 220, 255);

  /*
  //Thanks Daniel! -- http://www.openprocessing.org/sketch/167099
  for (int i=0; i<pigs.length; i++){
    for (int j=i; j<pigs.length; j++){
      //check collisions yo
      if (pigs[i].isCollidingWith(pigs[j])){
        pigs[i].bounceWith(pigs[j]);
      }
    }
  }
  */

  //Call the movement function
  for (int i=0; i<pigs.length; i++) {
    pigs[i].pigMover();
  }
}

void mouseClicked() {
  //set new target position
  for (int i=0; i<pigs.length; i++) {
    //pigs[i].setTargetPos(int(random(0, width)), int(random(0, height)));
    pigs[i].setTargetPos(mouseX, mouseY);
  }
}

class Pig {

  //Pig position, velocity, acceleration.
  PVector pigPos, pigVel, pigAccel;

  //Pig target pigPos.
  PVector targetPos;

  //Pig starting coordinates.
  int startX, startY;

  //Pig size.
  int pigSize;

  Pig() {
    //Draw Pig
    
      //PigSize
    pigSize = 50;
    //x and y temporary start positions
    startX = round(random(pigSize, width-pigSize));
    startY = round(random(pigSize, height-pigSize));
    //Position vector
    pigPos = new PVector (startX, startY, 0);
    //Initial velocity
    pigVel = new PVector (0, 0, 0);
    //Initial acceleration
    pigAccel = new PVector (0, 0, 0);

    //Target position--starts at center
    targetPos = new PVector(width/2, height/2, 0);

    //Wings
    fill(255);
    noStroke();
    //left limb
    ellipse(startX-(pigSize/3), startY-(pigSize/2), pigSize/4, pigSize);
    //left feathers
    ellipse(startX-(pigSize/1.3f), startY-(pigSize/1.15f), pigSize, pigSize/5);
    ellipse(startX-(pigSize/1.5f), startY-(pigSize/1.5f), pigSize/1.2f, pigSize/6);
    ellipse(startX-(pigSize/1.7f), startY-(pigSize/2f), pigSize/1.4f, pigSize/7);
    //right limb
    ellipse(startX+(pigSize/3), startY-(pigSize/2), pigSize/4, pigSize);
    //right feathers
    ellipse(startX+(pigSize/1.3f), startY-(pigSize/1.15f), pigSize, pigSize/5);
    ellipse(startX+(pigSize/1.5f), startY-(pigSize/1.5f), pigSize/1.2f, pigSize/6);
    ellipse(startX+(pigSize/1.7f), startY-(pigSize/2f), pigSize/1.4f, pigSize/7);


    //Pig Head
    noStroke();
    fill(255, 150, 150); //pink
    ellipse(startX, startY, pigSize, pigSize);

    //Pig Body
    ellipse(startX, startY+(pigSize/1.75), pigSize/1.5f, pigSize/1.5f);
    //left leg
    ellipse(startX-(pigSize/6), startY+(pigSize/1.1), pigSize/5, pigSize/4);
    //right leg
    ellipse(startX+(pigSize/6), startY+(pigSize/1.1), pigSize/5, pigSize/4);
    //left arm
    ellipse(startX-(pigSize/3), startY+(pigSize/2), pigSize/4, pigSize/5);
    //right arm
    ellipse(startX+(pigSize/3), startY+(pigSize/2), pigSize/4, pigSize/5);

    //Pig Eyes
    fill(0);
    //left eye
    ellipse(startX-(pigSize/6), startY, pigSize/8, pigSize/8);
    //right eye
    ellipse(startX+(pigSize/6), startY, pigSize/8, pigSize/8);

    //Pig Nose
    stroke(0);
    noFill();
    ellipse(startX, startY+(pigSize/5), pigSize/2, pigSize/3); 
    //left nose hole
    noStroke();
    fill(200, 50, 50);
    ellipse(startX-(pigSize/10), startY+(pigSize/5), pigSize/8, pigSize/6);
    //right nose hole
    ellipse(startX+(pigSize/10), startY+(pigSize/5), pigSize/8, pigSize/6);

    //Pig Ears
    noStroke();
    fill(255, 150, 150); //pink
    //left ear
    ellipse(startX-(pigSize/3.5f), startY-(pigSize/3.5f), pigSize/3, pigSize/2);
    //right ear
    ellipse(startX+(pigSize/3.5f), startY-(pigSize/3.5f), pigSize/3, pigSize/2);
  }
  
  /*
  //Thanks Daniel! Used your code for help here -- http://www.openprocessing.org/sketch/167099
  boolean isCollidingWith(Pig pigs){
    return dist(pigPos.x, pigPos.y, pigs.pigPos.x, pigs.pigPos.y) < (pigSize + pigs.pigSize) / 2;
  }
  void bounceWith (Pig pigs){
    pigVel.x *= -1;
    pigs.pigVel.x *= -1;
  }
  */


  //DRAW for the pigs
  void pigMover() {
    //Calculate acceleration
    targetPos();
    //add acceleration to velocity
    pigVel.add(pigAccel);
    pigVel.limit(9);
    //add velocity to position
    pigPos.add(pigVel);
    stroke(255);
    fill(0);
    ellipse(pigPos.x, pigPos.y, pigSize, pigSize);
    //Pig(int(pigPos.x), int(pigPos.y));
  }

  void setTargetPos(int inX, int inY) {
    targetPos.set(inX, inY, 0);
  }

  void targetPos() {
    PVector temp;
    temp = PVector.sub(targetPos, pigPos);
    //temp = new PVector (mouseX, mouseY);
    temp.normalize();
    temp.mult(.5);
    pigAccel = temp;
  }
  
}

/*
//PIG DRAW TEST

class Pig {

  //Pig position, velocity, acceleration.
  PVector pigPos, pigVel, pigAccel;

  //Pig target location.
  PVector target;

  //Pig starting coordinates.
  int startX, startY;

  //Pig sizes.
  int w, h, pigSize;

  drawPig() {


    //Draw Pig
    int pigSize = 100;
    int startX = width/2;
    int startY = height/2;

    //Wings
    fill(255);
    noStroke();
    //left limb
    ellipse(startX-(pigSize/3), startY-(pigSize/2), pigSize/4, pigSize);
    //left feathers
    ellipse(startX-(pigSize/1.3f), startY-(pigSize/1.15f), pigSize, pigSize/5);
    ellipse(startX-(pigSize/1.5f), startY-(pigSize/1.5f), pigSize/1.2f, pigSize/6);
    ellipse(startX-(pigSize/1.7f), startY-(pigSize/2f), pigSize/1.4f, pigSize/7);
    //right limb
    ellipse(startX+(pigSize/3), startY-(pigSize/2), pigSize/4, pigSize);
    //right feathers
    ellipse(startX+(pigSize/1.3f), startY-(pigSize/1.15f), pigSize, pigSize/5);
    ellipse(startX+(pigSize/1.5f), startY-(pigSize/1.5f), pigSize/1.2f, pigSize/6);
    ellipse(startX+(pigSize/1.7f), startY-(pigSize/2f), pigSize/1.4f, pigSize/7);


    //Pig Head
    noStroke();
    fill(255, 150, 150); //pink
    ellipse(startX, startY, pigSize, pigSize);

    //Pig Body
    ellipse(startX, startY+(pigSize/1.75), pigSize/1.5f, pigSize/1.5f);
    //left leg
    ellipse(startX-(pigSize/6), startY+(pigSize/1.1), pigSize/5, pigSize/4);
    //right leg
    ellipse(startX+(pigSize/6), startY+(pigSize/1.1), pigSize/5, pigSize/4);
    //left arm
    ellipse(startX-(pigSize/3), startY+(pigSize/2), pigSize/4, pigSize/5);
    //right arm
    ellipse(startX+(pigSize/3), startY+(pigSize/2), pigSize/4, pigSize/5);

    //Pig Eyes
    fill(0);
    //left eye
    ellipse(startX-(pigSize/6), startY, pigSize/8, pigSize/8);
    //right eye
    ellipse(startX+(pigSize/6), startY, pigSize/8, pigSize/8);

    //Pig Nose
    stroke(0);
    noFill();
    ellipse(startX, startY+(pigSize/5), pigSize/2, pigSize/3); 
    //left nose hole
    noStroke();
    fill(200, 50, 50);
    ellipse(startX-(pigSize/10), startY+(pigSize/5), pigSize/8, pigSize/6);
    //right nose hole
    ellipse(startX+(pigSize/10), startY+(pigSize/5), pigSize/8, pigSize/6);

    //Pig Ears
    noStroke();
    fill(255, 150, 150); //pink
    //left ear
    ellipse(startX-(pigSize/3.5f), startY-(pigSize/3.5f), pigSize/3, pigSize/2);
    //right ear
    ellipse(startX+(pigSize/3.5f), startY-(pigSize/3.5f), pigSize/3, pigSize/2);
  }
}
*/



