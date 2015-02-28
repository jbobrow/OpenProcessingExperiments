
/**
 * Trying out the (very) basics of our sumo game idea
 * by Sean Gordon.  
 * 
 * Player 1 uses WASD to move
 * Player 2 uses Arrow keys to move
 *
 * Sorry for the horrendously messy code! I don't plan
 * on reusing a great deal of it.
 */

//Physics library imports
import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;
import javax.swing.JOptionPane;

//Global variables
Physics physics;
int lastReset;
org.jbox2d.dynamics.Body sumoOne;
org.jbox2d.dynamics.Body sumoTwo;
boolean keyUp,
        keyDown,
        keyLeft,
        keyRight,
        keyW,
        keyS,
        keyA,
        keyD;

//Initialisation
void setup() {
  //Set up Processing stuff
  size(500, 500);
  frameRate(60);
  
  //Start
  initScene();
}

//Draw frame
void draw() {
  //Clear screen
  background(0);
  
  //Draw the sumo ring
  fill(100);
  noStroke();
  ellipse(width/2,height/2,width-50,height-50);
  
  //Update game
  updateMovement();
  checkPositions();
}

//Create our physics environment, objects, etc
void initScene() {
  physics = new Physics(this, width, height, 0, 0, width+20, height+20, width, height, 10);
  physics.setDensity(1.0);
  sumoOne = physics.createCircle(width*0.75, height*0.75, 15);
  sumoTwo = physics.createCircle(width*0.25, height*0.25, 15);
}

void updateMovement() {
  if (keyUp) {
    moveSumo(sumoOne, 0, -1);
  }
  if (keyDown) {
    moveSumo(sumoOne, 0, 1);
  }
  if (keyLeft) {
    moveSumo(sumoOne, -1, 0);
  }
  if (keyRight) {
    moveSumo(sumoOne, 1, 0);
  }
  if (keyW) {
    moveSumo(sumoTwo, 0, -1);
  }
  if (keyS) {
    moveSumo(sumoTwo, 0, 1);
  }
  if (keyA) {
    moveSumo(sumoTwo, -1, 0);
  }
  if (keyD) {
    moveSumo(sumoTwo, 1, 0);
  }
}

void checkPositions() {
  Vec2 position = sumoOne.getPosition();
  if (position.length() > 22.5) {
    displayMessage("Player 2 wins!");
    physics.destroy();
    initScene();
  } else {
    position = sumoTwo.getPosition();
    if (position.length() > 22.5) {
      displayMessage("Player 1 wins!");
      physics.destroy();
      initScene();
    }
  }
  //println("PosX: " + position.x + "   PosY: " + position.y);
  //println("Length: " + position.length());
}

void displayMessage(String msg) {
  JOptionPane.showMessageDialog(null, msg);
}

void keyPressed() {
  //println("Key: " + key + "   Coded: " + (key == CODED ? "True" : "False"));
  if (key == CODED) {
    switch(keyCode) {
      case(UP):
        keyUp = true;
        break;
      case(DOWN):
        keyDown = true;
        break;
      case(LEFT):
        keyLeft = true;
        break;
      case(RIGHT):
        keyRight = true;
        break;
    }
  } else {
    switch(key) {
      case('w'):
      case('W'):
        keyW = true;
        break;
      case('s'):
      case('S'):
        keyS = true;
        break;
      case('a'):
      case('A'):
        keyA = true;
        break;
      case('d'):
      case('D'):
        keyD = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch(keyCode) {
      case(UP):
        keyUp = false;
        break;
      case(DOWN):
        keyDown = false;
        break;
      case(LEFT):
        keyLeft = false;
        break;
      case(RIGHT):
        keyRight = false;
        break;
    }
  } else {
    switch(key) {
      case('w'):
      case('W'):
        keyW = false;
        break;
      case('s'):
      case('S'):
        keyS = false;
        break;
      case('a'):
      case('A'):
        keyA = false;
        break;
      case('d'):
      case('D'):
        keyD = false;
        break;
    }
  }
} 

void moveSumo(Body sumo, int dirX, int dirY) {
  dirY*=-1;
  Vec2 force = new Vec2(dirX*100, dirY*100);
  sumo.applyForce(force, sumo.getPosition());
}

