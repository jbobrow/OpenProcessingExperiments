
float BACKGROUND = 0;      //background color as 0-255 grayscale
boolean DIAGONAL = false;    //toggle between diagonal and hor/ver lines
int NUM_OF_BITS = 500;
int BIT_LENGTH = 4;
float BLANK_RATIO = 0.2;     //radio of blank bits to prevent over-colorization
float OPACITY = 100;          //alpha channel, 0-255

Bit[] bits;

void setup() {
  size(1000, 700);
  background(BACKGROUND);
  
  bits = new Bit[NUM_OF_BITS];
  for (int i=0; i<NUM_OF_BITS; i++) {
    float ran = random(1);
    if (ran > BLANK_RATIO) bits[i] = new Bit();
    else bits[i] = new Bit(color(BACKGROUND));
  }
}

void draw() {
  for (int i=0; i<NUM_OF_BITS; i++) {
    bits[i].move();
    bits[i].display();
  }
}
class Bit {
  PVector location;
  int dirX, dirY;
  color c;
  
  Bit() {
    int x = int(random(width/BIT_LENGTH)) * BIT_LENGTH;
    int y = int(random(height/BIT_LENGTH)) * BIT_LENGTH;
    location = new PVector(x, y);
    
    c = color(random(255), random(255), random(255), OPACITY);
  }

  Bit(color c_) {
    this();
    c = color(c_, OPACITY);
  }
  
  void move() {
    dirX = (int(random(1, 3))*2 - 3);
    dirY = (int(random(1, 3))*2 - 3);
    if (!DIAGONAL) {
      float ran = random(1);
      if (ran > 0.5) dirX = 0;
      else dirY = 0;
    }
    
    location.add(new PVector(dirX*BIT_LENGTH, dirY*BIT_LENGTH));
  }
  
  void display() {
    stroke(c);
    float prevX = location.x - dirX*BIT_LENGTH + dirX;
    float prevY = location.y - dirY*BIT_LENGTH + dirY;
    line(location.x-dirX, location.y-dirY, prevX, prevY);
  }
}


