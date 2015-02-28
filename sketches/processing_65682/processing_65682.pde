
// Jeff Chien
// DESMA 28 Interactivity Workshop 6
// Images credit to:
// http://www.flickr.com/photos/preef/108059315/
// http://www.flickr.com/photos/music_embassy/7179436424/in/photostream/
// http://www.flickr.com/photos/azriadnan/1818312422/in/photostream/
// Font credit to:
// http://www.dafont.com/liquid-crystal.font

// I really wanted an enum...
public class RPSHand
{
  final int index;
  final PImage img;
  private RPSHand(int index, String imgPath)
  {
    this.index = index;
    this.img = loadImage(imgPath);
  }
  public float scale(RPSHand other)
  {
    if(index == other.index)
      return(random(0.1f, 0.15f));
    else if((index + 1) % 3 == other.index)
      return(random(0.05f, 0.08f));
    else
      return(random(0.3f, 0.4f));
  }
  public boolean win(RPSHand other)
  {
    return((other.index + 1) % 3 == index);
  }
}

PFont font;
RPSHand[] hands = new RPSHand[3];
float angle, angVel, angAccel, oldAccel = 0.01;
int stopTime, handIndex, handBoxSize = 120, rScore = 0, bScore = 0;
int[] rHands, bHands;
boolean justStarted = true;

void setup() {
  size(600, 300);
  smooth();
  frameRate(24);
  imageMode(CENTER);
  ellipseMode(RADIUS);
  rectMode(CENTER);
  
  // Load LCF font
  font = loadFont("LiquidCrystal-Regular-48.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  
  // Load images
  hands[0] = new RPSHand(0, "rock.png");
  hands[1] = new RPSHand(1, "paper.png");
  hands[2] = new RPSHand(2, "scissor.png");
  
  // Initialize
  angle = 0;
  angVel = 0;
  angAccel = oldAccel;
  stopTime = 10000000;
  handIndex = 0;
  
  // Generate hands
  rHands = new int[4];
  bHands = new int[4];
  for(int i = 0; i < 4; i++)
  {
    rHands[i] = (int)random(3);
    bHands[i] = (int)random(3);
  }
}

void drawMachine(int[] handIndices, int score, boolean flip)
{
  pushMatrix();
    translate(40, height / 2);
    rotate(angle);
    strokeWeight(5);
    fill(255);
    
    // Right hand
    rect(100, 0, 100, 30);
    rect(190, 0, handBoxSize, handBoxSize);
    image(hands[handIndices[0]].img, 190, 0, handBoxSize, handBoxSize);
    
    // Top hand
    rect(0, -100, 30, 100);
    rect(0, -190, handBoxSize, handBoxSize);
    pushMatrix();
      translate(0, -190);
      rotate(-PI / 2);
      image(hands[handIndices[1]].img, 0, 0, handBoxSize, handBoxSize);
    popMatrix();
    
    // Left hand
    rect(-100, 0, 100, 30);
    rect(-190, 0, handBoxSize, handBoxSize);
    pushMatrix();
      translate(-190, 0);
      rotate(-PI);
      image(hands[handIndices[2]].img, 0, 0, handBoxSize, handBoxSize);
    popMatrix();
    
    // Bottom hand
    rect(0, 100, 30, 100);
    rect(0, 190, handBoxSize, handBoxSize);
    pushMatrix();
      translate(0, 190);
      rotate(-PI * 3/ 2);
      image(hands[handIndices[3]].img, 0, 0, handBoxSize, handBoxSize);
    popMatrix();
    
    // Main box
    strokeWeight(7);
    fill(0);
    rect(0, 0, 100, 100);
    
    // LCD score display
    fill(5, 210, 5);
    if(flip)
      scale(-1, 1);
    text(String.format("%03d", score), 0, 0);
  popMatrix();
}

void draw() {
  // Background reflects the score
  background(constrain((rScore - bScore) * 50, 0, 250), 
            0,
            constrain((bScore - rScore) * 50, 0, 250));
  
  stroke(200, 0, 0);
  drawMachine(rHands, rScore, false);
  stroke(0, 0, 200);
  translate(width, 0);
  scale(-1, 1);
  drawMachine(bHands, bScore, true);
  
  angVel += angAccel;
  
  // Stop
  if(justStarted 
    || (int)(angle * 2 / PI) != (int)((angle + angVel) * 2 / PI))
  {
    // Stop for a bit
    angle = (int)((angle + angVel) * 2 / PI) * PI / 2;
    angVel = 0;
    angAccel = 0;
    stopTime = millis();
    
    // Add score
    if(hands[rHands[handIndex]].win(hands[bHands[handIndex]]))
      rScore++;
    else if(hands[bHands[handIndex]].win(hands[rHands[handIndex]]))
      bScore++;
    
    // Reset score
    if(rScore > 999 || bScore > 999)
      rScore = bScore = 0;  
    
    // New random hand
    handIndex = (handIndex + 1) % 4;
    rHands[(handIndex + 2) % 4] = (int)random(3);
    bHands[(handIndex + 2) % 4] = (int)random(3);
  }
  // Normal
  else
  {
    angle += angVel;
  }
  // Resume
  if(stopTime + 2000 <= millis())
    angAccel = oldAccel;
    
  // Modulus angle
  while(angle > 2 * PI)
    angle -= 2 * PI;
    
  justStarted = false;
}

