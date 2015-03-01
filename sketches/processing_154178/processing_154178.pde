
//Variables
int unit = 200;
int count;

//Declare Font
PFont f;

//Declare Object Class
Module[] mods;

void setup() {
  size(600,600);
  background(0);
  smooth();
  noStroke();
  
  int wideCount = width/unit;
  int highCount = height/unit;
  
  count = wideCount * highCount;
  mods = new Module[count];
  
  int index = 0;
  
  for (int x=0; x<wideCount; x++) {
    for(int y=0; y<highCount; y++) {
      mods[index++] = new Module(x*unit, y*unit, random(-8,8), random(-8,8));
    }
  }
  
  //Initialised text
  f = loadFont( "HoboStd-48.vlw");
}

void draw() {
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  

  for(int i=0; i<count; i++) {
    mods[i].update();
    mods[i].draw();
  }
  
  //Display Text
  textFont(f,16); 
  fill(255);        
  text("Produced by NIK (2014) - MCG'11", 200, 500);
}

class Module {
  float xPosition = 0;
  float yPosition;
  float xSpeed;
  float ySpeed;
  
  // Contructor
  Module(int xTemp, int yTemp, float xSpeedTemp, float ySpeedTemp) {
    xPosition = xTemp;
    yPosition = yTemp;
    xSpeed = xSpeedTemp;
    ySpeed = ySpeedTemp;
  }
  
  // Custom method for updating the variables
  void update() {
    // checks to see if ball position is larger than width of sketch or smaller than 0
    if((xPosition>width)||(xPosition<0))
      xSpeed *= -1; 
  
    if((yPosition<0)||(yPosition>height))
      ySpeed *= -1; 

       
    // The below line says that the value of xPosition and yPosition
    // will grow by the value currently held in the speed variables
    xPosition += xSpeed;
    yPosition += ySpeed; 
  }
  
  // Custom method for drawing the object
  void draw() {
    fill(random(255),random(255),random(255));
    ellipse(xPosition,yPosition,50,50);
  }
}


