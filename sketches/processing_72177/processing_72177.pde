
float x, y;
float speed = 3f;

PFont font;

int keyCodePressed;
int keyCodeReleased;

int keySize = 20;
int padding = 5;
int margin = 10;

int playerSize = 40;
int headerHeight = 83;
int windowBorder = 3; // This is to compensate for the hidden 3px border processing has.

void setup()
{ 
  size(400, 400);
  x = width/2;
  y = height/2;
  ellipseMode(CENTER);
  smooth();

  font = createFont("Tahoma", 14, true);
}

// Flags
boolean goUp;
boolean goDown;
boolean goLeft;
boolean goRight;

boolean priorityUp;
boolean priorityDown;
boolean priorityLeft;
boolean priorityRight;

void draw() {
  background(0);

  // This check fixes the problem when your holding a key down and the window loses focus.
  // Processing wont be told if you release a or not key.
  if (!focused)
    goLeft = goRight = goUp = goDown = false;

  // Movement code and collision detection. Simple put, x,y and incremented and decremented respective to the
  // go and priority flags.
  if (goLeft && priorityLeft) x += (x<-playerSize/2) ? width+playerSize : -speed;
  if (goRight && priorityRight) x += (x>width+playerSize/2) ? -width-playerSize : speed;
  if (goUp && priorityUp) y += (y<headerHeight+playerSize/2) ? 0 : -speed;
  if (goDown && priorityDown) y += (y>height-playerSize/2-windowBorder) ? 0 : speed;
    
  noStroke();

  rect(0, 0, width, headerHeight);
  fill(0);
  textFont(font, 12);
  text("keyCode in keyPressed: " + keyCodetoString(keyCodePressed), 10, 28);
  text("keyCode in keyReleased: " + keyCodetoString(keyCodeReleased), 10, 53);

  rect(width-(keySize*2+margin), margin, keySize, keySize); // Up
  rect(width-(keySize*2+margin), margin+keySize*2, keySize, keySize); // Down
  rect(width-(keySize*3+margin), margin+keySize, keySize, keySize); // Left
  rect(width-(keySize+margin), margin+keySize, keySize, keySize); // Right  

  fill(255);
  if (goUp && priorityUp) text("P", (width+8)-(keySize*2+margin), margin+16);
  if (goDown && priorityDown) text("P", (width+8)-(keySize*2+margin), margin+keySize*2 + 16);
  if (goLeft && priorityLeft) text("P", (width+8)-(keySize*3+margin), margin+keySize + 16);
  if (goRight && priorityRight) text("P", (width+8)-(keySize+margin), margin+keySize + 16);

  ellipse(x, y, 40, 40);
}

void keyPressed() {

  if (key == CODED)
  {
    if (keyCode == UP)
    {
      priorityUp = true;
      priorityDown = false;
      goUp = true;
    }
    if (keyCode == DOWN)
    {
      priorityDown = true;
      priorityUp = false;
      goDown = true;
    }
    if (keyCode == LEFT)
    {
      priorityLeft = true;
      priorityRight = false;
      goLeft = true;
    }
    if (keyCode == RIGHT)
    {
      priorityLeft = false;
      priorityRight = true;
      goRight = true;
    }
  }

  keyCodePressed = keyCode;
}

void keyReleased() {
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      goUp = false;
      priorityUp = false;
      priorityDown = true;
    }
    if (keyCode == DOWN)
    {
      goDown = false;
      priorityDown = false;
      priorityUp = true;
    }
    if (keyCode == LEFT)
    {
      goLeft = false;
      priorityLeft=false;
      priorityRight=true;
    }
    if (keyCode == RIGHT)
    {
      goRight = false;
      priorityLeft=true;
      priorityRight=false;
    }
  }

  keyCodeReleased = keyCode;
}

String keyCodetoString(int keyCode)
{
  switch(keyCode)
  {
  case 38:
    return "up";
  case 40:
    return "down";
  case 37:
    return "left";
  case 39:
    return "right";
  }

  return "?";
}

