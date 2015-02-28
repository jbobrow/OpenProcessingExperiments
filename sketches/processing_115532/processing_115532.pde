
/*This is the class that contains all the background images.
This class is used primarily to prevent having to put excessive
code in the Game class and tidys up the void function.
*/
class Background
{
  
  void displayBackground()
  {
    
  //Bottom Grass
  noStroke();
  fill(129, 175, 16);
  quad(0, height, width, height, width, 550, 0, 550);
  
  //Middle Grass
  noStroke();
  fill(129, 175, 16);
  quad(0, 325, width, 325, width, 275, 0,275);
  
  //Draws fence line
  stroke(0);
  strokeWeight(3);
  line(0, 300, width, 300);
  strokeWeight(1);
  
  //Loop for fence bollards
  for(int fence=40; fence<width; fence=fence+60)
  {
   noStroke();
   fill(255);
   ellipse(fence, 300, 20, 20);
   fill(0);
   ellipse(fence, 300, 10, 10);
   fill(255);
   ellipse(fence, 300, 5, 5);
  }
  
  //Road
  fill(150);
  quad(0, 550, width, 550, width, 325, 0, 325);
  
  //Loop for the lane lines
  for(int lane=5; lane<width; lane=lane+20)
 {
   for(int lanes=370; lanes<550; lanes=lanes+45)
   {
     stroke(255);
     line(lane, lanes, lane+10, lanes);
   }
 }
 //Loop for drawing the waterlillys 
 for(int lilly=25; lilly<width; lilly=lilly+150)
 {
   stroke(0);
   fill(17, 194, 62);
   ellipse(lilly, 25, 50, 50);  
 }
   //Displays Lives and Score Counter
   fill(255);
   text("Lives: " + life,15,585); //Insert text
   text("Score: " + score,395,585); //Insert text

}
}

/*This is the class for displaying, running and modyifying
all the vehicles on screen.
*/
class Vehicle {
  //color variables
  int c; //c will be our colour function i.e. c=(red,green,blue)
  float r;//red
  float g;//green
  float b;//blue
  //coordinates
  float xpos;
  float ypos;
  //size and speed
  float speed;
  float Wsize;
  float Hsize;

  //Vehicle class constructor
  Vehicle(float tx, float ty, float tspeed)
  {
    //random colour and size for objects
    r=random(1, 255);
    g=random(1, 255);
    b=random(1, 255);
    c=color(r, g, b);
    speed=tspeed;
    xpos=tx;
    ypos=ty;
    Wsize=random(55, 65);
    Hsize=random(30, 35);
  }
  //method to call other methods, to simplify
  void populate()
  {   
    traffic();
    display();
  } 
  // display method to display vehicles
  void display()
  { 
    stroke(0.5);
    fill(c);
    rect(xpos, ypos, Wsize, Hsize);
  }
  // movement method
  void traffic()
  {
    xpos=xpos+speed;
    // resets the car and its variables once it goes out of screen,
    // every new car will be different 
    if (xpos<0 || xpos>width)
    {
      getX();
      r=random(1, 255);
      g=random(1, 255);
      b=random(1, 255);
      c=color(r, g, b);
      Wsize=random(55, 65);
      Hsize=random(30, 35);
    }
  //collision method for when car collides with the frog
  //Using return method for frog coordinates
  float xPos=frog1.getFrogX();
  float yPos=frog1.getFrogY();
  if (xPos > xpos - 16 && xPos < xpos + 16 && yPos > ypos && yPos < ypos + 12) { 
      xPos = width/2;
      yPos = 585;
      life = life - 1;
      score = score - 25;
    }
  } 
  
  // new position for car after it goes out of screen
  void getX()
  {
    if (ypos==345 || ypos== 390 || ypos== 435) 
    {
      xpos=0;
    }  
    if (ypos==480 || ypos==525)
    {
      xpos=500;
    }
   // methods to get car variables for collision method 
  }
  float getCarsX()
  {
    return xpos;
  }
  float getCarsY()
  { 
    return ypos;
  }
  float getCarsWidth()
  {
    return Wsize;
  }
  float getCarsHeight()
  {
    return Hsize;
  }
  
}


/*This is the class that will contain the fields and methods enabling the frog to 
  be displayed, to move across the screen with user input, to have boundary control, 
  to rotate the frog when moving in certain directions and to enable the collision detection with
  the vehicles and the collision method.
*/  
class Frog{
  //Frog variables.
  float xPos;
  float yPos;
  float width_of_frog;
  float speed;
  //Assigns initial values.
  Frog(){
    xPos = width/2;
    yPos = 585;
    speed = 3;
    }
  //Method for displaying the frog, using mostly ellipses.
  void displayFrog(){
    ellipseMode(CENTER); 
    stroke(0);
    fill(255);
    ellipse(xPos-6,yPos-10,8,8); 
    ellipse(xPos+6,yPos-10,8,8); 
    fill(0,180,0);
    ellipse(xPos-10,yPos+4,8,8); 
    ellipse(xPos+10,yPos+4,8,8); 
    ellipse(xPos,yPos,20,20); 
  }
   /*This moves the frog using classic WASD movement. It also controls player speed
     by increasing or decreasing the integer changing the x/y co-ordinates.
   */  
   void moveFrog(){
   if(keyPressed){
     //Moves the frog left.
     if (key=='a') {
      xPos = xPos-speed;
    }
     //Moves the frog right.
     if (key=='d'){
      xPos = xPos+speed;
    }
     //Moves the frog up.
     if (key=='w'){
    yPos = yPos-speed;
    }
     //Moves the frog down.
     if (key=='s'){
       yPos = yPos+speed;
    }
   }
  }
  //Method for boundary control. It prevents the frog from moving off the screen.
  void boundaryFrog() { 
    if (xPos >= 490) { 
        xPos = 490; 
    }
    if (xPos <= 10) { 
        xPos = 10;
    }
    if (yPos >= 590) {
        yPos = 590; 
    }
    if (yPos <= 0) { 
        yPos = 0; 
    }

}

  //Combination method puting all the frog methods within 1 method
  void goFrog(){
    
    displayFrog();
    moveFrog();
    boundaryFrog();
  }
  
  //Methods to return frog variables for collision detection 
   float getFrogX()
  {
    return xPos;
  }
   float getFrogY()
  {
    return yPos;
  }
  float getFrogWidth()
  {
    return width_of_frog;
  }
    
  //Method for returning the frog to starting position
  void resetFrogPosition()
  {
    xPos = width/2;
    yPos = height/585;
  }
  
}

//initialising variables
Background gameBackground;
Vehicle[] cars;
Log[] logs;
Water[] waterStream;
Frog frog1;
int life = 5;
int score = 0;

void setup()
{
  size(500,600);
  smooth();
  textSize(24);
  gameBackground = new Background();
  waterStream = new Water[10];
  logs = new Log[7];
  cars = new Vehicle[10];
  unleashWater();
  unleashLogs();
  unleashCars();
  frog1 = new Frog();
}

void draw()
{
  //Sets the background colour to the same as the water
  //making life a little easier
  background(15, 31, 153);
  
  //Displays all the backgroud shapes drawn in the Background class
  gameBackground.displayBackground();
  
  //Loop to display and move cars
  for(int p=0; p<cars.length; p++)
  {
  cars[p].populate();
  }
  //Loop to display and move logs
  for(int l=0; l<logs.length; l++)
  {
  logs[l].goLogs();
  }
  //creates frog with player control
  frog1.goFrog();
  
  //If the frog has no more lives, reset the score and life count
  //returns frogs x and y co-ordinates
  float xPos=frog1.getFrogX();
  float yPos=frog1.getFrogY();
  if(life == 0) { 
    xPos = width/2;
    yPos = 585;
    life = 5;
    score = 0;
  }
  //If the frog reaches the top of the screen (lillys), add 100 to
  //the score and reset the frog's position
  if(xPos > 0 && xPos < 500 && yPos > 0 && yPos < 150) { 
    xPos = width/2;
    yPos = 580;
    score = score + 100; 
  }

  
}

// creates cars
void unleashCars()  
{   
  cars[0]= new Vehicle(160, 345, 4.5);
  cars[1]= new Vehicle(320, 345, 4.5);
  cars[2]= new Vehicle(240, 390, 1.0);
  cars[3]= new Vehicle(400, 390, 1.0);
  cars[4]= new Vehicle(160, 435, 2.5);
  cars[5]= new Vehicle(320, 435, 2.5);
  cars[6]= new Vehicle(80, 480, -4.5);
  cars[7]= new Vehicle(240, 480, -4.5);
  cars[8]= new Vehicle(160, 525, -1.5);
  cars[9]= new Vehicle(320, 525, -1.5);
} 

//creates logs
void unleashLogs()
{
  logs[0]= new Log(color(170, 120, 10), 0, 70, -2);
  logs[1]= new Log(color(170, 120, 10), 0, 112, 3);
  logs[2]= new Log(color(170, 120, 10), 0, 155, -2);
  logs[3]= new Log(color(170, 120, 10), 250, 155, -2);
  logs[4]= new Log(color(170, 120, 10), 0, 200, 1);
  logs[5]= new Log(color(170, 120, 10), 100, 245, -3);
  logs[6]= new Log(color(170, 120, 10), 350, 245, -3);
}

//creates water
void unleashWater()
{
  waterStream[0] = new Water(color(15, 31, 153),125,70,-2); 
  waterStream[1] = new Water(color(15, 31, 153),375,70,-2);
  waterStream[2] = new Water(color(15, 31, 153),125,112,3);
  waterStream[3] = new Water(color(15, 31, 153),375,112,3);
  waterStream[4] = new Water(color(15, 31, 153),375,155,-2);
  waterStream[5] = new Water(color(15, 31, 153),125,155,-2);
  waterStream[6] = new Water(color(15, 31, 153),125,200,1);
  waterStream[7] = new Water(color(15, 31, 153),375,200,1);
  waterStream[8] = new Water(color(15, 31, 153),225,245,-3);
  waterStream[9] = new Water(color(15, 31, 153),475,245,-3);

}


//This is the class for displaying the logs, moving the logs
//and calculating if the frog is on the log.

class Log {
  float xpos; 
  float ypos;
  float xspeed;
  color c;
 
  //Log constructor
  Log(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  // Method to display the logs 
  void displayLog() { 
    rectMode(CENTER);
    stroke(55,25,15);
    strokeWeight(1);
    fill(c);
    rect(xpos,ypos,100,38);
  }
  //Method to move the logs and reset them when they reache the end
  // of the screen.
  void moveLog() { 
    xpos = xpos + xspeed;
    if (xpos > width) { 
      xpos = 0;
    }
    else if (xpos < 0) { 
      xpos = 500;
    }
    //Lets the frog move on the logs 
    float xPos=frog1.getFrogX();
    float yPos=frog1.getFrogY();
    if (xPos > xpos - 50 && xPos < xpos + 50 && yPos > yPos && yPos < yPos + 38) { 
      xPos = xPos + xspeed;
    }
  }
  //Method to combine log methods
  void goLogs(){
    
      displayLog();
      moveLog();
  }
  
}


// This is the class that allows us to detect if we fall in the water
//and allow the game to give the impression of flowing water
class Water {
  //Declare variables for water position, colour and speed
  color c;
  float xpos; 
  float ypos;
  float xspeed;
   
  Water(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  //Function to display water object
  void displayWater() { 
    rectMode(CENTER); 
    noStroke();
    fill(c);
    rect(xpos,ypos,100,38);
  }
  //Function to move water object and reset it when it reaches end
  //of screen
  void moveWater() { 
    xpos = xpos + xspeed;
    if (xpos > width) { 
      xpos = 0;
    } else if (xpos < 0) {
      xpos = 500;
    }
    //Using return method to get frog coordinates
    float xPos=frog1.getFrogX();
    float yPos=frog1.getFrogY();
    //collision method for frog and water
    if (xPos > xpos - 50 && xPos < xpos + 50 && yPos > ypos && yPos < ypos + 38) {
      xPos = width/2;
      yPos = 585;
      life = life - 1;
      score = score - 25;
    }
  }
  //Method to combine water methods
  void goWater(){
    
    displayWater();
    moveWater();
  }
}



