
final int AMOUNT = 3; // amount of shapes to draw
final int LOOP_TIME = 50; // amount of frames in an animation loop
final int BIG_SQUARE_START = 0; // time at which the animation starts
final int SMALL_SQUARE_START = 10;
final int ANIM_LENGTH = 15; // length of a Square animation
Square[] squareArray = new Square[AMOUNT*2]; // array of Squares (two per shape)
int colorOffset = 7; // offset in the color array
final boolean USE_OFFSET = false; // true to cycle through the color array
final color[] cols = {color(51,77,92),
                      color(69,178,157),
                      color(239,201,76),
                      color(226,122,63),
                      color(223,90,73),
                      color(61,50,52),
                      color(112,135,127),
                      color(226,229,209),
                      color(217,36,27),
                      color(51,77,92),
                      color(69,178,157)
                     };
void setup() {
  size(200,200);
  frameRate(60);
  noStroke();
  smooth(8);
  rectMode(CENTER);
  generateShapes(AMOUNT);
}
 
void draw() {
  // clears the sketch and makes it transparent
  externals.context.clearRect(0,0,width,height);
  for(int i = 0; i < AMOUNT*2; i++) {
    Square s = squareArray[i];
    if(i%2 == 0) {
      // draws the connection between a big Square and a small Square
      // then draws the big Square itself
      drawConnection(i);
      fill(cols[colorOffset+i/2],150);
      rect(s.getX(),s.getY(),s.getSize(),s.getSize());
    } else if(i%2 != 0) {
      // draws a small Square (black)
      fill(0);
      rect(s.getX(),s.getY(),s.getSize(),s.getSize());
    }
    // animation for big Squares (colored)
    if(frameCount % LOOP_TIME >= BIG_SQUARE_START && frameCount % LOOP_TIME < BIG_SQUARE_START+ANIM_LENGTH && i % 2 == 0) {
      if(frameCount % LOOP_TIME == BIG_SQUARE_START) {
        s.generateNewPos(ANIM_LENGTH);
        for(int j = 0; j < AMOUNT*2; j++) {
          if(j % 2 == 0 && j != i) {
            s.check(squareArray[j],ANIM_LENGTH);
          }
        }
      }
      s.update();
    }
    // Animation for small Squares (black)
    if(frameCount % LOOP_TIME >= SMALL_SQUARE_START && frameCount % LOOP_TIME < SMALL_SQUARE_START+ANIM_LENGTH && i % 2 == 1) {
      if(frameCount % LOOP_TIME == SMALL_SQUARE_START) {
        s.generateNewPos(ANIM_LENGTH);
        for(int j = 0; j < AMOUNT*2; j++) {
          if(j % 2 == 1 && j != i) {
            s.check(squareArray[j],ANIM_LENGTH);
          }
        }
      }
      s.update();
    }
  }
  // Cycles through the colors (if USE_OFFSET == true)
  if(frameCount % LOOP_TIME == 0 && USE_OFFSET) {
    colorOffset = colorOffset < 8 ? colorOffset+1 : 0;
  }
}
 
// Generates new shapes
void generateShapes(int amount) {
  for(int i = 0; i < amount*2; i++) {
    if(i%2 == 1) {
      squareArray[i] = new Square(10);
    } else {
      squareArray[i] = new Square(50);
    }
  }
}
 
void drawConnection(int i) {
  // Get the big and small Squares
  Square s1 = squareArray[i];
  Square s2 = squareArray[i+1];
  // Calculate the corners coordinates
  float s1_left = s1.getX()-s1.getSize()/2;
  float s1_right = s1.getX()+s1.getSize()/2;
  float s1_down = s1.getY()-s1.getSize()/2;
  float s1_up = s1.getY()+s1.getSize()/2;
  float s2_left = s2.getX()-s2.getSize()/2;
  float s2_right = s2.getX()+s2.getSize()/2;
  float s2_down = s2.getY()-s2.getSize()/2;
  float s2_up = s2.getY()+s2.getSize()/2;
  // Draws quadrilaterals to connect the two Squares
  fill(cols[colorOffset+i/2],150);
  quad(s1_left,s1_up,s1_left,s1_down,s2_left,s2_down,s2_left,s2_up);
  quad(s1_left,s1_down,s1_right,s1_down,s2_right,s2_down,s2_left,s2_down);
  quad(s1_right,s1_down,s1_right,s1_up,s2_right,s2_up,s2_right,s2_down);
  quad(s1_right,s1_up,s1_left,s1_up,s2_left,s2_up,s2_right,s2_up);
  // Draws lines to fill small gaps between the quadrilaterals
  stroke(cols[colorOffset+i/2],40);
  line(s1_left,s1_up,s2_left,s2_up);
  line(s1_left,s1_down,s2_left,s2_down);
  line(s1_right,s1_down,s2_right,s2_down);
  line(s1_right,s1_up,s2_right,s2_up);
  noStroke();
}

// Inner class Square, used for both small and big Squares
class Square {
  float x; // x coordinate
  float y; // y coordinate
  float newX; // new x coordinate
  float newY; // new y coordinate, the Square will be animated to these coordinates
  float xOffset; // value the Square will be pushed by each frame along the x axis
  float yOffset; // value the Square will be pushed by each frame along the y axis
  float size; // size of the Square
 
  public Square(int s) {
    this.x = s*(int)random(1,width/s);
    this.y = s*(int)random(1,height/s);
    this.size = s;
  }
  
  // Updates the position of the Square
  // Used for the animation
  public void update() {
    this.x += this.xOffset;
    this.y += this.yOffset;
  }
  
  public float getX() {
    return this.x;
  }
  
  public float getY() {
    return this.y;
  }
  
  public float getSize() {
    return this.size;
  }
  
  public float getNewX() {
    return this.newX;
  }
  
  public float getNewY() {
    return this.newY;
  }
  
  // Generates new x and y positions to animate the Square to
  public void generateNewPos(int time) {
    this.newX = this.size*(int)random(1,width/this.size);
    this.newY = this.size*(int)random(1,height/this.size);
    this.xOffset = (this.newX - this.x)/time;
    this.yOffset = (this.newY - this.y)/time;
  }
  
  // Checks if the new position is not colliding with another Square
  // Doesn't work perfectly but avoids a lot of weird positions
  // The failSafe limits the amount of checks in order not to freeze the browser
  public void check(Square s, int time) {
    float size = this.size >= s.getSize() ? this.size : s.getSize();
    int failSafe = 0;
    while(abs(this.newX - s.getNewX()) <= size && abs(this.newY - s.getNewY()) <= size && failSafe < 50) {
      this.generateNewPos(time);
      failSafe++;
    }
  }
}
