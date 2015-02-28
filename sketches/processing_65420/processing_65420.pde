
// Class Floater
// Creates a floating circle that displays flocking behavior
class Floater {
  PVector location;   // obvi
  PVector velocity;   // obvi
  float topspeed;     // obvi
  float clingyness;   // controls how quickly the floater responds to leader
  float leadership;   // Leadership ability; larger value = more likely to lead
  float learn_ability;// Learning ability that incrases over time
  int followers;      // Number of floaters following this one
  int leader;         // Floater which this floater is following currently
  int defaultSize;
  float[] rgbColor = {255, 0, 255};

  // Constructor 1: Random
  Floater() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2), random(-2,2));
    clingyness = random(0.01,0.08);
//    clingyness = 1/random(10,100); 
//    clingyness = 0.05;
    leadership = random(0,1);
    followers = 0;
    topspeed = 3;
    defaultSize = 4;
    learn_ability = 0.01;
  }

  // Constructor 2: Clingyness -- This is only one used right now
  Floater(float default_clingyness) {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2), random(-2,2));
//    clingyness = 1/random(10,100);
    clingyness = default_clingyness;
    leadership = 1/random(1,1000);
    followers = 0;
    topspeed = 3;
    defaultSize = 2;
//    learn_ability = 0.001;
    learn_ability = random(0.0001,0.001);
  }

  // Updates the location of the floater by adding the velocity, which can be modified in the main code to respond to stuff
  void update() {
    velocity.limit(topspeed);
    location.add(velocity);
  }

  // Displays the floater at it's current location
  void display(int floaterSize) {
    // Scale color by velocity 
//    float scaler = abs(velocity.mag())/topspeed;
    // Scale color by clingyness
    float scaler = leadership;
//    float scaler = followers/3;
    fill(rgbColor[0]*scaler,rgbColor[1],rgbColor[2]-rgbColor[2]*scaler);
    stroke(rgbColor[0]*scaler+10,rgbColor[1],rgbColor[2]-rgbColor[2]*scaler+50);
//    for (int ramp=defaultSize+2; ramp<=floaterSize; ramp++) {
      ellipse(location.x, location.y, floaterSize, floaterSize);
//    }
  }

  // Tries to keep floater from edges
  void checkEdges() {
    int xEdgeResponse = width/10;   // Define how close the floater must get to start velocity correction to avoid edges
    int yEdgeResponse = height/10;
    float velChange = topspeed/50;  // Defines the amount of change of velocity
    
    if (location.x < xEdgeResponse) {
      velocity.x = velocity.x + velChange;      
    } else if  (location.x > width-xEdgeResponse) {
      velocity.x = velocity.x - velChange;
    }

    if (location.y < yEdgeResponse) {
      velocity.y = velocity.y + velChange;      
    } else if  (location.y > height-yEdgeResponse) {
      velocity.y = velocity.y - velChange;
    }
  }  
}

