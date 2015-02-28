
int WIDTH = 500;
int HEIGHT = 350;
int MIDPOINT = HEIGHT/2;

Tumbler[] tumblers;
int TUMBLER_WIDTH = 35;
int TUMBLER_HEIGHT = 150;
int TUMBLER_X_PADDING = 15; //distance between tumblers
float TUMBLER_SPEED = 1; //how fast the tumbler moves vertically
float OFFSETAMOUNT = TUMBLER_HEIGHT * 0.65; //potential tumbler offset from center
int TUMBLERS_X = WIDTH/4;
int TUMBLERS_Y = 50;
int TUMBLER_SWEETSPOT_BUFFER = 10; //how much of a buffer zone the sweetspot has (lower value = "harder")
int DIFFICULTY = 0; //this is used to lower the sweetspot buffer value, 0 = easy ... 5 = hardest

void setup() { 
  size(WIDTH, HEIGHT);
  frameRate(60);
  strokeWeight(0.1); //why can't processing.js do 0 strokeweight :|
  tumblers = new Tumbler[5];
  
  for(int i = 0; i < 5; i++) {
    int x = TUMBLERS_X + i * (TUMBLER_WIDTH + TUMBLER_X_PADDING);
    tumblers[i] = new Tumbler(x, TUMBLERS_Y);
  }
}

void draw() {   
  background(255);
  fill(200);
  rect(0,MIDPOINT,WIDTH,HEIGHT);
  for(int i = 0; i < 5; i++) {
    tumblers[i].display();
  } 
  fill(0);
  
  String d;
  text("Difficulty:",10,10);
  switch(DIFFICULTY) {
    case 0:
      d = "Easy"
      break;
    case 1:
      d = "Medium"
      break;
    case 2:
      d = "Hard"
      break;
    case 3:
      d = "Very Hard"
      break;
    case 4:
      d = "Dovahkiin"
      break;
    case 5:
      d = "Nerevarine"
      break;
    default:
      d = "???"
      break;
  }

  text(d,60,10);
  text("+/- to change difficulty",10,30);

      
  text("Lockpicking minigame. Click and hold to move tumblers down.",10,300);
  text("Release when they shake to lock them in place.",10,320);
  text("Press 'R' to reset tumblers and generate new 'sweetspots'",10,340);
}

void mouseReleased() {
  for(int i = 0; i < 5; i++) {
    if(tumblers[i].getMoving())
      tumblers[i].checkSweetspot();
  } 
}

void keyPressed() {
  if( key == 'r' || key == 'R' ) {
    resetGame();
  }
  if( key == '+' || key == '=' ) {
    DIFFICULTY = min(DIFFICULTY+1, 5);
  }
  if( key == '-' || key == '_' ) {
    DIFFICULTY = max(DIFFICULTY-1, 0);
  }
    
}

void resetGame() {
  for(int i = 0; i < 5; i++) {
    tumblers[i].reset();
  }
}

// -------------------- Tumbler class ----------------------
class Tumbler {
  float x, y;
  boolean over = false;
  boolean tumblermoving = false;
  boolean lockedinplace = false;
  boolean resetting = false;
  float sweetspot;
  
  Tumbler( float xx, float yy ) {
    y = yy;
    x = xx;
    
    generateSweetspot();
    sweetspot = MIDPOINT + 25 - random( OFFSETAMOUNT );
    if(sweetspot > MIDPOINT) sweetspot = MIDPOINT;
  }
  
  void generateSweetspot(){
    sweetspot = MIDPOINT + 25 - random( OFFSETAMOUNT );
    if(sweetspot > MIDPOINT) sweetspot = MIDPOINT;
  }
  
  void reset(){
    over = false;
    tumblermoving = false;
    lockedinplace = false;
    resetting = false;
    generateSweetspot();
  }
  
  void display() {
    
    boolean noOtherTumblersMoving = true;
    for(int i = 0; i < 5; i++) {
      if(tumblers[i].getMoving()) {
        if(tumblers[i] != this)
          noOtherTumblersMoving = false;
      }
    } 
    
    if( !resetting && !lockedinplace && (overit() && mousePressed && noOtherTumblersMoving) || tumblermoving) {
      y+=TUMBLER_SPEED;
      tumblermoving = true;
      
    }
    else
    {
      if(!lockedinplace) {
        if(y > TUMBLERS_Y)
          y-=TUMBLER_SPEED*8;
        else
          y = TUMBLERS_Y;
      }
      
      if( y == TUMBLERS_Y )
        resetting = false;
        
      tumblermoving = false;
    }
    if(tumblermoving)
      fill(155);
    else
      fill(245,220,125);
      
    float shakeamount = 0;
    if(!lockedinplace && y < sweetspot + (TUMBLER_SWEETSPOT_BUFFER - DIFFICULTY) ) {
      float distance = abs((sweetspot - y));
      shakeamount = map(distance, 0, (TUMBLER_SWEETSPOT_BUFFER - DIFFICULTY) * 2, 5, 0);
      if(shakeamount < 0) shakeamount = 0;
      if(shakeamount != 0){
        if(random(1) > 0.5)
          shakeamount = -shakeamount;
      }
    }
    else if(y > sweetspot - TUMBLER_SWEETSPOT_BUFFER - DIFFICULTY) {
      checkSweetspot();
    }
    
    rect(x + shakeamount,y,TUMBLER_WIDTH,TUMBLER_HEIGHT);
    
    //sweetspot display
    //ellipse(x + TUMBLER_WIDTH/2 , sweetspot, 20, 20);
  }
  
  
  void checkSweetspot(){
    if(y < sweetspot + TUMBLER_SWEETSPOT_BUFFER - DIFFICULTY &&
       y > sweetspot - TUMBLER_SWEETSPOT_BUFFER - DIFFICULTY ) {
      lockedinplace = true; 
    }
    resetting = true;
    setMoving(false);
  }
  
 
  void setMoving( boolean moving ){ tumblermoving = moving; }
  boolean getMoving(){ return tumblermoving; }
  
  boolean overRect(float x, float y, int width, int height)
  {
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    }
    else {
      return false;
    }
  }
 
  boolean overit()
  {
    if( overRect(x, y, TUMBLER_WIDTH, TUMBLER_HEIGHT) ) {
      over = true;
      return true;
    }
    else {
      over = false;
      return false;
    }
  }
}
