
/* This work is the final project for the mooc course 
 * "Introduction to Computational Arts: Processing"
 * The original idea came from the speed and acceleration 
 * demo of the book "The Code of Nature" by Daniel Shiffman
 * Implemeted with physical natures, this work gained its 
 * interesting features. In addition, the palette is from Kuler.
 * Thanks for all the benefits I got from your works. 
 *
 * PROJECT NAME: 
 * Flying Leaves
 * What was the last time you played with leaves? 
 * This work provided you with the power of attraction
 * and repulsion to play with 300 pieces at will.  
 * By interacting with the leaves, you can make 
 * wonderful screenshots.
 * Hope this work will recall you a peaceful windy spring day in the garden.
 * 
 * INSTRUCTION:
 * 0. Please ensure that there is a "Data" folder with the 
 *    image "background.png" inside it, note the data folder
 *    should be under this sketch's root folder. 
 *    (or you can search for the 3 expressions handleing image
 *     loading, comment them and uncomment the background() function
 *     to draw background from internal.)
 * 1. Click left mouse button to attract pieces;
 * 2. Click right mouse button to drive them away;
 * 3. press any key to eliminate the acceleration of each piece
 * (then they will keep their previous speed or stay still);
 * press s or S key to save screenshots;
 *
 *(I like to click and do not release the left mouse button to 
 * attract all the pieces, until suddently release left and click
 * right mouse button to blow them awway; If there were pieces too dense
 * I just cannot feel blowing them apart :))
 *
 * Author: Chen Qiao (East China Normal University, Shanghai, China) 
 * 
 * 2-27-2014
 */

//background image 
//(comment this if no background picture in your data folder)
PImage background;

//palette from kuler
color[] palette = {#85DB18, #CDE855, #F5F6D4, #A7C520, #493F0B};

//number of shapes per row, per column, and the size of 
//square boxes(oRectSize) that cantain them 
int numRow = 20;
int numColumn = 15;
int oRectSize = 40;

//store the 300 movers in this work
Mover[] movers = new Mover[300]; 

void setup() {
  size(800,600);
  smooth();
  //(comment this if no background picture in your data folder)
  background = loadImage("background.png");
    
  int count = 0;//counter of the movers
  
  //this nested loop creates & initializes every mover in its
  //position and desides the number of vertices each mover object has
  for(int gridY = 0; gridY < numColumn; gridY++) {
    for(int gridX = 0; gridX < numRow; gridX++) {
      int posX = width/numRow * gridX;  
      int posY = width/numColumn * gridY; 
      int nVertex = int(random(4,21));  
      movers[count++] = new Mover(posX, posY, nVertex); 
    }
  }
}

void draw() {
  //draw background image
  //(comment this if no background picture in your data folder
  // and uncomment the background() function to draw background instead)
  image(background, 0, 0);   
  //background(255);
  
  //a key step to ensure the sequence of the random numbers the same
  //for each drawed frame;
  randomSeed(0);

  //for each frame, update the movers' current position and
  //display them
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].display(); 
  }
}


/**
 * The original class Mover comes from the book
 * "The Natural of Code" ( recommend reading ) by Daniel Shiffman.
 * In this work, the Mover is modified to handle mouse/keyboard click interaction,
 * draw random-vertex polygons, rotate, check screen frame, etc.
 */
class Mover {

  // The Mover tracks location, velocity, acceleration (orignal version, OV) 
  PVector location;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed (OV)
  float topspeed;
 
  //number of vertices the mover object has  
  int nVertex;

  //fill Col;
  color fillCol;
  
  //the sets for x,y coordinates of vertices
  float[] xSet;
  float[] ySet;
  
  //self rotating angles
  float angle = 0;
  //deside direction of rotation
  float direction = random(5) > 3? -1:1;
  
  //Mover constructer, takes in position coordinates in screen and its number of vertices
  Mover(int x, int y, int nVertex) {
    this.nVertex = nVertex;
    //location,velocity & acceleration all have x,y values and directions so they
    // are stored in vectors for easy access
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topspeed = 2;
    
    //choose a color from palette as the fill() color
    fillCol = palette[int(random(5))];
    
    //initialize x, y sets according to number of vertices 
    //each vertex has a small offset from the normal position
    //according to current mouse cordinates
    xSet = new float[nVertex];
    ySet = new float[nVertex];    
    for(int i=0; i<nVertex; i++){
       xSet[i] = mouseX/20 * random(-1, 1);
       ySet[i] = mouseY/15 * random(-1, 1);
    }   
  }

  //updates the acceleration, velocity,ratation angle, and position 
  void update() {
     
     //if any key is pressed, eliminate the acceleration,
     //so the mover will keep its current state(still or moveing with a constant velocity)
     if(keyPressed) { 
       acceleration.mult(0);
     }
     
     
     // if left mouse pressed, the direction of acceleration is to the last clicked 
     // position of mouse curser, right mouse the opposite direction.
     // in short, left click to attract movers, right to drive them away. 
     if(mousePressed){
       
     // Compute a vector that points from location to mouse (OV)
      PVector mouse = new PVector(mouseX,mouseY);
      
      //attract or drive away
      if(mouseButton == LEFT)  {
        acceleration = PVector.sub(mouse,location);
      } else {
        acceleration = PVector.sub(location,mouse);
      }
      
      // Set magnitude of acceleration(OV)
      // modified values to fit situation of this work
      acceleration.setMag(0.1);
      acceleration.normalize();
      acceleration.mult(0.05);      
    } 
  
    // Velocity changes according to acceleration (OV)
    velocity.add(acceleration);
    // Limit the velocity by topspeed (OV)
    velocity.limit(topspeed);
    // Location changes by velocity (OV)
    location.add(velocity);
    // rotate the movers
    angle += direction * PI/180.0;
  }

  //for the mover to draw itself
  void display() {
 
    noStroke();
    fill(fillCol, 60);
    
    //draw process
    pushMatrix();
    translate(location.x, location.y);
    //rotate the mover
    rotate(angle);
    
    //draw the rotated polygons
    beginShape();
    vertex(xSet[0], ySet[0]);
    for(int i = 1; i<nVertex - 1; i++){
       vertex(xSet[i] + oRectSize * random(-1, 1), ySet[i] + oRectSize*random(-1, 1));           
    }
    vertex(xSet[nVertex - 1], oRectSize+ySet[nVertex - 1]);
    endShape(CLOSE); 
    popMatrix();     
    bounce(); 
  }
  
  //check if the mover is out of view,
  //if so, reverse its direction of acceleration
  //in contrast to reverse the direction of speed,
  //this will give a simulation of "buffer state".
  void bounce() {
    if(location.x < 0 || location.x > width) {
       acceleration.mult(-1);
    }
    if(location.y < 0 || location.y > width) {
       acceleration.mult(-1);
    }
  
  }

}

void keyPressed() {
  //press s or S for saving snapshot.
  if(key == 'S' || key == 's') save(System.currentTimeMillis() + "snapshot.png"); 
}


