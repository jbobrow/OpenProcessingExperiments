
/** 
 * <b>lolphysics - Built with <a href="http:/www.processing.org/">Processing</a></b><br/><br/>
 * 
 * <b>Controls:</b><br/>
 * <b>Arrow Keys:</b> Move the blue box.<br/>
 * <b>Shift + Arrow Keys:</b> Boost.<br/>
 * <b>Mouse Click:</b> Create a randomly colored box or circle. Size is a random number between 5 and the value of the 'Max Size' slider.<br/>
 * <b>Ctrl + Mouse Click:</b> Create a randomly colored box or circle. Size is the value of the 'Max Size' slider.<br/>
 * <b>Space:</b> Set the location of the blue box to where the mouse is. Useful if the box goes off the screen. (Note: The box's velocity is unchanged. If it's moving fast, it'll be moving fast when it appears at the mouse coordinates.)<br/>
 * 
 * <b>R:</b> Resets all the sliders to their default value.<br/>
 * <b>C: </b>Removes all Boxes and Circles from the screen.<br/>
 * <b>S:</b> Speeds up everything.<br/>
 * 
 * <br/><b>Radio:</b><br/>
 * <b>Box:</b> Changes the selected shape to a box.<br/>
 * <b>Circle:</b> Changes the selected shape to a circle.<br/>
 * 
 * <br/><b>Sliders:</b><br/>
 * <b>Gravity:</b> Pretty self explanatory. Positive values, stuff goes down; negative, stuff goes up; zero, stuff floats around.<br/>
 * <b>Shift Force:</b> Determines the amount of the boost.<br/>
 * <b>Max Size:</b> Determines the max of the randomly generated numbers to get the size of new shapes.<br/>
 * <b>Friction:</b> A higher friction means that touching bodies will loose energy, and will result in a "sticky" effect.<br/>
 * 
 * <b>Restitution:</b> Set the restitution of the edges, which define itself by the "spring" effect occurring when two bodies. A value of 1 would be a pool ball. The default is 0, which mean no restitution.<br/>
 * <b>Damping:</b> Damping is the effect of "air" on a body. The more damping you have, the more energy lost you will get, resulting in an impression resistance to the gravity effect. Use this function to adjust the damping of all bodies, wich will make it fall faster or slower.<br/>
 * <b>Angular Velocity:</b> How fast the blue cube spins. > 0 is clock wise, < 0 is counter-clockwise.<br/><br/>
 * 
 * <b>Credits:</b>
 * <br/>
 * <b>Coding</b> - <a href="http://www.tacticalbread.net76.net">tacticalbread/Xitherun</a><br>
 * <b>ControlP5 (GUI Library)</b> - <a href="http://www.sojamo.de/">Andreas Schlegel</a><br/>
 * <b>PPhys2D (Physics Engine)</b> - <a href="http://pphys2d.jmcouillard.com/pages/view/info">Jean-Maxime Couillard</a><br/>
 */

//Import all Phys2D libraries
import pphys2d.bodies.*;
import pphys2d.joints.*;
import pphys2d.shapes.*;
import pphys2d.phys2d.raw.collide.*;
import pphys2d.phys2d.raw.strategies.*;
import pphys2d.phys2d.raw.forcesource.*;
import pphys2d.phys2d.util.*;
import pphys2d.phys2d.raw.shapes.*;
import pphys2d.*;
import pphys2d.phys2d.raw.*;
import pphys2d.phys2d.math.*;

import controlP5.*;

//import processing.video.*;

/*
import ddf.minim.signals.*;
 import ddf.minim.*;
 import ddf.minim.analysis.*;
 import ddf.minim.effects.*;
 */
ControlP5 control;
Textlabel label;
//MovieMaker movie

//Minim minim;
//AudioSample hit;

//Create a PPhys2D world
PPWorld world = new PPWorld();

//Create PPhys2D Objects
PPBox[] boxes = new PPBox[100];
PPBox rofl;
PPBox rofl2;
PPCircle[] circles = new PPCircle[100];
PPJoint joint;

float rotation = 0.0;
boolean[] keyIsPressed = new boolean[612];
boolean mouse = false;
boolean looping = true;
int count = 0;
int cCount = 0;
int maxSize = 0;

int shiftForce = 750000;

int shape1 = 1;
int hits = 0;

void setup()
{

  //Set size and framerate
  frameRate(60);
  size(924,450);

  //Uncomment for Anti-Aliasing
  //smooth();

  //Set a standard world gravity
  world.setGravity(0, 1);

  //Set world edges in dark gray
  world.setEdges(this, new Color (40, 40, 40));

  //Add a box to the world
  rofl = new PPBox(15, 15);
  rofl.setPosition(250, 100);
  rofl.setStrokeWidth(1);
  rofl.setRotation(rotation);
  rofl.setFillColor(new Color(4,142,255));
  rofl.setStrokeColor(new Color(0,0,0));
  rofl.setGravityEffected(false);
  rofl.setMass(100);
  world.add(rofl);
  
  rofl2 = new PPBox(15, 15);
  rofl2.setPosition(250, 100);
  rofl2.setStrokeWidth(1);
  rofl2.setRotation(rotation);
  rofl2.setFillColor(new Color(4,142,255));
  rofl2.setStrokeColor(new Color(0,0,0));
  rofl2.setGravityEffected(false);
  rofl2.setMass(100);
  //world.add(rofl2);
  
  joint = new PPSpringJoint(rofl, rofl2, 1, 1, 5, 5);

  /*circle = new PPCircle(10);
   circle.setPosition(mouseX, mouseY);
   circle.setStrokeWidth(1);
   circle.setFillColor(new Color(40,40,100));
   circle.setStrokeColor(new Color(40,40,40));
   world.add(circle);
   
   for(int i = 1; i < boxes.length; ++i)
   {
   int color1 = (int)random(0, 255);
   int color2 = (int)random(0, 255);
   int color3 = (int)random(0, 255);
   boxes[i] = new PPBox(random(10, 100), random(10, 100));
   boxes[i].setPosition(random(width), random(height));
   boxes[i].setStrokeWidth(1);
   boxes[i].setRotation(rotation);
   boxes[i].setFillColor(new Color(color1, color2, color3));    
   boxes[i].setStrokeColor(new Color(color1, color2, color3));
   boxes[1].setMass(random(10));
   world.add(boxes[i]);
   }*/

  world.setEdgesRestitution(0);
  world.setEdgesFriction(0);
  world.setDamping(2);

  /* BUTTON SETUP */
  control = new ControlP5(this);
  control.addSlider("Gravity", -600, 600, 10, 10, 40, 10);
  control.controller("Gravity").setValue(0.00);

  control.addSlider("force", 0, 100, 10, 21, 40, 10);
  control.controller("force").setLabel("Shift Force");
  control.controller("force").setValue(75);

  control.addSlider("size", 1, 400, 10, 32, 40, 10);
  control.controller("size").setLabel("Max Size");
  control.controller("size").setValue(100);

  control.addSlider("friction", 0, 10, 10, 43, 40, 10);
  control.controller("friction").setValue(0);

  control.addSlider("rest", 0, 1, 10, 54, 40, 10);
  control.controller("rest").setLabel("Restitution");
  control.controller("rest").setValue(0);

  control.addSlider("damping", 1, 4, 10, 65, 40, 10);
  control.controller("damping").setValue(1);

  control.addSlider("spin", -50, 50, 10, 76, 40, 10);
  control.controller("spin").setLabel("Angular Velocity");
  control.controller("spin").setValue(0);

  control.addButton("zero", 1, 10, 88, 65, 15);
  control.controller("zero").setLabel("Gravity == 0");

  control.addButton("X", 1, width-18, 8, 11, 11);

  Radio shapes = control.addRadio("shapes", 10, 104);
  shapes.add("Square", 1);
  shapes.add("Circle", 2);

  label = control.addTextlabel("hits", "Hits: " + hits, 10, height-15);

  //minim = new Minim(this);

  //hit = minim.loadSample("hit.mp3");  

}

void draw () 
{
  background(0);

  checkKey();

  //println("Mouse X: " + mouseX + " Mouse Y: " + mouseY + " " + isMouseOver());
  //println("getX(): " + rofl.getX() + " getY(): " + rofl.getY());
  //println(shiftForce);

  for(int i = 0; i <= count; ++i)
  {
    if(rofl.isTouchingBody(boxes[i]))
    {
      //hit.trigger();
      background(255);
      println("box!");
      ++hits;
    }
  }
  for(int i = 0; i <= cCount; ++i)
  {
    if(rofl.isTouchingBody(circles[i]))
    {
      //hit.trigger();
      background(255);
      println("circle!");
      ++hits;
    }
  }

  label.setValue("Hits: " + hits);

  rofl.setAngularVelocity(rotation);

  //joint.draw(this);
  world.draw(this);
}

/* KEYBOARD METHODS */
void keyPressed()
{
  keyIsPressed[keyCode] = true;

  //println(keyCode);
  if(key == ' ')
  {
    rofl.setPosition(mouseX, mouseY);
    rofl.setRotation(0);
    rofl.adjustVelocity(0, 0);
  }
  if(key == 'r')
  {
    control.controller("rest").setValue(0);  
    control.controller("damping").setValue(2);
    control.controller("friction").setValue(0);
    control.controller("size").setValue(100);
    control.controller("force").setValue(75);
    control.controller("Gravity").setValue(0.00);
  }
  if(key=='c')
  {
    for(int i = 0; i < count; ++i)
      world.remove(boxes[i]);
    for(int i = 0; i < cCount; ++i)
      world.remove(circles[i]);

    count = 0;
    cCount = 0;
  }
}

void keyReleased()
{
  keyIsPressed[keyCode] = false;
}

void checkKey() 
{  
  if(keyIsPressed[38])rofl.addForce(0, -150000); //UP
  if(keyIsPressed[40])rofl.addForce(0, 150000); //DOWN
  if(keyIsPressed[37])rofl.addForce(-150000, 0); //LEFT
  if(keyIsPressed[39])rofl.addForce(150000, 0); //RIGHT

  if(keyIsPressed[16])//SHIFT
  {
    if(keyIsPressed[38])rofl.addForce(0, -shiftForce); //UP
    if(keyIsPressed[40])rofl.addForce(0, shiftForce); //DOWN
    if(keyIsPressed[37])rofl.addForce(-shiftForce, 0); //LEFT
    if(keyIsPressed[39])rofl.addForce(shiftForce, 0); //RIGHT
  }

  if(keyIsPressed[83]) world.step();
}

/* MOUSE METHODS */
void mousePressed()
{
  if(!isMouseOver())
  {
    switch(shape1)
    {
    case 1:
      if(count == boxes.length)
        println("too many boxes!");
      else if(keyIsPressed[17])
      {
        int color1 = (int)random(0, 255);
        int color2 = (int)random(0, 255);
        int color3 = (int)random(0, 255);
        boxes[count] = new PPBox(maxSize, maxSize);
        boxes[count].setPosition(mouseX, mouseY);
        boxes[count].setStrokeWidth(1);
        boxes[count].setRotation(0.0);
        boxes[count].setFillColor(new Color(color1, color2, color3));    
        boxes[count].setStrokeColor(new Color(color1, color2, color3));
        boxes[count].setMass(random(10));
        world.add(boxes[count]);
        count++;
      }
      else
      {
        int color1 = (int)random(0, 255);
        int color2 = (int)random(0, 255);
        int color3 = (int)random(0, 255);
        boxes[count] = new PPBox(random(5, maxSize), random(5, maxSize));
        boxes[count].setPosition(mouseX, mouseY);
        boxes[count].setStrokeWidth(1);
        boxes[count].setRotation(0.0);
        boxes[count].setFillColor(new Color(color1, color2, color3));    
        boxes[count].setStrokeColor(new Color(color1, color2, color3));
        boxes[count].setMass(random(5));
        world.add(boxes[count]);
        count++;
      }
      break;
    case 2:
      if(cCount == circles.length)
        println("too many Circles!");
      else if(keyIsPressed[17])
      {
        int color1 = (int)random(0, 255);
        int color2 = (int)random(0, 255);
        int color3 = (int)random(0, 255);
        circles[cCount] = new PPCircle(maxSize);
        circles[cCount].setPosition(mouseX, mouseY);
        circles[cCount].setStrokeWidth(1);
        circles[cCount].setRotation(0.0);
        circles[cCount].setFillColor(new Color(color1, color2, color3));    
        circles[cCount].setStrokeColor(new Color(color1, color2, color3));
        circles[cCount].setMass(random(10));
        world.add(circles[cCount]);
        cCount++;
      }
      else
      {
        int color1 = (int)random(0, 255);
        int color2 = (int)random(0, 255);
        int color3 = (int)random(0, 255);
        circles[cCount] = new PPCircle(random(5, maxSize));
        circles[cCount].setPosition(mouseX, mouseY);
        circles[cCount].setStrokeWidth(1);
        circles[cCount].setRotation(0.0);
        circles[cCount].setFillColor(new Color(color1, color2, color3));    
        circles[cCount].setStrokeColor(new Color(color1, color2, color3));
        circles[cCount].setMass(random(10));
        world.add(circles[cCount]);
        cCount++;
      }
      break;
    }
  }
}

boolean isMouseOver()
{
  /* MAIN BUTTONS */
  if(mouseX >= 11 && mouseX <= 50 && mouseY >= 11 && mouseY <= 85)
    return true;
  /* GRAVITY BUTTON */
  else if(mouseX >= 11 && mouseX <= 75 && mouseY >= 86 && mouseY <= 99)
    return true;
  /* CLOSE BUTTON */
  else if(mouseX >= (width-17) && mouseX <= (width-6) && mouseY >= 8 && mouseY <= 19)
    return true;
  else if((mouseX >= 11 && mouseX <= 19 && mouseY >= 105 && mouseY <= 113)
    || (mouseX >= 11 && mouseX <= 19 && mouseY >= 119 && mouseY <= 127))
    return true;
  else return false;
}

/* BUTTON METHODS */
void Gravity(float num)
{
  world.setGravity(0, num);
}

void force(int num)
{
  shiftForce = num * 10000;
}

void size(int num)
{
  maxSize = num;
}

void zero()
{
  control.controller("Gravity").setValue(0);
}

void friction(int num)
{
  world.setEdgesFriction(num);
}

void rest(float num)
{
  world.setEdgesRestitution(num);
}

void damping(float num)
{
  world.setDamping(num);
}

void X()
{
  exit();
}

void shapes(int num)
{
  switch(num)
  {
  case 1:
    shape1 = 1;
    break;
  case 2:
    shape1 = 2;
    break;
  }
}

void spin(float num)
{
  rotation = num;

  rofl.setAngularVelocity(rotation);
}

void stop()
{
  // always close Minim audio classes when you are done with them
  //hit.close();
  //minim.stop();

  println("bye!");

  super.stop();
}



