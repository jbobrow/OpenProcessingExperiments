
/* 3.11 BoingyBoingyTron */
/* By Richard Lyall */

float xPos[], yPos[]; // ball position
float distIncrement[]; // How far the ball travels per frame
float angle[]; // What's your angle? Everyone's got an angle (Humphrey Bogart)
float ballRadius;
int num; // how many balls? That is the question we're all asking.

void setup(){
  
  size (800,800);
  ellipseMode(CENTER);

  num = 20;
  ballRadius = 40;
  smooth();

  xPos = new float[num];
  yPos = new float[num];
  angle = new float[num];
  distIncrement = new float[num];
  
  for (int i=0; i < num-1; i++) {
    xPos[i] = width/2;
    yPos[i] = height/2; 
  
    angle[i] = random(-2,2);
    
    distIncrement[i] = random(1,3);
  }
 
}

void draw() {

  background(0);
  fill(255);
  strokeWeight(4);
  
  for (int i=0; i < num-1; i++) {
    
    float drawCol = map(i,0,num-1,20,235); 
    fill(drawCol);
    stroke(drawCol);
    
    ellipse(xPos[i],yPos[i],ballRadius,ballRadius);
    
    // draw line between pairs of blobs
    if (i %2 == 0 && i < num-2) {
      line (xPos[i],yPos[i],xPos[i+1],yPos[i+1]);
    }
  
    // Move ball to next location
    xPos[i] += (distIncrement[i] * TWO_PI * sin(angle[i]));
    yPos[i] += (distIncrement[i] * TWO_PI * cos(angle[i]));
  
    // Reverse direction on hitting horizontal screen edge
    if (xPos[i] <= ballRadius/2 || 
        xPos[i] >= width - ballRadius/2) {
      angle[i] = - angle[i]; 
    }
  
    // Reverse direction on hitting vertical screen edge
    if (yPos[i] <= ballRadius/2 || 
      yPos[i] >= height - ballRadius/2) {
      angle[i] = PI - angle[i];
    }
    

  }
  
}
