
// Audio Players
Maxim maxim;
AudioPlayer player;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer[] players;

// Font 
PFont f;

// Ball position and speed
float x = 250;
float y = 250;
float dx = 0;
float dy = 0;

// Last mouse movement variations and auxiliar numbers
// (pointer to last written variation and number of means).
// The arrays are implmented as circular buffers.
float[] incrMouseX;
float[] incrMouseY;
int ptr = 0;
int meanLength = 3;

// Speed multiplicator
float mult = 1;


// Booleans for different states (so that different actions don't mix together)
boolean picked = false;
boolean speedSelector = false;
boolean xGravitySelector = false;
boolean yGravitySelector = false;

// Delta value for "snapping" effect on the gravity and speed slectors
float delta = 0.1;

// Background  triangles current length
float north = 0.0;
float south = 0.0;
float east = 0.0;
float west = 0.0;

// Background triangles animation controllers
float incr = 1.0;
float decr = 0.04;

// Gravity values
float xGravity = 0.0;
float yGravity = 0.5;
float origGravity = 0.5;


// Setup function
void setup(){
  size(500,800);
  background(0);
  stroke(0);
  strokeWeight(0);
  
  incrMouseX = new float[meanLength];
  incrMouseY = new float[meanLength];
  
  // Audio players initialization
  maxim = new Maxim(this);
  player = maxim.loadFile("atmos1.wav");
  player.setLooping(true);
  player.volume(0.15);
  player1 = maxim.loadFile("1.wav");
  player2 = maxim.loadFile("2.wav");
  player3 = maxim.loadFile("3.wav");
  player4 = maxim.loadFile("4.wav");
  player1.setLooping(false);
  player2.setLooping(false);
  player3.setLooping(false);
  player4.setLooping(false);
  
  players = new AudioPlayer[]{player1, player2, player3, player4};
  
  // Font
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  textFont(f,36);
  textAlign(RIGHT);

}


// Draw
void draw(){
  // Background music
  player.play();
  
  background(0);
  
  // Release the ball if out of bounds.
  if (picked && mouseY > 500) mouseReleased();
  
  // Update background triangles length
  south = max(south - decr, 0.0);
  north = max(north - decr, 0.0);
  west = max(west - decr, 0.0);
  east = max(east - decr, 0.0);
  if (y >= 500 & dy > 0) {
    south = min(south + incr, 1.0);
  }
  if (y <= 0 & dy < 0) {
    north = min(north + incr, 1.0);
  }
  if (x >= 500 & dx > 0) {
    east = min(east + incr, 1.0);
  }
  if (x <= 0 & dx < 0) {
    west = min(west + incr, 1.0);
  }
  
  if (!picked) {
    
    // Check bouncing conditions
    // Update gravity values
    if (y >= 500 & dy > 0) {
      dy = -dy;
      if (players[3].isPlaying())
        players[3].stop();
      players[3].cue(0);
      players[3].play();
    } 
    else if (y <= 0 & dy < 0) {
      dy = -dy;
      if (players[1].isPlaying())
        players[1].stop();
      players[1].cue(0);
      players[1].play();
    }
    else {
      dy = dy + yGravity * mult;
    }
    if (x >= 500 & dx > 0) {
      dx = -dx;
      if (players[2].isPlaying())
        players[2].stop();
      players[2].cue(0);
      players[2].play();
    }
    else if (x <= 0 & dx < 0) {
      dx = -dx;
      if (players[0].isPlaying())
        players[0].stop();
      players[0].cue(0);
      players[0].play();
    }
    else {
      dx = dx + xGravity * mult;
    }
    
    // Update position
    x = x + dx * mult;
    y = y + dy * mult;
    
  }
  
  // Draw background triangles
  drawTriangles();

  // Draw the ball
  fill(255);
  ellipse(x, y, 50, 50);
  
  // Draw selectors
  fill(128 * mult);
  rect(0, 500, 500, 100);
  fill(230, 100, 0);
  rect(249, 500, 2, 100);
  fill(255 * ((mult > 0.5) ? 0 : 1));
  text(nf(mult, 0, 3) + "x", 490, 550);
  
  fill(128 * map(yGravity, -1, 1, 0, 1));
  rect(0, 600, 500, 100);
  fill(50, 200, 50);
  rect(124, 600, 2, 100);
  rect(249, 600, 2, 100);
  rect(374, 600, 2, 100);
  fill(255 * ((yGravity > 0.0) ? 0 : 1));
  text("yGravity x" + nf(yGravity / origGravity, 0, 3), 490, 650);
  
  fill(128 * map(xGravity, -1, 1, 0, 1));
  rect(0, 700, 500, 100);
  fill(50, 50, 200);
  rect(124, 700, 2, 100);
  rect(249, 700, 2, 100);
  rect(374, 700, 2, 100);
  fill(255 * ((xGravity > 0.0) ? 0 : 1));
  text("xGravity x" + nf(xGravity / origGravity, 0, 3), 490, 750);
  
  // Store background movement
  incrMouseX[ptr] = mouseX - pmouseX;
  incrMouseY[ptr] = mouseY - pmouseY;
  ptr++;
  if (ptr >= meanLength) ptr = 0;
  
}

// Auxiliar function round
float round(float number, float decimal) {
    return (float)(round((number*pow(10, decimal))))/pow(10, decimal);
} 

// Auxiliar function for drawing the background animation
void drawTriangles()
{
  
  fill(255 * north, 0, 0);
  triangle(0, 0, 500, 0, 250, 250);
  fill(0, 255 * east, 0);
  triangle(500, 500, 500, 0, 250, 250);
  fill(0, 0, 255 * south);
  triangle(0, 500, 500, 500, 250, 250);
  fill(255 * west, 255 * west, 0);
  triangle(0, 0, 0, 500, 250, 250);
  
  fill(0);
  strokeWeight(1);
  triangle(250 * north, 250 * north,
           500 - 250 * north, 250 * north,
           250, 250);

  triangle(500 - 250 * east, 500 - 250 * east,
           500 - 250 * east, 250 * east,
           250, 250);
           
  triangle(250 * south, 500 - 250 * south,
           500 - 250 * south, 500 - 250 * south,
           250, 250);
           
  triangle(250 * west, 250 * west,
           250 * west, 500 - 250 * west,
           250, 250);
           
  strokeWeight(0);
  
  
}

// Mouse Pressed
void mousePressed()
{
  // We check for the different zones of the screen,
  // and update the state varaibles accordingly.
  if (mouseY > 500 && mouseY <= 600) {
    speedSelector = true;
    mult = map(mouseX, 0, width, 0, 2);
    if (abs(mult - 1.0) < 0.5 * delta) mult = 1;
    player.speed(mult);
    player1.speed(mult);
    player2.speed(mult);
    player3.speed(mult);
    player4.speed(mult);
  }
  if (mouseY > 600 && mouseY <= 700) {
    yGravitySelector = true;
    yGravity = map(mouseX, 0, width, -1.0, 1.0);
    if (abs(yGravity) < 0.5 * delta) yGravity = 0;
    if (abs(yGravity / origGravity - 1.0) < delta) yGravity = origGravity;
    if (abs(yGravity / origGravity + 1.0) < delta) yGravity = -origGravity;
  }
  if (mouseY > 700) {
    xGravitySelector = true;
    xGravity = map(mouseX, 0, width, -1.0, 1.0);
    if (abs(xGravity) < 0.5 * delta) xGravity = 0;
    if (abs(xGravity / origGravity - 1.0) < delta) xGravity = origGravity;
    if (abs(xGravity / origGravity + 1.0) < delta) xGravity = -origGravity;
  }
  if ((abs(mouseX - x) + abs(mouseY - y) < 50) && !speedSelector) {
    picked = true;
  }
}

// Mouse dragged
void mouseDragged()
{
  // According to the state variables, we update the values of selectors and ball
  if (speedSelector) {
    mult = map(mouseX, 0, width, 0, 2);
    if (abs(mult - 1.0) < 0.5 * delta) mult = 1;
    player.speed(mult);
    player1.speed(mult);
    player2.speed(mult);
    player3.speed(mult);
    player4.speed(mult);
  } else if (yGravitySelector) {
    yGravity = map(mouseX, 0, width, -1.0, 1.0);
    if (abs(yGravity) < 0.5 * delta) yGravity = 0;
    if (abs(yGravity / origGravity - 1.0) < delta) yGravity = origGravity;
    if (abs(yGravity / origGravity + 1.0) < delta) yGravity = -origGravity;
  } else if (xGravitySelector) {
    xGravity = map(mouseX, 0, width, -1.0, 1.0);
    if (abs(xGravity) < 0.5 * delta) xGravity = 0;
    if (abs(xGravity / origGravity - 1.0) < delta) xGravity = origGravity;
    if (abs(xGravity / origGravity + 1.0) < delta) xGravity = -origGravity;
  } else if ((abs(mouseX - x) + abs(mouseY - y) < 50)) {
    if (mouseY > 500) {
      picked = false;
    } else {
      picked = true;
    }
  }
 
  if (picked) {
    x = mouseX;
    y = mouseY;
  } 
}


// Mouse Released
void mouseReleased()
{
  // Compute movement direction (mean variation of last cursor movements)
  if (picked) {
    dx = 0;
    dy = 0;
    for (int i = 0; i < meanLength; i ++) {
      dx += incrMouseX[i] / meanLength;
      dy += incrMouseY[i] / meanLength;
    }
    ptr = 0;
  }
  // Reset the state values
  picked = false;
  speedSelector = false;
  yGravitySelector = false;
  xGravitySelector = false;
}


