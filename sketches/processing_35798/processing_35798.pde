
import krister.Ess.*;

//int canvasW = 400;
//int canvasH = 350;
int x = 400 / 2;
int y = 350 / 2;
int xFactor = 1;
int yFactor = 1;
float momentum = 1; 

AudioChannel myChannel;
SineWave myWave;

void setup () {
  size (400,350 );
  background(0);
  smooth();
  
  // start up Ess
  Ess.start(this);
  
  // create a new AudioChannel
  myChannel=new AudioChannel();

  // set the channel size to 5 seconds
  myChannel.initChannel(myChannel.frames(300));

  // generate 3 seconds of a soft sine wave
  myWave=new SineWave(480,.6);
}

void draw() {
  drawBall(x, y);  
  x += 3 * xFactor; // x = x + 1
  y += 3 * yFactor;
  
  if(momentum > 1) momentum -= 0.1;
  
  // If the ball hits the right edge of the canvas
  if((x - (100 / 2) <= 0) || x + (100 / 2) >= 400) {
    xFactor *= -1; 
    beep();
    momentum = 5;
    
  }
  
  // If the ball hits the bottom of the canvas
  if((y - (100 / 2) <= 0) || (y + (100 / 2) >= 350)) {
    yFactor *= -1; 
    beep();
    momentum = 5;
  }
  
}

void drawBall(int xpos, int ypos) {
  int w = 100; 
  int h = 100;
  background(0);
  ellipse(xpos,ypos, w, h); 
}

void beep() {
  myWave.generate(myChannel,0,myChannel.frames(3000));
  // play
  myChannel.play();
}

