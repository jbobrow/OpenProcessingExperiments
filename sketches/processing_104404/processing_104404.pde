
import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;

Physics physics;

int bubbleNo = 7;
int bubbleSize = 180;

// each bubble contains a multiplication calc., its result, ...
Body [] bubbles;
String [] bubbleCalcs;
int [] bubbleResults;
boolean [] bubbleBurst;       //... and info. if it is calcualted yet or not
int [] bubbleSortedResults;   //by sorting the results we know which bubble is next to burst

Vec2 startPoint;               //needed for the version with sounds
CollisionDetector detector; 

PFont myFont;

PImage bubbleImage, bubbleImageBurst;   //only two different images

int currentBubbleResult;   //scans the bubbleSortedResults at each step and tells when all the bubbles have been calculated
int penalty = 0;           //no mistakes in calculating which bubble comes next -- no penalty :-)
int maxPoints = 100;

Body allDoneMessage;       //an extra bubble appears when everything is calculated, tells the points
boolean allDone = false;


void setup() {
  size(800,600);
  frameRate(60);
  bubbleImage = loadImage("BallPurple.png");
  bubbleImageBurst = loadImage("BallBlue.png");
  imageMode(CENTER);
  
  myFont = createFont("tahomabd", 28);    //font has to reside in the data folder
  textFont(myFont);
  textAlign(CENTER, CENTER);

                                            //vector gravitation                       //pixels per meter
  physics = new Physics(this, width, height, 0, -0.01, width*2, height*2, width, height, 100);
  physics.setCustomRenderingMethod(this, "myCustomRenderer");
  physics.setDensity(20); // 0.0f  ....static body
  physics.setRestitution(0.9);             // this is how "bouncy" the bubbles are
  
  bubbles = new Body[bubbleNo];                //setting up all the bubbles
  Vec2 impulseInit = new Vec2(0,0);
  for (int i = 0; i < bubbles.length; i++){    //all bubbles are set in the middle, but they move in different directions
    bubbles[i] = physics.createCircle(width/2, height/2, bubbleSize/2);
    impulseInit.x = int(random(-50,50));
    impulseInit.y = int(random(-50,50));
    bubbles[i].applyImpulse(impulseInit, bubbles[i].getWorldCenter());   
  }  
  
  allDoneMessage = physics.createCircle(width/2, height/2, bubbleSize/2);  //this one pops up at the end of the game
  
  bubbleCalcs = new String[bubbleNo];       // initiating multiplication questions and results
  bubbleResults = new int[bubbleNo];
  bubbleBurst = new boolean[bubbleNo];
  for (int i = 0; i < bubbles.length; i++){
    int factor1 = int(random(1,11));
    int factor2 = int(random(1,11));
    bubbleCalcs[i] = factor1 + " × " + factor2;
    bubbleResults[i] = factor1 * factor2;  
    bubbleBurst[i] = false;  
  }  
 
  bubbleSortedResults = new int[bubbleNo];      //sorted array of results
  bubbleSortedResults = sort(bubbleResults);
  currentBubbleResult = 0;
  
  //shape1.density = physics.getDensity();
  //shape1.friction = physics.getFriction();
  //shape1.restitution = physics.getRestitution();
  //shape1.isSensor = physics.getSensor();
  //physics.setFriction(0.5);
 
 
}
 
void draw() {
  background(0);
  
}

void mouseDragged()
{
//  ball1.setPosition(physics.screenToWorld(new Vec2(mouseX, mouseY)));

  Vec2 impulseJumpIfNotCorrect = new Vec2(0,0);
  Vec2 bubblePos;  
  for (int i = 0; i < bubbles.length; i++){                //see for each bubble
    if (currentBubbleResult < bubbles.length){             // if not all bubbles calcualted yet
      bubblePos = physics.worldToScreen(bubbles[i].getWorldCenter());
      boolean bubbleSelected = (dist(mouseX, mouseY, bubblePos.x, bubblePos.y) < bubbleSize/2);
      boolean isMyTurn = (bubbleResults[i] == bubbleSortedResults[currentBubbleResult]);
        if (bubbleSelected && (!bubbleBurst[i])){          //check if it is its turn
          if (isMyTurn){
            bubbleBurst[i] = true;
            currentBubbleResult++;                         //move to the next larger result
          } else {
            impulseJumpIfNotCorrect.x = int(random(-100,100));   //if it is not this bubble's turn, it will "run away"
            impulseJumpIfNotCorrect.y = int(random(-100,100));
            bubbles[i].applyImpulse(impulseJumpIfNotCorrect, bubbles[i].getWorldCenter()); 
            penalty++;                     //and the player will get penalty
          }
      
        }
      } else {
        if (!allDone){
          impulseJumpIfNotCorrect.x = int(random(-100,100));
          impulseJumpIfNotCorrect.y = int(random(-100,100));
          allDoneMessage.applyImpulse(impulseJumpIfNotCorrect, allDoneMessage.getWorldCenter()); 
          //all bubbless burst ... game ends, a bubble with a message appears, "kicked" once by an impulse
        }
        allDone = true;
      }
  }  
  
  
  

}


void myCustomRenderer(World world) {    // my renderer has to take track whether the bubble is burst or not
  Vec2 bubblePos;
  float bubbleAngle;
  for (int i = 0; i < bubbles.length; i++){
    bubblePos = physics.worldToScreen(bubbles[i].getWorldCenter());
    bubbleAngle = physics.getAngle(bubbles[i]);
    pushMatrix();
    translate(bubblePos.x, bubblePos.y);
    rotate(-bubbleAngle);
    if (!bubbleBurst[i]){
      image(bubbleImage, 0, 0, bubbleSize, bubbleSize);
      text(bubbleCalcs[i], 0, -5);
    } else {
      image(bubbleImageBurst, 0, 0, bubbleSize, bubbleSize);
      text(bubbleResults[i], 0, -5);
    }
    popMatrix();
  }  
  if (allDone){                            //if game is over, points get written in a moving bubble
    Vec2 messagePos;
    messagePos = physics.worldToScreen(allDoneMessage.getWorldCenter());
    pushMatrix();
    translate(messagePos.x, messagePos.y);
    tint(0, 153, 204, 126);
    image(bubbleImage, 0, 0, bubbleSize, bubbleSize);
    noTint();
    text("ALL DONE!", 0, -25);
    text("Your points:", 0, 10);
    text(maxPoints - penalty, 0, 40);
    popMatrix();
  }
}


void collision(Body b1, Body b2, float impulse){  //prepared when sounds are introduced
}



