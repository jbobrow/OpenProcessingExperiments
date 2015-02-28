
//This is my library import
import net.nexttext.*;
import net.nexttext.behaviour.*;
import net.nexttext.behaviour.control.*;
import net.nexttext.behaviour.standard.*;
import net.nexttext.behaviour.dform.*;
import net.nexttext.renderer.*;

/*CREDIT WHERE CREDIT IS DUE:
 * A NextText sketch where where clicking the first mouse button pulls the 
 * text towards the cursor, dragging with <br>
 * the second mouse button moves the text, and clicking the third mouse 
 * button reforms the text.
 * 
 * <p>by Elie Zananiri | Obx Labs | February 2008<br>
 * Words by <a href="http://www.mitchhedberg.net/">Mitch Hedberg</a></p>
 */
 
// attributes
Book book;

//These are my images
PImage ParisWall;
PImage SpaceInvader;
PImage PalestineWall;
PImage BanksyGirl;
PImage InvaderRight;
PImage InvaderCenter;
PImage InvaderLeft;
//This is my font
PFont myDisplayFont;
PFont myDisplayFont2;
//These are my variables for the time delay, draw post-click
float lastSavedTime;
float timeDelaySeconds = 0.5;
float timeDelay;
//This defines where my clicks produce what images, credit to Liz Rutledge for troubleshootings
PImage[] tags = new PImage[5];
int whichTag;
//This are my variables for defining the dimensions of where images are drawn on the canvas
boolean drawTag = false;
float mouseXClicked;
float mouseYClicked;

void setup() {
  background(0);
  //These are my images
  ParisWall = loadImage("ParisWall.jpg");
  SpaceInvader = loadImage("SpaceInvader.png");
  PalestineWall = loadImage("PalestineWall.jpg");
  BanksyGirl = loadImage("BanksyGirl.png");
  InvaderRight = loadImage("SpaceInvaderRight.png");
  InvaderCenter = loadImage("SpaceInvaderCenter.png");
  InvaderLeft = loadImage("SpaceInvaderLeft.png");
  //These are my tags
  tags[0] = SpaceInvader;
  tags[1] = BanksyGirl;
  tags[2] = InvaderLeft;
  tags[3] = InvaderCenter;
  tags[4] = InvaderRight;

  lastSavedTime = 0;
  timeDelay = 1000*timeDelaySeconds;
  myDisplayFont = loadFont("Silom-48.vlw");
  myDisplayFont2 = loadFont("PortagoITCTT-48.vlw");
  textAlign(LEFT);
  println(lastSavedTime);
  ellipseMode(CENTER);
  size(1200, 749);
  smooth();
  image(ParisWall, 0, 0);
  image(PalestineWall, 600, 0);
  
  // create the book
  book = new Book(this);
  
  // pull the text with the first mouse button
  Action pull = new Pull(Book.mouse, 10, 2);
  AbstractBehaviour pullOnOne = new OnMouseDepressed(pull).makeBehaviour();
  pullOnOne.setDisplayName("Pull");
  
  // move the text with the middle mouse button
  MoveTo moveTo = new MoveTo(Book.mouse, Long.MAX_VALUE);
  OnDrag onDrag = new OnDrag(CENTER, new Repeat(moveTo, 0));
  moveTo.setTarget(onDrag);
  AbstractBehaviour dragOnTwo = onDrag.makeBehaviour();
  dragOnTwo.setDisplayName("Drag");
  
  // reform the text with the last mouse button
  Action reform = new Reform();
  AbstractBehaviour reformOnThree = new OnMouseDepressed(RIGHT, reform).makeBehaviour();
  reformOnThree.setDisplayName("Reform");

  // add the behaviours to the book
  book.addGroupBehaviour(pullOnOne);
  book.addGroupBehaviour(dragOnTwo);
  book.addGroupBehaviour(reformOnThree);

  // add the text
    fill(222, 42, 33);
  textFont(myDisplayFont, 40);
  book.addText("YOU ARE SPACE INVADER", 0, 50);
    // add the text
      fill(0, 0, 0);
  textFont(myDisplayFont2, 48);
  book.addText("YOU ARE BANKSY", 605, 50);

}

void draw() {


  if (drawTag) {
    if (mouseX <= 200) {
      whichTag = 2;
    }
    if (mouseX > 200 && mouseX <= 315) {
      whichTag = 3;
    }
    if (mouseX > 315 && mouseX < 600) {
      whichTag = 4; 
      if (mouseX > 530) {
        mouseXClicked = 530;
      }
    }

    if (mouseX >= 600) {
      whichTag = 1;
    }
    image(tags[whichTag], mouseXClicked, mouseYClicked);
    drawTag = false;
  }
  


  // apply the behaviours to the text and draw it
  book.stepAndDraw();

}


void mouseReleased() {

  lastSavedTime = millis();
  println(lastSavedTime);

  drawTag = true;
  mouseXClicked = constrain(mouseX, 0, 1130);
  mouseYClicked = mouseY;  
}




