
/* 3.11 BoingyBoingyTron */
/* By Richard Lyall */

float xPos[], yPos[];   // ball position
float distIncrement[];  // How far the ball travels per frame
float angle[];          // What's your angle? Everyone's got an angle (Humphrey Bogart)
float r[], g[], b[];    // draw colour for each ball
float ballRadius[];     //ballRadius
int num;                // how many balls? That is the question we're all asking.
boolean isOverlapping;  // true if current ball if overlap detected
float ballRadiusStealRatio;    // how much to increment or decrement ballRadius by when balls overlap


void setup(){
  
  size (800,800);
  ellipseMode(CENTER);
    
  num = 100;
 
  xPos = new float[num];
  yPos = new float[num];
  angle = new float[num];
  r = new float[num];
  g = new float[num];
  b = new float[num];
  distIncrement = new float[num];
  ballRadius = new float[num];
  
  for (int i=0; i < num-1; i++) {
    xPos[i] = random(ballRadius[i],width-ballRadius[i]);
    yPos[i] = random(ballRadius[i],height-ballRadius[i]); 
  
    angle[i] = random(-2,2);
    
    r[i] = random (0,255);
    g[i] = random (0,255);
    b[i] = random (0,255);
    
    ballRadius[i] = random(25,100);
    
    ballRadiusStealRatio = 0.3;
    
    distIncrement[i] = random(0.01,1);
  }
 
}

void draw() {

  //background(0,90,255);
  fill (0,90,255,5);
  rect (0,0,width,height);
  
  for (int i=0; i < num; i++) {
  
    // add a little random walk to trajectories
    angle[i] += random(-0.3,0.3);
    
    isOverlapping = false; // assume no overlap until one found
    
    int hitCount = 0; //How many other balls is the current ball overlapping with?
    
    // Look for overlapping balls
    // Need to compare each ball with every other ball, hence nested loop
    for (int j=0; j<num; j++){
    
      if (dist(xPos[i],yPos[i],xPos[j],yPos[j]) < ((ballRadius[i]+ballRadius[j])/2) && i != j) {
        
        stroke(255,128);
        
        hitCount++; // increment hit counter
        
        // If overlap detected, set overlapping flag = true so we know which fill colour to use for the ball
        // Want to draw the ball outside the inner loop so it's drawn once, otherwise each ball would be drawn j times
        isOverlapping = true;
        
        if (ballRadius[i] <= ballRadius[j]) {
          ballRadius[i] += ballRadius[j] * ballRadiusStealRatio;
          ballRadius[j] -= ballRadius[j] * ballRadiusStealRatio;
        }
        
        // One ball steals a bit of radius from the other when they overlap
        /*if (isOverlapping) {
          ballRadius[i] += ballRadiusInc;
          ballRadius[j] -= ballRadiusInc;
        }*/
       
        strokeWeight(1);
        line(xPos[i],yPos[i],xPos[j],yPos[j]);
        
      }  
    }
    
    // Set fill colour depending on whether current ball is overlapping any of the others
    if (isOverlapping == true) { 
      fill(255,255,255,10); } 
    else {
      fill(255,0); 
    }
    
    //Draw ellipse
    stroke(255,10);
    strokeWeight(2);
    ellipse(xPos[i],yPos[i],ballRadius[i],ballRadius[i]);
    

  
    // Move ball to next location
    xPos[i] += (distIncrement[i] * TWO_PI * sin(angle[i]));
    yPos[i] += (distIncrement[i] * TWO_PI * cos(angle[i]));
  
    // Reverse direction on hitting horizontal screen edge
    if (xPos[i] <= ballRadius[i]/2 || 
        xPos[i] >= width - ballRadius[i]/2) {
      angle[i] = - angle[i]; 
    }
  
    // Reverse direction on hitting vertical screen edge
    if (yPos[i] <= ballRadius[i]/2 || 
      yPos[i] >= height - ballRadius[i]/2) {
      angle[i] = PI - angle[i];
    }
    

  }
  
}
