
/* Adapting from Artificial Behavior: Computer Simulation of
Psychological Processes, by Gene D. Steinhauer 

Each "Creature" can walk north, south, east, or west.
Adjusts length of step to create a change of velocity.
Relative position of Reward drives adjustment to velocity.
Two groups: 1. affected by reward and 2. not

- Add a threshold radius around the reward.
- Each time the Creature crosses threshold, 
  increase its affinity using learning curve.
- Reward moves with noise, heads toward center, and 
  relocates when mouse is clicked.

Next steps:  
- Add multiple rewards.
- Make reward have different values.
- Make creatures with different learning rates.
- Giving / withholding reward randomly within threshold.

**********************************/

Creature[] myCreature;
final int CREATURE_COUNT = 60;

Reward myReward;
//final int REWARD_COUNT = 1;

float myRewardX, myRewardY; // to allow Creature to know location of Reward
float myRewardValue; // to allow Creature to be rewarded
color[] palette = { #6C6033, #A9E36C, #F7F75C, #9DD3D8 };

void setup() {
  size(600,400);
//  background(200);
  background( 255 );
  smooth();
  frameRate(16);
  stroke( palette[0] );
  strokeWeight(2);
  
//  curveTightness(10);
  
  myCreature = new Creature[CREATURE_COUNT];
  for (int i = 0; i < CREATURE_COUNT; i++) {
    myCreature[i] = new Creature(i); 
  }
  
  myReward = new Reward(0);

}

void draw() {
//  background( 255 );
  fill( 255, 200 );
  noStroke();
  rect(0,0,width,height);
  
  myReward.display();
  
  myRewardX = myReward.location()[0];
  myRewardY = myReward.location()[1];  
//  println("myReward " + myRewardX + " " + myRewardY);
  myRewardValue = myReward.value();
  
  for (int i = 0; i < CREATURE_COUNT; i++) {
    myCreature[i].display();
  }
  
  
}

void mousePressed() {
  myReward.move();
}
class Creature {
  float xPos, yPos;
  int rotation, oldRotation;
  
  float step;
  float stepNoise;
  final float STEP_NOISE_RATE = 0.02;
  final float BASE_STEP = 6;
  final float STEP_SCALE = 1; // impact of stepNoise on step length
  
  final float LEARN_RATE = 0.02;
  float expectation = 0.0;
  float distance; // to reward
  final float THRESHOLD = 80; // within this distance, reward is granted
  float vector; // angle to Reward in radians  
  float vectorX, vectorY;
  float affinity; // initial impact of reward on step length
  final float MIN_AFFINITY = 2;
  final float MAX_AFFINITY = 4;
  final float CENTERING_BIAS = 0.3; // from 0 to 1
  float xBias, yBias;
  
  int ID;
  
  Creature( int tempID ) {
    ID = tempID;
    xPos = width/2;
    yPos = height/2;
    oldRotation = int(random(4)); // can be 0 to 3
    
    step = BASE_STEP;
    stepNoise = random(10);    
//    println("myReward??? " + myRewardX + " " + myRewardY);
  }
  
  void display() {
//    println("myReward???????? " + myRewardX + " " + myRewardY);
//    stroke( 255 * (ID % 2), 0, 0);
    stroke( palette[0] );
    fill( palette[ (ID%2)+1] );
      
//    println( degrees(vector) );
    
    step = BASE_STEP + 2 * STEP_SCALE * ( noise(stepNoise) - 0.5);
    stepNoise += STEP_NOISE_RATE;
    
    // Here's the reward sensing part...
    
    if (ID % 2 == 1) { // Reds driven to reward
      distance = dist( myRewardX, myRewardY, xPos, yPos);
      if ( distance < THRESHOLD ) {
        // Reward recieved. Increase expectation.
        
        expectation += LEARN_RATE * (myRewardValue - expectation);
//        println( ID + " Expectation " + expectation);
        
        affinity = map( expectation, 0, myRewardValue, MIN_AFFINITY, MAX_AFFINITY);
                
      }
      vectorX = (myRewardX - xPos) / distance;
      vectorY = (myRewardY - yPos) / distance;
      vector = acos( vectorX );
      
      if ( vectorY < 0) {
        vector = TWO_PI - vector;
      }
      
      step += cos(HALF_PI * rotation) * vectorX * affinity;
      step += sin(HALF_PI * rotation) * vectorY * affinity;
    }
    
  
    rotation = ( oldRotation + 2 + int(random(1, 4)) ) % 4;
    // can go in any direction except back where it came from
    
  //  oldx = xPos;
  //  oldy = yPos;
    
    xBias = map( xPos, 0, width, CENTERING_BIAS / 2, -CENTERING_BIAS / 2);
    yBias = map( yPos, 0, height, CENTERING_BIAS / 2, -CENTERING_BIAS / 2);
    
    xPos += ( step * (cos(HALF_PI * rotation) + xBias) );
    yPos += ( step * (sin(HALF_PI * rotation) + yBias) );
    
    if ( xPos <= width && yPos <= height && xPos >= 0 && yPos >= 0) {
      pushMatrix();
//      translate(xPos, yPos);
//      rotate(HALF_PI * rotation);
//      line(0,0, - step, 0);
//      popMatrix();

      int prevID = (ID + CREATURE_COUNT - 2) % CREATURE_COUNT;
      int nextID = (ID + 2) % CREATURE_COUNT;
      
//      curve( myCreature[nextID].xPos, myCreature[nextID].yPos,
//        xPos,yPos, xPos,yPos,
//        myCreature[prevID].xPos, myCreature[prevID].yPos );
      ellipseMode(CENTER);
      translate(xPos,yPos);
      float pointer = atan2( -myRewardY+yPos,
                             -myRewardX+xPos);
      arc( 0,0, 100,100,pointer-QUARTER_PI, pointer+QUARTER_PI, PIE );
      popMatrix();
      
    } else {
      xPos = (width + xPos) % width;
      yPos = (height + yPos) % height;
    }
    
    oldRotation = rotation;
    
//    println(ID + " " + step);
  }
}

class Reward {
  int rewardValue = 100;
  float rewardX, rewardY;
  float xNoise, yNoise;
  final float NOISE_SCALE = 2;
  final float NOISE_RATE = 0.1;
  final float CENTERING_BIAS = 0.15; // from 0 to 1
  
  float xBias, yBias; // nudges toward center
  
  Reward(int tempRewardID) {
    rewardX = random(0.25 * width, 0.75 * width);
    rewardY = random(0.25 * height, 0.75 * height);    
//    println("Reward " + rewardX + " " + rewardY);
    xNoise = random(10);
    yNoise = random(10);
  }
  
  void display() {
    stroke( palette[0] );
//    noStroke();
    fill(palette[3]);
    ellipseMode(CENTER);
    ellipse(rewardX, rewardY, 20, 20);
    
    xBias = map( rewardX, 0, width, CENTERING_BIAS / 2, -CENTERING_BIAS / 2);
    yBias = map( rewardY, 0, height, CENTERING_BIAS / 2, -CENTERING_BIAS / 2);
    
    rewardX += 2 * NOISE_SCALE * ( noise(xNoise) - 0.5 + xBias);
    rewardY += 2 * NOISE_SCALE * ( noise(yNoise) - 0.5 + yBias);
    
    xNoise += NOISE_SCALE;
    yNoise += NOISE_SCALE;
  }
  
  float[] location() {
    float[] loc = new float[2];
    loc[0] = rewardX;
    loc[1] = rewardY;
//    loc = [rewardX, rewardY];
    return loc;
  }
  
  float value() {
    return rewardValue;
  }
  
  void move() {
    rewardX = mouseX;
    rewardY = mouseY;
  }
}


