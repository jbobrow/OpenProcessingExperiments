

//The Class Instances for background, middle and front. Make sure background has the most
//in the array, middle is in the middle and front has the least to make it more realistic. 
Snowflake [] sBackground = new Snowflake [70];
Snowflake [] sMiddle = new Snowflake [25];
Snowflake [] sFront = new Snowflake [10];


void setup() {
  size(800, 600);

//Create the constructor for each instance of your class.
//Some important things to remember are:
//Make the xPos and the yPos as random(width) and random(height) respectively so 
//when each element of the array is called they don't all show on top of each other, making
//it look like you only have one object. 
//For the most realistic perspective use these rules!! 
//1. the speed should be negative so it moves to the left and gives the effect of everything moving by
//as the curser moves to the right. The speed for background should be the slowest,
//middle speed should be in between front speed and back speed, and front speed should be the lowest.
//2. the size for the background objects should be the smallest, the middle objects should be in the middle, 
//and front objects should be the biggest. 
//3. I made the background images a little bit darker and the front images the lightest to give the feeling of 
//light shining on the front objects and not quite reaching the back objects. 
  for (int i = 0; i < sBackground.length; i++) {
    sBackground [i] = new Snowflake (random(width), random(height), -1, random(0, 10), random(170, 200));
  }
  
  for (int i = 0; i < sMiddle.length; i++) {
    sMiddle [i] = new Snowflake (random(width), random(height), -5, random(20, 40), random (200, 230));
  }
  
   for (int i = 0; i < sFront.length; i++) {
    sFront [i] = new Snowflake (random(width), random(height), -10, random(60, 70), random(230, 255));
  }
}

void draw() {
  background(#55728F);

//Create for statements that go throught the entire length of the array for each instance of the class. 
  for (int i = 0; i < sBackground.length; i ++) {
    println(i);
    sBackground [i].movementLogic();
    sBackground [i].display();
  }
  
  for (int i = 0; i < sMiddle.length; i ++) {
    println(i);
    sMiddle [i].movementLogic();
    sMiddle [i].display();
  }
  
  for (int i = 0; i < sFront.length; i ++) {
    println(i);
    sFront [i].movementLogic();
    sFront [i].display();
  }
}


class Snowflake {
  
  ///Decare all your class variables as local variables. 
  float xPos;
  float yPos;
  float xSpeed;
  float sSize;
  float sColor;
  float xPosMap;
  float yPosMap;
  
  //Set up your class. For a realistic parralex affect, think about:
 // the xPosition, the yPosition, speed of the objects, 
  //size of the objects, and the color. 
  Snowflake (float _xPos, float _yPos, float _xSpeed, float _sSize, float _sColor) {
    //"this" function makes the sketch look for local variables inside the class to draw on
    this.xPos =  _xPos;
    this.yPos = _yPos;
    xSpeed = _xSpeed;
    sSize = _sSize;
    sColor = _sColor;
  }

//Create a function for movement logic. 
  void movementLogic() {
    
    //This makes the sketch move with the mouse 
    xPosMap = map(mouseX, 0, width, 0, xSpeed);
    xPos += xPosMap; 


    // This checks the edges in the sketch and gives the feeling that
    //the bubbles move for eternity. 
    if (xPos > width + sSize || xPos < 0 - sSize) {
      xPos = width;
      yPos = random(height); //set to random(height) so the bubbles always come back around at a different height. 
    }
  }

//Create the basic shape you will be working from. 
  void display() {
    noStroke();
    fill(sColor);
    pushMatrix();
    translate(xPos, yPos);
    ellipse(0, 0, sSize, sSize);
    popMatrix();
  }
}

