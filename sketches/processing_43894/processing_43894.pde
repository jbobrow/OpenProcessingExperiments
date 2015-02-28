

//Constructor.
//Defines and initialises global instance variables.

PFont font;
int n = mouseX;
int m= mouseY;
int a=50;
int howManyAreAlive=0;
int howManyClicks=0;
int time=0;
int timeCounter=0;
boolean startTimer=false;
color c = color(random(255), random(255), random(255));

//Defines our array of spots of size a.
Spot[] sps = new Spot[a];


//Setup class, defines required processing commands
//Sets up our array and fills it with Spots
void setup() {
  font = loadFont("FreeMono-12.vlw");
  textFont(font, 12);
  frameRate(60);
  size(600, 600);
  smooth();
  noStroke();
  ellipseMode(CENTER_RADIUS);
  randomSeed(0);

  //Array set up.
  //Sets our "howmanyalive" variable to how many spots are filled into the array.
  for (int i=0; i<sps.length; i++) {
    howManyAreAlive++;
    sps[i] = new Spot();
  }
}

//Main draw function, Draws background and interface.
//Calls the updatedisplay function from our spot class.
//Contains our timer function.
//Calls gameOver once all spots are dead.
void draw() {

  //println(howManyClicks);
  //println(howManyAreAlive);
  //println(time);
  fill(255);
  rect(0, 0, width, height);
  fill(0);
  stroke(0);
  textSize(14);
  textAlign(LEFT);
  fill(255);
  rect(5, 580, 200, 20);
  rect(200, 580, 200, 20);
  rect(400, 580, 195, 20);
  fill(0);
  text("Time:", 10, 595);
  text(time, 50, 595);
  text("CLicks:", 210, 595);
  text(howManyClicks, 265, 595);
  text("Balls Left:", 410, 595);
  text(howManyAreAlive, 505, 595);
  noStroke();
  fill(c, 120);

  //Our timer method.
  //Only starts once the mouse is clicked.
  //Uses 60 as the draw function is called at 60fps.
  //Checks to make sure there are still alive spots, once all dead the timer stops.
  if (startTimer==true) {
    if (howManyAreAlive!=0) {
      timeCounter++; 
      if (timeCounter==60) {
        timeCounter=0;
        time++;
      }
    }
    //Checks to see if any balls are remaining.
    //If all dead, it calls our game over function, which stops the game.
    if (howManyAreAlive==0) {
      gameOver();
    }
  }

  //Updates our spots position and draws them on screen, called from our Spots class.
  for (int i=0; i<sps.length; i++) {

    sps[i].updateDisplay();

    //Function to call the accessor methods contained in our spots class.
    //This allows our collision method to recieve data for every spot in the array.
    //Passes the accessed value into our collision method, contained within the Spots class. 
    for (int j = 0; j<sps.length; j++) {
      if (i != j) {
        sps[i].collision(sps[j].accessX(), sps[j].accessY(), sps[j].accessR());
      }
    }
  }
}


//Our spot class, contains all the movement and size controls of our spots.
//Update method is called by the draw function to draw them on screen.
class Spot {

  //Constructor for class Spot
  //Defines and initialises local instance variables.
  boolean alive = true;
  float radius = 15.0;  // Radius of the circle
  float x = random(radius, width-radius);       // X-coordinate
  float y = random(radius, height-radius);       // Y-coordinate
  float speedX = random(0.4, 1.0);   // Speed of motion on the x-axis
  float speedY = random(0.4, 1.0);   // Speed of motion on the y-axis

  int directionX = 1;   // Direction of motion on the x-axis
  int directionY = -1;  // Direction of motion on the y-axis


  //Movement methods for our Spot.
  Spot() {
    float r = random(1.0);
    if (r < .25) {
      directionX = 1;
      directionY = 1;
    } 
    else if (r < .5) {
      directionX = -1;
      directionY = 1;
    } 
    else if (r < .75) {
      directionX = 1;
      directionY = -1;
    } 
    else {
      directionX = -1;
      directionY = -1;
    }
  }

  //Collision detection method.
  //Recieves array data for individual spots from the method in our draw function.
  void  collision(float otherX, float otherY, float otherR) {
    if (alive) {
      if (radius>15  || otherR > 15) {  
        float distance = dist(x, y, otherX, otherY);
        distance = distance-otherR-radius;
        if (distance<=0) {
          radius++;
          if (radius >=60) {
            radius=0;
            x=-600;
            y=-600;
            alive = false;
            howManyAreAlive--;
          }
        }
      }
    }
  }

  //ACCESSOR METHODS
  //Allows vlaues to be passed from this class to another
  //Can get Xpos, Ypos, Radius and whether the spot is alive or dead.
  boolean accessAlive() {
    return alive;
  }

  float accessR() {
    return radius;
  } 

  float accessX() {
    return x;
  }

  float accessY() {
    return y;
  }




  //Display Update Method
  //Updates the spots location on the screen.
  //Only applies to alive spots.
  void updateDisplay() {

    if (alive == true) {

      ellipse(x, y, radius, radius);
      x += speedX * directionX;
      if ((x > width-radius) || (x < radius)) {
        directionX = -directionX;  // Change direction
      }
      y += speedY * directionY;
      if ((y > height-radius) || (y < radius)) {
        directionY = -directionY;  // Change direction
      }
    }

    //User Input Method
    //Checks for mouse input, if clicked on a spot, its radius will increase.
    //Also allows the user to pop a spot, if its radius reaches 60, it becomes dead.
    //This reduces the counter of "howmanyarealive by one".
    if (mousePressed) {

      ellipse (mouseX, mouseY, 5, 5);

      float z = dist(mouseX, mouseY, x, y);
      if (z <= 15) {
        radius++;
      }
    }
    if (radius>=60) {
      howManyAreAlive--;
      alive = false;
      radius=0;
      x=-600;
      y=-600;
    }
  }
}


//CONTROL METHODS

//This method checks for a mouse press.
//If the mouse is clicked it starts our timer and adds one to our click counter.
void mousePressed() {
  if (howManyAreAlive!=0) {
    howManyClicks++;
    startTimer=true;
  }
}

//Game Over
//This is called once all the spots are dead.
//Once all spots are dead, our timer and click counter both stop.
//Final values are displayed in the middle of the screen along with the final score.
void gameOver() {

  //println((time*(-1)+(howManyClicks*(-1))));
  fill(0);
  textSize(12);
  textAlign(CENTER);
  text("Well Done", 300, 280);
  text("Total Time = " + time + " seconds", 300, 300);
  text("Total Clicks = " + howManyClicks, 300, 320);
  text("Score = " + (500+(time*(-1)+(howManyClicks*(-1)))), 300, 340);
}


