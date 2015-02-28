
//Declare Classes
Sun[] rays = new Sun[5000];  //Class for the sun's rays with an array of 5000 rays
Stem dandStem;   //Dandelion Stem class
AirborneSeeds airSeeds;  //Class for the seeds
Grass[] grasses = new Grass[2000];  //Class for the short grass with an array of 2000 blades
GrassLong[] grassesLong = new GrassLong[140];  //Class for the long grass with an array of 140 blades

//Global Variables
float locationX;
float locationY;
float locationEndX = 0;
float locationEndY = 0;
float radius = 40;
float radius2 = 30;
float radius3 = 20;
int totalSeeds = 36;
int count = 0;


void setup() {
 size(600,600,P2D);  //Draw sketch window 600 by 600
 smooth();  
 
 //  Iterate through the rays.length[5000] and assign random values for x and y  and strokeWeight
 for (int i = 0; i < rays.length; i++) {
  rays[i] = new Sun(random(0,600),random(0,500),random(0,1));
}

//  Initialize the Stem class passing in the x and y coordinates for the stem head
 dandStem = new Stem(105,380);

// Initialize the AirborneSeeds class that will in turn call the Seed class
 airSeeds = new AirborneSeeds();
 
// Iterate through the grasses.length[2000] and assign random values for the x and y coordinates,
// the strokeWeight and the green colour to be applied
for (int i = 0; i < grasses.length; i++) { 
 grasses[i] = new Grass(random(0,width),random(height-40,height),random(0,1),random(150,200));
}

// Iterate through the grassesLong.length[140] and assign random values for the x and y coordinates,
// the strokeWeight and the green colour to be applied
for (int i = 0; i < grassesLong.length; i++) { 
 grassesLong[i] = new GrassLong(random(0,width),random(height-80,height),random(0,1),random(150,200));
}

}

void draw() {
  background(250,229,109);  //Draw the yellow background
  
 //  Draw each sun ray
  for (int i = 0; i < rays.length; i++) {
  rays[i].run();
  }
  
// Display stem
  dandStem.display();

// Call AirborneSeeds to then call Seeds and display them
  airSeeds.addSeeds();
  
// Display each blade of short grass
  for (int i = 0; i < grasses.length; i++) {
  grasses[i].run();
  }

// Display each blade of long grass
  for (int i = 0; i < grassesLong.length; i++) {
  grassesLong[i].run();
  }
}

void mousePressed() {
// Reset if the mouse is clicked 
   count = 0;  //Counter that controls the values passed into seeds for the angle of each seed
   setup();  //Return to setup - start again

  
}
class AirborneSeeds {
//Declare an array list for the Seed class
  ArrayList<Seed> seedList = new ArrayList<Seed>();
  
// Pass specific variables to the seed class depending on count
// Based on the formulae x = h + r cos(t) x = position of center point on x axis + the radius of the circle 
// multiplied by cosine(angle/radian) and y = position of center point on y axis + the radius of the circle
// multiplied by sine(angle/radian)
// Constructor
  AirborneSeeds() {
    for (int i = 0; i < totalSeeds; i++) {
         if (count == 0) {
             locationEndX = locationX + radius*cos(PI/6);
             locationEndY = locationY + radius*sin(PI/6);
       } else if (count == 1) {
             locationEndX = locationX + radius*cos(PI/3);
             locationEndY = locationY + radius*sin(PI/3);
       } else if (count == 2) {
             locationEndX = locationX + radius*cos(PI/2);
             locationEndY = locationY + radius*sin(PI/2);
       } else if (count == 3) {
             locationEndX = locationX + radius*cos(TWO_PI/3);
             locationEndY = locationY + radius*sin(TWO_PI/3);
       } else if (count == 4) {
             locationEndX = locationX + radius*cos((PI*5)/6);
             locationEndY = locationY + radius*sin((PI*5)/6);
       } else if (count == 5) {
             locationEndX = locationX + radius*cos(PI);
             locationEndY = locationY + radius*sin(PI);
       } else if (count == 6) {
             locationEndX = locationX + radius*cos((PI*7)/6);
             locationEndY = locationY + radius*sin((PI*7)/6);
       } else if (count == 7) {
             locationEndX = locationX + radius*cos((PI*4)/3);
             locationEndY = locationY + radius*sin((PI*4)/3);
       } else if (count == 8) {
             locationEndX = locationX + radius*cos((PI*3)/2);
             locationEndY = locationY + radius*sin((PI*3)/2);
       } else if (count == 9) {
             locationEndX = locationX + radius*cos((PI*5)/3);
             locationEndY = locationY + radius*sin((PI*5)/3);
       } else if (count == 10) {
             locationEndX = locationX + radius*cos((PI*11)/6);
             locationEndY = locationY + radius*sin((PI*11)/6);
       } else if (count == 11) {
             locationEndX = locationX + radius*cos(TWO_PI);
             locationEndY = locationY + radius*sin(TWO_PI);
       } else if (count == 12) {
             locationEndX = locationX + radius2*cos(PI/12);
             locationEndY = locationY + radius2*sin(PI/12); 
       } else if (count == 13) {
             locationEndX = locationX + radius2*cos(PI/4);
             locationEndY = locationY + radius2*sin(PI/4);
       } else if (count == 14) {
             locationEndX = locationX + radius2*cos((PI*5)/12);
             locationEndY = locationY + radius2*sin((PI*5)/12);
       } else if (count == 15) {
             locationEndX = locationX + radius2*cos((PI*7)/12);
             locationEndY = locationY + radius2*sin((PI*7)/12);
       } else if (count == 16) {
             locationEndX = locationX + radius2*cos((PI*3)/4);
             locationEndY = locationY + radius2*sin((PI*3)/4);
       } else if (count == 17) {
             locationEndX = locationX + radius2*cos((PI*11)/12);;
             locationEndY = locationY + radius2*sin((PI*11)/12);
       } else if (count == 18) {
             locationEndX = locationX + radius2*cos((PI*13)/12);
             locationEndY = locationY + radius2*sin((PI*13)/12);
       } else if (count == 19) {
             locationEndX = locationX + radius2*cos((PI*5)/4);
             locationEndY = locationY + radius2*sin((PI*5)/4);
       } else if (count == 20) {
             locationEndX = locationX + radius2*cos((PI*17)/12);
             locationEndY = locationY + radius2*sin((PI*17)/12);
       } else if (count == 21) {
             locationEndX = locationX + radius2*cos((PI*19)/12);
             locationEndY = locationY + radius2*sin((PI*19)/12);
       } else if (count == 22) {
             locationEndX = locationX + radius2*cos((PI*7)/4);
             locationEndY = locationY + radius2*sin((PI*7)/4);
       } else if (count == 23) {
             locationEndX = locationX + radius2*cos((PI*23)/12);
             locationEndY = locationY + radius2*sin((PI*23)/12);
       } else if (count == 24) {
             locationEndX = locationX + radius3*cos(PI/6);
             locationEndY = locationY + radius3*sin(PI/6);
       } else if (count == 25) {
             locationEndX = locationX + radius3*cos(PI/3);
             locationEndY = locationY + radius3*sin(PI/3);
       } else if (count == 26) {
             locationEndX = locationX + radius3*cos(PI/2);
             locationEndY = locationY + radius3*sin(PI/2);
       } else if (count == 27) {
             locationEndX = locationX + radius3*cos(TWO_PI/3);
             locationEndY = locationY + radius3*sin(TWO_PI/3);
       } else if (count == 28) {
             locationEndX = locationX + radius3*cos((PI*5)/6);
             locationEndY = locationY + radius3*sin((PI*5)/6);
       } else if (count == 29) {
             locationEndX = locationX + radius3*cos(PI);
             locationEndY = locationY + radius3*sin(PI);
       } else if (count == 30) {
             locationEndX = locationX + radius3*cos((PI*7)/6);
             locationEndY = locationY + radius3*sin((PI*7)/6);
       } else if (count == 31) {
             locationEndX = locationX + radius3*cos((PI*4)/3);
             locationEndY = locationY + radius3*sin((PI*4)/3);
       } else if (count == 32) {
             locationEndX = locationX + radius3*cos((PI*3)/2);
             locationEndY = locationY + radius3*sin((PI*3)/2);
       } else if (count == 33) {
             locationEndX = locationX + radius3*cos((PI*5)/3);
             locationEndY = locationY + radius3*sin((PI*5)/3);
       } else if (count == 34) {
             locationEndX = locationX + radius3*cos((PI*11)/6);
             locationEndY = locationY + radius3*sin((PI*11)/6);
       } else if (count == 35) {
             locationEndX = locationX + radius3*cos(TWO_PI);
             locationEndY = locationY + radius3*sin(TWO_PI);
       }
//  Pass the relevant values to the Seed class       
      seedList.add(new Seed(locationX, locationY, locationEndX, locationEndY));
      count++; //  Increment the counter
    }
  }
  
 void addSeeds() {
   
//  Run the Seeds class for each instance of the seedList
      for (int i = 0; i < seedList.size(); i++) {
          Seed seeds = seedList.get(i);
          seeds.run();
      }
  }
}
class Grass{
  
// Global Variables
  float xLoc = 0;
  float xLoc2 = 0;
  float grassHeight = 0;
  float grassWeight = 0;
  float grassColour = 0;
  
// Constructor - accept the values passed in from setup()
  Grass(float _xLoc,float _grassHeight, float _grassWeight, float _grassColour) {
      
// Assign temporary values to the global variables for use in this class
      xLoc = _xLoc; 
      xLoc2 = random(_xLoc-50,_xLoc+50);
      grassHeight = _grassHeight;
      grassWeight = _grassWeight;
      grassColour = _grassColour;
  }
  
//Functions - call run() to call display() to display each individual blade of grass
  void run() {
    display();  
  }
  
  void display() {
    stroke(0,grassColour,0);
    strokeWeight(grassWeight);
    line(xLoc,height,xLoc2,grassHeight);
  }
  
}
class GrassLong{
  
// Global Variables
  float xLoc = 0;
  float xLoc2 = 0;
  float grassHeight = 0;
  float grassWeight = 0;
  float grassColour = 0;
  
// Constructor - accept values passed in from setup()
  GrassLong(float _xLoc,float _grassHeight, float _grassWeight, float _grassColour) {

// Assign temporary values to the global variables for use in this class     
      xLoc = _xLoc;
      xLoc2 = random(_xLoc-100,_xLoc+100);
      grassHeight = _grassHeight;
      grassWeight = _grassWeight;
      grassColour = _grassColour;
  }
  
  //Functions
  void run() {
    display();
  }
  void display() {
    stroke(0,grassColour,0);
    strokeWeight(grassWeight);
    line(xLoc,height,xLoc2,grassHeight);
  }
}
class Seed {
// Global Variables  
  PVector location;  // PVector for seed - attached to stem head
  PVector locationEnd;  // PVector for seed end
  PVector velocity;  // PVector for the velociy of the seed




// Constructor - accept the values passed in from the AirborneSeeds class  
  Seed (float _locationX, float _locationY, float _locationEndX, float _locationEndY) {
    
    location = new PVector (_locationX,_locationY);  // Location of seed nearest stem head
    locationEnd = new PVector (_locationEndX,_locationEndY);  // Location of end of seed
    velocity = new PVector (random (0,2.5),random(-1,1));  // Velocity 0 to 2.5 on x axis - -1 to 1 on y axis   
  }

// Display and move the seeds 
  void run() {
    display();
// Movement of the seeds is limited to seeds that have velocity on the x axis of over 0.7
// The frameCount is just to delay the first movement of the seeds
    if (velocity.x > 0.7){
      if (frameCount > 100) {
          move();
      }
    }  
  }

// Draw the seed to the screen using the values passed into this class  
  void display() {
    strokeWeight(1);
    stroke(0,80);
    line(location.x,location.y,locationEnd.x,locationEnd.y);
    ellipseMode(CENTER);
    noStroke();
    fill(0);
    ellipse(location.x,location.y,3,3); 
    fill(0,50);
    ellipse(locationEnd.x,locationEnd.y,20,20);  
  }
  
  void move() {

// This is a crude fix to a problem with the distance between the two PVectors location and locationEnd
// increasing if opposing forces were applied.  This minimises the length of time these forces are applied.
    if (location.y - 30 < locationEnd.y) {
// Add gravity to the seed
       location.y += 0.2;
// Counter gravitational force for the seed top
       locationEnd.y -= 0.1;
    }

// Add velocity to the seed so it moves across the screen
    location.add(velocity);
    locationEnd.add(velocity);

//  If the seed has landed on the grass velocity is switched off    
    if (location.y > 580) {
      velocity.y = 0;
      velocity.x = 0;
    }
    if (locationEnd.y > 560) {
      velocity.y = 0;
      velocity.x = 0;
    }

// Different air stream limited to the top left of the sketch window - increase/decrease velocity   
    if (location.x > 300  && location.y < 150 || locationEnd.x > 300 && locationEnd.y < 150){
        velocity.y -= 0.01;
        velocity.x += 0.001;
    }
// Different air stream limited to the top right of the sketch window - increase velocity   
    if (location.x < 300 && location.y < 300) {
        velocity.x +=  random(0.1,1);
        velocity.y += random(0.1,1);
    }


  }
 
}
class Stem {

PVector location;  // PVector for location
float statX = 100; // x Axis starting point of stem
float statY = 600; // y axis starting point of stem

// Constructor - accept the values passed in and assign to global variables for this class
  Stem(float _locationX, float _locationY) {

  locationX = _locationX;
  locationY = _locationY;  
  location = new PVector(locationX,locationY);
  }

 void run() {
   display(); 
 }
 
 // Display stem
  void display() {
  stroke(0);
  noFill();
  strokeWeight(3);
  bezier(statX,statY,location.x-15,location.y+230,location.x-20,location.y+130,location.x,location.y);
  ellipseMode(CENTER);
  fill(0);
  ellipse(location.x,location.y,10,10);
    } 
}
class Sun{
  
//Global Variables
  float xLoc = 250;
  float yLoc = -50;
  float xLoc2 = 0;
  float rayLength = 0;
  float rayWeight = 0;
  
//Constructor - accept the values passed in and assign to global variables for this class
  Sun(float _xLoc2, float _rayLength, float _rayWeight) {
      
      xLoc2 = _xLoc2;
      rayLength = _rayLength;
      rayWeight = _rayWeight;
  }
  
//Functions - Run is called to call display()
  void run() {
    display();
  }
  void display() {
    stroke(255,255,255,20);
    strokeWeight(rayWeight);
    line(xLoc,yLoc,xLoc2,rayLength);
  }
}


