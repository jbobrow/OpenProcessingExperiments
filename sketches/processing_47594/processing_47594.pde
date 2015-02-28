


int currentFrame = 0;
PImage[] frames = new PImage[24];
int lastTime = 0;

void setup() 
{
  size(720, 720);
  
 
   
  smooth();
  background(0);
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get();
  }
}

void draw() 
{
  int currentTime = millis();
  if (currentTime > lastTime+30) {
    nextFrame();
    
     colorMode(HSB, 360, 100, 100);
  rectMode(CENTER); 
  noStroke();
 

  
  rect (360, 360, mouseX+1, mouseX+1);
  
  
    
    lastTime = currentTime;
    fill(360-mouseY/4,  70, 90, 120);
    translate(width/6, height/6);
      rotate(PI/2.5 + mouseX + mouseY);
  }
  if (mousePressed == true) {
    rect(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void nextFrame() 
{
  frames[currentFrame] = get(); 
  currentFrame++; 
  if (currentFrame >= frames.length) {
    currentFrame = 0;
  }
  image(frames[currentFrame], 0, 0);
  
}


