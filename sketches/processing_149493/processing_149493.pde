
//import library to take in user input for mass and velocity
import controlP5.*;
ControlP5 cp5;
Textfield mass1, velocity1, mass2, velocity2;

Block block1, block2, block3; //the blocks that move in the simulator
PFont f; //PFont
boolean startClicked, resetClicked, stored = false;
boolean inelastic = false, elastic = true, collide = false, collided = false;
float v1Initial, v2Initial;
float ke1Initial, ke2Initial;

void setup() {
  size(1280, 800);
  background(255);
  stroke(0);


  //draw the START and RESET circles
  strokeWeight(0);
  fill(0, 255, 0);
  ellipse(width * 0.05, height * 0.1, 60, 60);
  fill(255, 0, 0);
  ellipse(width * 0.15, height * 0.1, 60, 60);
  
  
  //create and draw the blocks
  block1 = new Block( width * 0.325, height * 0.75, width * 0.075, height * 0.05, 1, 5 );
  block2 = new Block( width * 0.625, height * 0.75, width * 0.075, height * 0.05, 1, -5 );
  drawBlocks();
  line( 0, height * 0.8, width, height * 0.8);
  
  //add the text
  addText();
}

void draw() {
  
  if(startClicked) {
    
    if( !stored ) {
      storeValues();
      v1Initial = block1.velocity;
      v2Initial = block2.velocity;
      calcKineticEnergy();
      stored = true;
    }
    
    if(stored) {
      if(!collided) {
        collisionDetection();
      }
      
      if(collide) {
        if(elastic) {
          block1.velocity = ( (v1Initial * (block1.mass - block2.mass)) + (2 * block2.mass * v2Initial) ) / (block1.mass + block2.mass);
          block2.velocity = ( (v2Initial * (block2.mass - block1.mass)) + (2 * block1.mass * v1Initial) ) / (block1.mass + block2.mass);
          fill(255,0,0);
          text("New velocity1: " + block1.velocity, width * 0.125 - 103, height * 0.75 - 143);
          text("New velocity2: " + block2.velocity, width * 0.825 - 103, height * 0.75 - 143);
        } else if(inelastic) {
          block3 = new Block(block1.location.x, block1.location.y, block1.blockWidth + block2.blockWidth, block1.blockHeight, block1.mass + block2.mass, 
                        (block1.mass * block1.velocity + block2.mass * block2.velocity) / (block1.mass + block2.mass) );
          addTextInelastic();
        }
        calcKineticEnergy();
        collide = false;
      }
      
      eraseBlocks();
      if(block3 == null) {
        block1.move();
        block2.move();
      } else {
        block3.move();
      }
      drawBlocks();
    }
  } else if(resetClicked) {
    resetSim();
  }
    
  /* old
  
  if(startClicked) { //if the user clicks the start circle
    if(!stored) { //if we havent stored the values to the appropriate blocks yet, store the values!
      storeValues();
    }
    if(!calc) { //if we havent calculated the initial kinetic energy yet, calculate!
      calcKineticEnergy();
      calc = true;
    }
    
    if( canStore ) { //storeValues() has already been called, so now we check if the store was successful
      if( collisionDetection() ) { //check if the two blocks have collide
        if(!collide) {
          if(elastic) {
            v1Final = ( (block1.velocity * (block1.mass - block2.mass)) + (2 * block2.mass * block2.velocity) ) / (block1.mass + block2.mass);
            v2Final = ( (block2.velocity * (block2.mass - block1.mass)) + (2 * block1.mass * block1.velocity) ) / (block1.mass + block2.mass);
            textFont(f, 19);
            text("" + v1Final, width * 0.125 + 300, height * 0.75 - 118);
            text("" + v2Final, width * 0.825 + 300, height * 0.75 - 118);
            //velocity1.setFont(f).setText("" + v1Final);
            //velocity2.setFont(f).setText("" + v2Final);
            stored = false;
            calc = false;
          }
          else if (inelastic) {
            v3Final = (block1.mass * block1.velocity + block2.mass * block2.velocity) / (block1.mass + block2.mass);
            block3 = new Block(block1.location.x, block1.location.y, block1.blockWidth + block2.blockWidth, block1.blockHeight, block1.mass + block2.mass, v3Final);
            calcKineticEnergy();
          }
        }
      }
      
      if(inelastic) {
        eraseBlocks();
        if(combine) {
          block3.move();
        } else {
          block1.move();
          block2.move();
        }
      } else if (elastic) {
        eraseBlocks();
        block1.move();
        block2.move();
      }
    } else { //if the store wasnt successful, we don't do anything to the state of the environment but we reset the sim
      resetSim();
    }
    drawBlocks();
  } else if(resetClicked) {
    resetSim();
  }
  */
  
}

//check to see if the mouse click changes the state of the program///////////////////////////////////////////////
void mouseClicked() {
  //check to see if the click was either inside the start or reset button
  if( (mouseX <= width * 0.05 + 30 && mouseX >= width * 0.05 - 30) && (mouseY <= height * 0.1 + 30 && mouseY >= height * 0.1 - 30) ) {
    startClicked = true;
    resetClicked = false;
  } else if ( (mouseX <= width * 0.15 + 30 && mouseX >= width * 0.15 - 30) && (mouseY <= height * 0.1 + 30 && mouseY >= height * 0.1 - 30) ) {
    resetClicked = true;
    startClicked = false;
  }
}

//helper method to detect if either i, e, I, or E are pressed, which indicates a collision-type change/////////////////////////////////////////////////////////////////////////////
void keyPressed() {
  if(key == 'E' || key == 'e' || key == 'I' || key == 'i') { //check to see if either of the two keys are pressed
    //erase any of the text that indicates ELASTIC or INELASTIC
    textFont(f, 36);
    noStroke();
    fill(255);
    rect(width * 0.85, height * 0.05, width, 50);
    stroke(0);
    fill(0);
    if(key == 'E' || key == 'e') { //if hitting E, display ELASTIC
      text("ELASTIC", width * 0.85, height * 0.1);
      elastic = true;
      inelastic = false;
    } else if(key == 'I' || key == 'i') { //if hitting I, display INELASTIC
      text("INELASTIC", width * 0.85, height * 0.1);
      elastic = false;
      inelastic = true;
    }
    textFont(f, 19);  
  }
}

//resets the simulator back to the starting state except keeping the mass and velocities////////////////////////////////////////////////
void resetSim() {
  
  eraseBlocks();  
  
  //resets the x-y-location of the two initial blocks
  block1.location.x = width * 0.325;
  block1.location.y = height * 0.75;
  block2.location.x = width * 0.625;
  block2.location.y = height * 0.75;
  //resets the velocities of the blocks to the values set before hitting START
  block1.velocity = v1Initial;
  block2.velocity = v2Initial;
  
  //erases the text for block3 (the block as a result of an inelastic collision) and the kinetic energies for the initial blocks
  noStroke();
  fill(255);
  if(elastic) {
    rect(width * 0.125 - 103, height * 0.75 - 163, width, 50); //new velocity display
    rect(width * 0.125 - 14, height * 0.4 + 215, width, 50); // ke difference
  } else {
    rect(width * 0.55 - 10, height * 0.25 - 25, 150, 40); //block3m
    rect(width * 0.55 + 5, height * 0.25 + 25, 150, 40); //block3v
    rect(width * 0.55 - 8, height * 0.25 + 75, 150, 40); //block3ke
  }
  rect(width * 0.125 + 10, height * 0.4 + 180, 200, 50); // ke1
  rect(width * 0.825 + 10, height * 0.4 + 180, 200, 50); // ke2
  //resets all booleans necessary to keep the environment working
  resetClicked = false;
  stored = false;
  collide = false;
  collided = false;
  block3 = null;
  
  drawBlocks();
  
}

//a Block class representing the two rectangles in the simulator////////////////////////////////////////////////////////////////////
class Block {
  float mass, velocity, blockWidth, blockHeight, kineticEnergy;
  PVector location;
  //basic constructor, sets a default mass and velocity
  Block(float x, float y, float w, float h) {
    location = new PVector(x, y);
    blockWidth = w;
    blockHeight = h;
    mass = 1.0;
    velocity = 0.0;
  }
  //constructor for explicitly setting the mass and velocity
  Block(float x, float y, float w, float h, float m, float v) {
    location = new PVector(x, y);
    blockWidth = w;
    blockHeight = h;
    mass = m;
    velocity = v;
  }
  
  //when move() is called, moves the block by adding the velocity to the x-location
  void move() {
    location.x += velocity;
  }
}

void calcKineticEnergy() {
  if(elastic && collide) {
    block1.kineticEnergy = 0.5 * block1.mass * (block1.velocity * block1.velocity);
    block2.kineticEnergy = 0.5 * block2.mass * (block2.velocity * block2.velocity);
  } else if(inelastic && collide) {
    block3.kineticEnergy = 0.5 * block3.mass * (block3.velocity * block3.velocity);
  } else if(!collide) {
    block1.kineticEnergy = 0.5 * block1.mass * (block1.velocity * block1.velocity);
    block2.kineticEnergy = 0.5 * block2.mass * (block2.velocity * block2.velocity);
    ke1Initial = block1.kineticEnergy;
    ke2Initial = block2.kineticEnergy;
  }
  addTextKE();
}
    

//helper method to detect if the two blocks collide, if they collide, return true, if not, return false/////////////////////////////////////////////////////////////////////////////////////////////////////
void collisionDetection() {
  if( (block1.location.x + block1.blockWidth) >= block2.location.x ) {
    collide = true;
    collided = true;
  }
}

//helper method to store the values typed to the appropriate fields in the respective blocks, if the values are good, we canstore and we have stored, if not, we cannot store and stored remains false////////////////////////////////
void storeValues() {
  mass1.setText( mass1.getText().replaceAll("[^0-9-.]", "") );
  velocity1.setText( velocity1.getText().replaceAll("[^0-9-.]", "") );
  mass2.setText( mass2.getText().replaceAll("[^0-9-.]", "") );
  velocity2.setText( velocity2.getText().replaceAll("[^0-9-.]", "") );
  
  block1.mass = Float.parseFloat( mass1.getText() );  
  block1.velocity = Float.parseFloat( velocity1.getText() );
  block2.mass = Float.parseFloat( mass2.getText() );
  block2.velocity = Float.parseFloat( velocity2.getText() );
}

//helper method to draw the blocks in the simulator/////////////////////////////////////////////////////////////////////////////////////
void drawBlocks() {
  stroke(0);
  strokeWeight(1);
  if(inelastic && collided) { //if the two blocks combined, draw the resulting block
    fill(255, 255, 0);
    rect(block3.location.x, block3.location.y, block3.blockWidth, block3.blockHeight);
  } else { //draw the two blocks
    fill(0,255,0);
    rect( block1.location.x , block1.location.y, block1.blockWidth, block1.blockHeight );
    fill(255,0,0);
    rect( block2.location.x, block2.location.y, block2.blockWidth, block2.blockHeight );
  }
}

//helper method to erase any blocks///////////////////////////////////////////////////////////////////////////////////////////////////////
void eraseBlocks() {
  noStroke();
  fill(255);
  rect(0, height * 0.75, width, height * 0.05);
  stroke(0);
}

//helper method to add the text to the screen//////////////////////////////////////////////////////////////////////////////////////////
void addText() {
  //display text to correctly label the START and RESET circles
  f = createFont("Ubuntu Bold", 19, true);
  textFont(f, 19);
  fill(0);
  strokeWeight(1);
  text("START", width * 0.05 - 30, height * 0.1 + 5);
  text("RESET", width * 0.15 - 30, height * 0.1 + 5);
  
  //display the text and add textfield for setting the values of mass and velocity
  text("Current mass 1: ", width * 0.125 - 135, height * 0.4);
  text("Current velocity 1: ", width * 0.125 - 135, height * 0.4 + 100);
  text("Kinetic energy 1: ", width * 0.125 - 134, height * 0.4 + 200);
  text("Current mass 2: ", width * 0.825 - 135, height * 0.4);
  text("Current velocity 2: ", width * 0.825 - 135, height * 0.4 + 100);
  text("Kinetic energy 2: ", width * 0.825 - 134, height * 0.4 + 200);
  
  text("Current mass 3: ", width * 0.43, height * 0.25);
  text("Current velocity 3: ", width * 0.43, height * 0.25 + 50);
  text("Kinetic energy 3: ", width * 0.43, height * 0.25 + 100);
  
  cp5 = new ControlP5(this);
  mass1 = cp5.addTextfield("m1", int(width * 0.125 + 10), int(height * 0.4 - 18), 150, 25);
  velocity1 = cp5.addTextfield("v1", int(width * 0.125 + 25), int(height * 0.4 + 82), 150, 25);
  mass2 = cp5.addTextfield("m2", int(width * 0.825 + 10), int(height * 0.4 - 18), 150, 25);
  velocity2 = cp5.addTextfield("v2", int(width * 0.825 + 25), int(height * 0.4 + 82), 150, 25);
  
  //set the current mass and velocities to the blocks
  mass1.setFont(f).setText("" + block1.mass);
  velocity1.setFont(f).setText("" + block1.velocity);
  mass2.setFont(f).setText("" + block2.mass);
  velocity2.setFont(f).setText("" + block2.velocity);
  
  //display the text to tell user how to change the collision type
  textFont(f, 14);
  text("Press I or E to change collision type: ", width * 0.665, height * 0.1);
  textFont(f, 36);
  text("ELASTIC", width * 0.85, height * 0.1);
  textFont(f, 19);
}

//helper method for, in the case of an inelastic collision, adding the text to show the mass, velocity, and kinetic energy of the combined block///////////////////////////////////////////////////////////////////
void addTextInelastic() {
  fill(255, 0, 0);
  text("" + block3.mass, width * 0.55 - 10, height * 0.25);
  text("" + block3.velocity, width * 0.55 + 5, height * 0.25 + 50);
}

void addTextKE() {
  textFont(f, 19);
  strokeWeight(1);
  if(elastic && collide) {
    fill(0,0,255);
    text("" + block1.kineticEnergy, width * 0.125 + 110, height * 0.4 + 200);
    text("" + block2.kineticEnergy, width * 0.825 + 110, height * 0.4 + 200);
    fill(255,0,0);
    text("Difference: " + (block1.kineticEnergy - ke1Initial) , width * 0.125 - 14, height * 0.4 + 235);
    text("Difference: " + (block2.kineticEnergy - ke2Initial) , width * 0.825 - 14, height * 0.4 + 235);
  } else if(inelastic && collide) {
    fill(255,0,0);
    text("" + block3.kineticEnergy, width * 0.55 - 8, height * 0.25 + 100);
  } else if(!collide) {
    text("" + block1.kineticEnergy, width * 0.125 + 10, height * 0.4 + 200);
    text("" + block2.kineticEnergy, width * 0.825 + 10, height * 0.4 + 200);
  }
}


