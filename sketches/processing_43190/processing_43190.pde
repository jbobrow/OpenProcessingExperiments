
/**
 * Getting to know the jbox2d physics library
 * by Sean Gordon.  
 * 
 * Click with the mouse button to create circles
 * Press any button to clear screen
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

//Global variables
Physics physics;
int lastReset;

//Initialisation
void setup() {
  //Set up Processing stuff
  size(500, 500);
  frameRate(60);
  
  //Initialise global variables
  lastReset = 0;
  
  //Start
  initScene();
}

//Draw frame
void draw() {
  //Clear screen
  background(0);
  
  //Reset all of our physicsey goodness
  if (keyPressed && millis()-200 > lastReset) {
    physics.destroy();
    initScene();
    lastReset = millis();
  }
  //Create new circle
  if (mousePressed) {
    float x;
    float y;
    if (mouseButton == RIGHT) {
      x = mouseX + random(-20, 20);
      y = mouseY + random(-20, 20);
    } else if (mouseButton == CENTER) {
      x = mouseX + random(-50, 50);
      y = mouseY + random(-50, 50);
    } else {
      x = mouseX;
      y = mouseY;
    }
    physics.createCircle(x, y, random(5, 15));
  }
}

//Create our physics environment, objects, etc
void initScene() {
  physics = new Physics(this, width, height);
  physics.setDensity(1.0);
  //float x = random(width-50);
  //float y = random(height/2);
  //physics.createRect(x, y, y + random(height/4), x + random(10, 50));
}

