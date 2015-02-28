
import controlP5.*;

//import library to take in user input for mass and velocity
import controlP5.*;
ControlP5 cp5;
Textfield mass1, velocity1, mass2, velocity2;

Block block1, block2, block3; //the blocks that move in the simulator
PFont f; //PFont
boolean startClicked, resetClicked, inelastic = true, combine = true;

void setup() {
  size(1280, 600);
  background(255);
  stroke(0);


  //draw the START and RESET circles
  strokeWeight(0);
  fill(0, 255, 0);
  ellipse(width * 0.05, height * 0.1, 60, 60);
  fill(255, 0, 0);
  ellipse(width * 0.15, height * 0.1, 60, 60);
  
  
  //draw the rectangles
  block1 = new Block( width * 0.125, height * 0.75, width * 0.075, height * 0.05, 1, 5 );
  block2 = new Block( width * 0.825, height * 0.75, width * 0.075, height * 0.05, 1, -5 );
  drawBlocksElastic();
  line( 0, height * 0.8, width, height * 0.8);
  
  //add the text
  addText();
}

void draw() {
  
  if(startClicked) {
    if( storeValues() ) {
      if( collisionDetection() ) {
        if(combine) {
          block1.setVelocity( block1.velocity * -1 );
          block2.setVelocity( block2.velocity * -1 );
        } else {
          drawBlocksInelastic();
        }
        frameRate(1);
      }
      
      if(inelastic && !combine) {
        eraseBlocks();
        block3.move();
        drawBlocksInelastic();
      } else {
        eraseBlocks();
        block1.move();
        block2.move();
        
        drawBlocksElastic();
      }
    }
  } else if(resetClicked) {
    resetSim();
  } else {
    drawBlocksElastic();
  }
}

//check to see if the mouse is clicked inside either the START or RESET circle///////////////////////////////////////////////
void mouseClicked() {
  if( (mouseX <= width * 0.05 + 30 && mouseX >= width * 0.05 - 30) && (mouseY <= height * 0.1 + 30 && mouseY >= height * 0.1 - 30) ) {
    storeValues();
    startClicked = true;
    resetClicked = false;
  } else if ( (mouseX <= width * 0.15 + 30 && mouseX >= width * 0.15 - 30) && (mouseY <= height * 0.1 + 30 && mouseY >= height * 0.1 - 30) ) {
    resetClicked = true;
    startClicked = false;
  }
}

//resets the simulator back to the starting state except keeping the mass and velocities////////////////////////////////////////////////
void resetSim() {
  
  eraseBlocks();  
  
  block1.location.x = width*0.125;
  block1.location.y = height*0.75;
  block2.location.x=width*0.825;
  block2.location.y = height*0.75;
  /*
  block1.location.set(width * 0.125, height * 0.75);
  block2.location.set(width * 0.825, height * 0.75);
  */
  resetClicked = false;
  combine = true;
  drawBlocksElastic();
}

//a Block class representing the two rectangles in the simulator////////////////////////////////////////////////////////////////////
class Block {
  float mass, velocity, blockWidth, blockHeight;
  PVector location;
  
  Block(float x, float y, float w, float h) {
    location = new PVector(x, y);
    blockWidth = w;
    blockHeight = h;
    mass = 1.0;
    velocity = 0.0;
  }
  
  Block(float x, float y, float w, float h, float m, float v) {
    location = new PVector(x, y);
    blockWidth = w;
    blockHeight = h;
    mass = m;
    velocity = v;
  }
  
  //when move() is called, draws a white rectangle with no border
  void move() {
    location.x += velocity;
  }
  
  void setVelocity(float v) {
    velocity = v;
  }
  
}

//helper method to detect if the two blocks collide
boolean collisionDetection() {
  println("running");
  if(  (block1.location.x + block1.blockWidth) >= block2.location.x ) {
    println("detecting");
    return true;
  }
  return false;
}

//helper method to draw the rectangles in the simulator/////////////////////////////////////////////////////////////////////////////////////
void drawBlocksElastic() {
  stroke(0);
  strokeWeight(1);
  fill(0,255,0);
  rect( block1.location.x , block1.location.y, block1.blockWidth, block1.blockHeight );
  fill(255,0,0);
  rect( block2.location.x, block2.location.y, block2.blockWidth, block2.blockHeight );
}

void drawBlocksInelastic() {
  stroke(0);
  strokeWeight(1);
  fill(255, 255, 0);
  if(combine) {
    block3 = new Block(block1.location.x, block1.location.y, block1.blockWidth + block2.blockWidth, block1.blockHeight + block2.blockHeight, block1.mass + block2.mass, block1.velocity + block2.velocity);
    combine = false;
  }
  rect(block3.location.x, block3.location.y, block3.blockWidth, block3.blockHeight);
}

//helper method to erase the rectangles///////////////////////////////////////////////////////////////////////////////////////////////////////
void eraseBlocks() {
  noStroke();
  fill(255);
  rect(0, height * 0.75, width, height * 0.05);
  stroke(0);
}

//helper method to store the values typed to the appropriate fields in the repsective blocks, if the values are good, return true, if not, return false
boolean storeValues() {
  
  String m1 = mass1.getText().replaceAll("[a-zA-Z]", "");
  String v1 = velocity1.getText().replaceAll("[a-zA-Z]", "");
  String m2 = mass2.getText().replaceAll("[a-zA-Z]", "");
  String v2 = velocity2.getText().replaceAll("[a-zA-Z]", "");
  
  if(m1.length() > 0 && v1.length() > 0 && m2.length() > 0 && v2.length() > 0) {
    block1.mass = Float.parseFloat( m1 );  
    block1.velocity = Float.parseFloat( v1 );
    block2.mass = Float.parseFloat( m2 );
    block2.velocity = Float.parseFloat( v2 );
  } else {
    return false;
  }
  return true;
}

//helper method to add the text to the screen//////////////////////////////////////////////////////////////////////////////////////////
void addText() {
  //add the text to the circles
  f = createFont("Ubuntu Bold", 19, true);
  textFont(f, 19);
  fill(0);
  strokeWeight(1);
  text("START", width * 0.05 - 30, height * 0.1 + 5);
  text("RESET", width * 0.15 - 30, height * 0.1 + 5);
  
  //add the text and textfield for setting the values of mass and velocity
  text("Set mass 1: ", width * 0.125 - 100, height * 0.75 - 150);
  text("Set velocity 1: ", width * 0.125 - 100, height * 0.75 - 50);
  text("Set mass 2: ", width * 0.825 - 100, height * 0.75 - 150);
  text("Set velocity 2: ", width * 0.825 - 100, height * 0.75 - 50);
    
  cp5 = new ControlP5(this);
  mass1 = cp5.addTextfield("Set mass 1: ", int(width * 0.125 + 10), int(height * 0.75 - 168), 100, 25);
  velocity1 = cp5.addTextfield("Set velocity 1: ", int(width * 0.125 + 35), int(height * 0.75 - 68), 100, 25);
  mass2 = cp5.addTextfield("Set mass 2: ", int(width * 0.825 + 10), int(height * 0.75 - 168), 100, 25);
  velocity2 = cp5.addTextfield("Set velocity 2: ", int(width * 0.825 + 35), int(height * 0.75 - 68), 100, 25);
  
  mass1.setFont(f).setText("" + block1.mass);
  velocity1.setFont(f).setText("" + block1.velocity);
  mass2.setFont(f).setText("" + block2.mass);
  velocity2.setFont(f).setText("" + block2.velocity);
}


