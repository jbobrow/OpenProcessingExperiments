
int currentFrame = 1;
int numFrames = 20;
PImage[] frames = new PImage[20];
float r = random(0, 250);
float g = random(0, 250);
float b = random(0, 250);
PImage hand;
PImage handr;
PFont font;

int lastTime = 1;


void setup()
{
  size(550, 400);
  frameRate(10);
  hand = loadImage("hand.png");
  handr = loadImage("handr.png");
font = loadFont("BebasNeue-100.vlw");
textFont(font);
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get();
  }
  frames[1]  = loadImage("one.png"); 
  frames[2]  = loadImage("two.png");
  frames[3]  = loadImage("three.png"); 
  frames[4]  = loadImage("four.png");
  frames[5]  = loadImage("five.png"); 
  frames[6]  = loadImage("six.png");
  frames[7]  = loadImage("seven.png"); 
  frames[8]  = loadImage("eight.png");
  frames[9]  = loadImage("nine.png"); 
  frames[10] = loadImage("ten.png");
  frames[11] = loadImage("eleven.png");
  frames[12] = loadImage("twelve.png");
  frames[13] = loadImage("thirteen.png");
  frames[14] = loadImage("fourteen.png");
  frames[15] = loadImage("fifteen.png");
  frames[16] = loadImage("sixteen.png");
  frames[17] = loadImage("seventeen.png");
  frames[18] = loadImage("eighteen.png");
  frames[19] = loadImage("nineteen.png");
}
  
  
  void draw() 
  {
  int currentTime = millis();
  if (currentTime > lastTime+30) {
    nextFrame();
    lastTime = currentTime;
    
  }
  
  if (mousePressed) {
    fill(255, 0, 0, 100);
    textSize(80);
    text("run", 240 , 200 );  
  
  }
 
  }

void nextFrame() 
{
  frames[currentFrame] = get(); // Get the display window
  currentFrame++; // Increment to next frame
  if (currentFrame >= frames.length) {
    currentFrame = 1;
  }
  image(frames[currentFrame], 0, 0);
}

void keyPressed() {
  if ((key == 'h') || (key == 'H')) {
    image(hand, -40, 80);
  }
    if ((key == 'm') || (key == 'M')) {
    image(hand, -30, 100);
     image(hand, -40, 10);
      image(handr, -30, 200);
 
    
  }
    
}


