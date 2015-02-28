
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
  float leaderMetric = 0;
  float[] rgbColor = {255, 0, 255};

  // Constructor 1: Random
  Floater() {
    location = new PVector(random(DISPLAY_WIDTH*0.95),random(DISPLAY_HEIGHT));
    velocity = new PVector(random(-2,2), random(-2,2));
    clingyness = random(0.01,0.08);
//    clingyness = 1/random(10,100); 
//    clingyness = 0.05;
    leadership = random(0,1);
    followers = 0;
    topspeed = 5;
    learn_ability = 0.01;
  }

  // Constructor 2: Clingyness -- This is only one used right now
  Floater(float default_clingyness) {
    location = new PVector(random(DISPLAY_WIDTH*0.95),random(DISPLAY_HEIGHT));
    velocity = new PVector(random(-2,2), random(-2,2));
//    clingyness = 1/random(10,100);
    clingyness = default_clingyness;
    leadership = makeLeadership(LEADERSHIP_MIN, LEADERSHIP_MAX);
    followers = 0;
    topspeed = 3;
//    learn_ability = 0.001;
    learn_ability = random(LEARN_MIN/1000000,LEARN_MAX/1000000);
    leaderMetric = leadership;
  }

  // Updates the location of the floater by adding the velocity, which can be modified in the main code to respond to stuff
  void update() {
    velocity.limit(topspeed);
    location.add(velocity);
    
    leadership = leadership + learn_ability;
    if (leadership >= 1) {
      leadership = makeLeadership(LEADERSHIP_MIN, LEADERSHIP_MAX);
      followers = 0;
      leaderMetric = 0;
    }
    
//    clingyness = clingyness*(1-learn_ability);    
  }

  // Displays the floater at it's current location
  void display(int floaterSize) {
    float scaler = 1;
    if(location.x < DISPLAY_WIDTH-1) {
      switch(scalerSelection) {
        case(1): scaler = leadership; break;
        case(2): scaler = learn_ability*1000; break;
        case(3): scaler = abs(velocity.mag())/topspeed; break;
      } 
    
    fill(rgbColor[0]*scaler,rgbColor[1],rgbColor[2]-rgbColor[2]*scaler);
    stroke(rgbColor[0]*scaler,rgbColor[1],rgbColor[2]-rgbColor[2]*scaler);
//    for (int ramp=defaultSize+2; ramp<=floaterSize; ramp++) {
      ellipse(location.x, location.y, floaterSize, floaterSize);
//    }
    }
  }

  // Tries to keep floater from edges
  void checkEdges() {
    int xEdgeResponse = DISPLAY_WIDTH/10;   // Define how close the floater must get to start velocity correction to avoid edges
    int yEdgeResponse = DISPLAY_HEIGHT/10;
    float velChange = topspeed/50;  // Defines the amount of change of velocity
    
    if (location.x < xEdgeResponse) {
      velocity.x = velocity.x + velChange;      
    } else if  (location.x > DISPLAY_WIDTH-xEdgeResponse) {
      velocity.x = velocity.x - velChange;
    }

    if (location.y < yEdgeResponse) {
      velocity.y = velocity.y + velChange;      
    } else if  (location.y > DISPLAY_HEIGHT-yEdgeResponse) {
      velocity.y = velocity.y - velChange;
    }
  }  
}

