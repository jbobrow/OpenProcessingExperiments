
// The MIT License (MIT) - See Licence.txt for details
// Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;

// A physics based game. The goal is to diminish the size of targets (bulldog pillows)
// by colliding our droid (MINI Countryman) to them. At the same
// time, the droid needs to be protected from threats (Union Jack
// flags)that can increase the size to a certain degree and end the game.

// audio stuff

//Maxim maxim;
//AudioPlayer droidSound, wallSound;
//AudioPlayer[] targetSounds;

Physics physics; // The physics handler: we'll see more of this later

// rigid bodies for the MINI Countryman Car, Bulldog pillows and Union Jack Flags
Body droid;
Body [] targets;
Body [] threats;
Body [] pillowSizes;
Body [] threatSizes;

var finishedPillows = new Array();

// the start point of the catapult 
Vec2 startPoint;

// a handler that will detect collisions
CollisionDetector detector; 

// dimensions used for body sizes (for physics) and image sizes (what you see)
int targetSize = 110;
int carSize = 130;
int threatSize=110;

// used to end the game when all Bulldog pillows become extremely small
int gameFinishedCounter = 0;

PImage targetImage, carImage, threatImage, backImage, backTwoImage;
// carImage is is our droid positioned where mouse is
// backImage and backTwoImage are for the background
// targetImage and threatImage are moving objects that change sizes

// score starts at zero
int score = 0;

// for spacing the text box
int margin=100;

boolean backImageShowing = false;
boolean dragging = false;
boolean finished;

// start the game 
boolean startTheGameNow;

// this is used to remember that the user 
// has triggered the audio on iOS... see mousePressed below
boolean userHasTriggeredAudio = false;

void setup() {
  
  // start the game
  startTheGameNow = false;

  // want to indicate that finished
  finished = false;
  
  size(1000, 568); // iPad screen size 1024x768
  frameRate(60);

  backImage = loadImage("MINISpace.jpg");
  backTwoImage = loadImage("GB_Flag.jpg");
  targetImage = loadImage("MINI_Bulldog.png");
  carImage = loadImage("MINI_Countryman.png");
  threatImage = loadImage("GB_Flag.jpg");
  imageMode(CENTER);

  /*
   * Set up a physics world. This takes the following parameters:
   * 
   * parent The PApplet this physics world should use
   * gravX The x component of gravity, in meters/sec^2
   * gravY The y component of gravity, in meters/sec^2
   * screenAABBWidth The world's width, in pixels - should be significantly larger than the area you intend to use
   * screenAABBHeight The world's height, in pixels - should be significantly larger than the area you intend to use
   * borderBoxWidth The containing box's width - should be smaller than the world width, so that no object can escape
   * borderBoxHeight The containing box's height - should be smaller than the world height, so that no object can escape
   * pixelsPerMeter Pixels per physical meter
   */
 
  physics = new Physics(this, width, height, 0, -10, width*2, height*2, width, height, 100);
  // this overrides the debug render of the physics engine
  // with the method myCustomRenderer
  // comment out to use the debug renderer 
  // (currently broken in JS)
  physics.setCustomRenderingMethod(this, "myCustomRenderer");
  physics.setDensity(5.0);

  pillowSizes = new Body[7];  
  pillowSizes[0] = 150;
  pillowSizes[1] = 150;
  pillowSizes[2] = 150;
  pillowSizes[3] = 150;
  pillowSizes[4] = 150;
  pillowSizes[5] = 150;
  pillowSizes[6] = 150;
  
  threatSizes = new Body[4];  
  threatSizes[0] = 150;
  threatSizes[1] = 150;
  threatSizes[2] = 150;
  threatSizes[3] = 150;
  
  // set up the objects
  // Rect parameters are the top left and bottom right corners

  targets = new Body[7];
  targets[0] = physics.createRect(width/2-1.1*targetSize, height-targetSize, width/2+0.1*targetSize, height);
  targets[1] = physics.createRect(width/2-1.1*targetSize, height-2*targetSize, width/2+0.1*targetSize, height-targetSize);
  targets[2] = physics.createRect(width/2, height-targetSize, width/2+targetSize, height);
  targets[3] = physics.createRect(width/2, height-2*targetSize, width/2+targetSize, height-targetSize);
  targets[4] = physics.createRect(width/2+1.1*targetSize, height-targetSize, width/2+2.1*targetSize, height);
  targets[5] = physics.createRect(width/2+1.1*targetSize, height-2*targetSize, width/2+2.1*targetSize, height-targetSize);
  targets[6] = physics.createRect(width/2, height-3*targetSize, width/2+targetSize, height-2*targetSize);

  threats = new Body[3];
  threats[0] = physics.createRect(0, 0, 0+threatSize, 0+threatSize);
  threats[1] = physics.createRect(0+1.5*threatSize, 0, 0+2.5*threatSize, 0+threatSize);
  threats[2] = physics.createRect(width-threatSize, 0, width, 0+threatSize);
  threats[3] = physics.createRect(width-2.5*threatSize, 0, width-1.5*threatSize, 0+threatSize);

  //startPoint = new Vec2(300, height/2);
  startPoint = new Vec2(mouseX, mouseY);

  // this converst from processing screen 
  // coordinates to the coordinates used in the
  // physics engine (10 pixels to a meter by default)
  startPoint = physics.screenToWorld(startPoint);

  // circle parameters are center x,y and radius
  droid = physics.createCircle(width/2, -100, carSize/2);

  // sets up the collision callbacks
  detector = new CollisionDetector (physics, this);

 // maxim = new Maxim(this);
 // droidSound = maxim.loadFile("target2.wav");
 // wallSound = maxim.loadFile("wall.wav");

  //droidSound.setLooping(false);
  //droidSound.volume(1.0);
  //wallSound.setLooping(false);
  //wallSound.volume(1.0);
  // now an array of target sounds
  //targetSounds = new AudioPlayer[targets.length];
  //for (int i=0;i<targetSounds.length;i++) {
   // targetSounds[i] = maxim.loadFile("droid.wav");
    //targetSounds[i].setLooping(false);
    //targetSounds[i].volume(1);
  //}
}

void draw()
{
  background(22,28,42);
  //background(199,37,34);
  strokeWeight(10);
  stroke(199,37,34);
  //stroke(251,246,206);
  fill(251,246,206);
  //fill(199,37,34);
  rect(20, height/2-margin, width-40, 100);
  fill(0);
  textSize(20);
  text("OBJECTIVE: make all pillows dissapear by colliding to them.",width/2-4.5*margin, height/2-margin*0.6);
  text("THREAT: don't let flags touch you or they will expand too much.",width/2-4.5*margin, height/2-margin*0.4);
  textSize(24);
  text("CLICK TO START",width/2+2*margin, height/2-margin*0.2);

if(backImageShowing)
{
  // we want to start our physics engine here...
  
  image(backImage, width/2, height/2, width, height);

  // we can call the renderer here if we want 
  // to run both our renderer and the debug renderer
  //myCustomRenderer(physics.getWorld());

  fill(255,255,255);
  text("Score: " + score, 20, 20);
}

if(finished)
{
  image(backTwoImage, width/2, height/2, width, height);
     
  strokeWeight(10);
  //stroke(100,100,255);
  stroke(199,37,34);
  //fill(0,255,0,100);
  fill(22,28,42);
  rect(20, height/2-margin/2, width-40, 100);
  //fill(255,255,255);
  fill(251,246,206);
  text("You have finished the game.",width/2-3*margin, height/2-margin/2+margin/2.4);
  text("Click refresh to start again.",width/2-3*margin, height/2-margin/2+margin/1.5);
  text("Your Score: " + score,width/2+2*margin, height/2-margin/2+margin/1.2);
}
}

/** on iOS, the first audio playback has to be triggered
* directly by a user interaction
* so the first time they tap the screen, 
* we play everything once
* we could be nice and mute it first but you can do that... 
*/

void mousePressed()
{
 // if (!userHasTriggeredAudio) 
  //{
    //droidSound.play();
//    wallSound.play();
//    for (int i=0;i<targets.length;i++) 
//    {
//      targetSounds[i].play();
//    }
   // userHasTriggeredAudio = true;
  //}
}

void mouseDragged()
{
  // tie the droid to the mouse while we are dragging
  dragging = true;
  droid.setPosition(physics.screenToWorld(new Vec2(mouseX, mouseY)));
}

// when we release the mouse, apply an impulse based 
// on the distance from the droid to the catapult
void mouseReleased()
{
  // indicates we are starting the game - start running physics renderer
  startTheGameNow = true;
  backImageShowing=true;
  dragging = false;
  Vec2 impulse = new Vec2();
  impulse.set(startPoint);
  impulse = impulse.sub(droid.getWorldCenter());
  impulse = impulse.mul(50);
  droid.applyImpulse(impulse, droid.getWorldCenter());
}

// this function renders the physics scene.
// this can either be called automatically from the physics
// engine if we enable it as a custom renderer or 
// we can call it from draw
void myCustomRenderer(World world) {
    if(startTheGameNow && (finished == false))
    {
      stroke(0);   
      Vec2 screenStartPoint = physics.worldToScreen(startPoint);
      strokeWeight(0);
      stroke(0,0,0,0);
      line(screenStartPoint.x, screenStartPoint.y, screenStartPoint.x, height);
    
      // get the droids position and rotation from
      // the physics engine and then apply a translate 
      // and rotate to the image using those values
      // (then do the same for the targets)
      Vec2 screenDroidPos = physics.worldToScreen(droid.getWorldCenter());
      float droidAngle = physics.getAngle(droid);
      pushMatrix();
      translate(screenDroidPos.x, screenDroidPos.y);
      rotate(-radians(droidAngle));
      image(carImage, 0, 0, carSize, carSize);
      popMatrix();
    
      for (int i = 0; i < targets.length; i++)
      {
        Vec2 worldCenter = targets[i].getWorldCenter();
        Vec2 targetPos = physics.worldToScreen(worldCenter);
        float targetAngle = physics.getAngle(targets[i]);
        pushMatrix();
        translate(targetPos.x, targetPos.y);
        rotate(-targetAngle);
        image(targetImage, 0, 0, pillowSizes[i], pillowSizes[i]);  
        popMatrix();
      }
      
      for (int i = 0; i < threats.length; i++)
      {
        Vec2 worldCenter = threats[i].getWorldCenter();
        Vec2 threatPos = physics.worldToScreen(worldCenter);
        float threatAngle = physics.getAngle(threats[i]);
        pushMatrix();
        translate(threatPos.x, threatPos.y);
        rotate(-threatAngle);
        image(threatImage, 0, 0, threatSizes[i], threatSizes[i]);
        popMatrix();
      }
    
      if (dragging)
      {
        strokeWeight(0);
        fill(0,0,0,0);
        line(screenDroidPos.x, screenDroidPos.y, screenStartPoint.x, screenStartPoint.y);
      }
    }
}

// This method gets called automatically when there is a collision
void collision(Body b1, Body b2, float impulse)
{
    if (finished)
    {
      return;
    }
    
  // droid colliding with other moving objects
  if ((b1 == droid && b2.getMass() > 0)
    || (b2 == droid && b1.getMass() > 0))
  {
    if (impulse > 1.0)
    {
      score += 1;
    }
  }

  // test for droid
//  if (b1.getMass() == 0 || b2.getMass() == 0) {// b1 or b2 are walls
//    // wall sound
//    wallSound.cue(0);
//    wallSound.speed(impulse / 1000);// 
//    wallSound.play();
//  }
  //if (b1 == droid || b2 == droid) { // b1 or b2 are the droid
    // droid sound
  //  droidSound.cue(0);
    //droidSound.speed(impulse / 1000);
    //droidSound.play();
 // }
//  for (int i=0;i<targets.length;i++) 
//  {
//    if (b1 == targets[i] || b2 == targets[i]) 
//    {
//      // it is a target
//      targetSounds[i].cue(0);
//      targetSounds[i].speed(0.25 + (impulse / 250));// 10000 as the targets move slower??
//      targetSounds[i].play();
//    }
//  }
  
  for (int i=0;i<targets.length;i++) 
  {
    if (b1 == targets[i] && b2 == droid) 
    {
      // pillow<->car collioson
      int newPillowSize=pillowSizes[i] / 1.15;
      
      if (newPillowSize<25 && (finishedPillows.indexOf(i) == -1 ))
      {
        finishedPillows.push(i);
        // we have a really small pillow.. (for targets[i])
        //println("Adding to counter!!!");
        gameFinishedCounter++;
        
        if (gameFinishedCounter == 2)
        {
          //println("FINISHED THE GAME");
          backImageShowing=false;
          finished = true;
        }
      }
      else
      {
        // setting the new pillow size 
        pillowSizes[i] = pillowSizes[i] / 1.15;
      } 
  }
  }
  
    for (int i=0;i<threats.length;i++) 
  {
    if (b1 == threats[i] && b2 == droid) 
    {
      // flag<->car collision
      int newSize = threatSizes[i] * 1.15;
      if (newSize > 700)
      {
        backImageShowing=false;
        finished = true;

      }
      else
      {
         threatSizes[i] = threatSizes[i] * 1.15;
         displayGUI = true;
      }
    }
  }
  
  
}



