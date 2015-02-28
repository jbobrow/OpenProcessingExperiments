
Agent[] agent ;
int NUMAGENTS = 1200 ;

void setup() {
  size(800, 250) ;
  agent = new Agent[NUMAGENTS] ;
  createAgents( width/2, height/2 ) ;

}

void createAgents(int x, int y) {
  for ( int i = 0 ; i < NUMAGENTS ; i++ )
    agent[i] = new Agent(x, y, 0) ;
}

void mouseClicked() {
  createAgents(mouseX, mouseY) ;
}

void draw() {
  // fade
  noStroke(); fill(255, 20) ;
  rect(0,0, width,height) ;

  // Draw and move each agent
  for ( int i = 0 ; i < NUMAGENTS ; i++ ) {
    //Agents steer randomly either towards or away from target, though 
    //preference is weighted to steer towards the target
    agent[i].steerToTarget(random(-0.1,0.4), mouseX, mouseY) ;
    //Randomly ajust speed
    agent[i].changeSpeed(random(-0.4, 0.4)) ;
    agent[i].updateLocation() ;
    agent[i].render() ;
  }
}

class Agent {
  
  // Current location of the Agent
  float locationX, locationY ;
  float prevLocX, prevLocY ;
  float velocity ;
  
  int shade ;
  
  // Direction in radians.
  // 0 is up, 0.5*PI is left, PI is down, 1.5*PI is right, 2*PI is up
  float direction ;  
  // Maximum speed that the agent can move at
  int maxVelocity = 9 ;

  Agent(float x, float y, float d) {

    prevLocX = x ;    
    prevLocY = y ;
    locationX = x ;
    locationY = y ;
    direction = d ;
    velocity = 0 ;
    shade = int ( random(100,230) ) ;

  }
  
  void updateLocation() {
    
    if ( velocity >= maxVelocity ) velocity = maxVelocity ;
    if ( velocity < 0 ) velocity = 0 ;
    
    prevLocX = locationX ;
    prevLocY = locationY ;

    locationX = ( locationX + width - sin(direction) * velocity ) % width ;
    locationY = ( locationY + height - cos(direction) * velocity ) % height ;
  }
 
  void changeSpeed(float change) {
    velocity += change ;   
  }
  
  // Steer the agent towards the target for a positive value of change, away
  // for a negative value
  void steerToTarget(float change, int targetX, int targetY) {

    float angleBetwn = atan2 (  (targetX - locationX) , (targetY - locationY) ) + PI ;

    if ( angleBetwn > HALF_PI && angleBetwn < 3*HALF_PI ) {
      if ( direction - angleBetwn > 0 ) {
        direction = ( direction + TWO_PI - change ) % TWO_PI ;      
      } else {
        direction = ( direction + TWO_PI + change ) % TWO_PI ;      
      }
    } else {
      if ( ( (direction + PI) % TWO_PI - (angleBetwn + PI) % TWO_PI ) > 0 ) {
        direction = ( direction + TWO_PI - change ) % TWO_PI ;      
      } else {
        direction = ( direction + TWO_PI + change ) % TWO_PI ;      
      }
    }
  }
  
  // Draw the agent on screen
  void render() {
    stroke(shade) ;
    if ( dist(prevLocX,prevLocY, locationX,locationY) <= maxVelocity+1 ) {
      line(prevLocX,prevLocY, locationX,locationY) ;
    }
  }

}

