
int currentFrame = 0;
PImage[] frames = new PImage[24];
int lastTime = 0;
float x=0; // controls the movement of rectangle
float rl=0;
float speed=.1;
int value=0;

void setup(){
  size(800, 600, P3D);
  //background(80);
  smooth();
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // Create a blank frame
  }
}

void draw(){
 //background(100);
 int currentTime = millis();
  if (currentTime > lastTime+30) {
    nextFrame();
    lastTime = currentTime;
  }
  
 if (value<255){
  value++;
 }else{
   value =0;
}

if(mousePressed){
  if (rl<=width*2){
    rl+=10;
  }else{
    rl=0;
  }
  
  
  if (rl<=width){
    x+=speed;
  } else{
    x-=speed;
  }
}
  
  noStroke();
  translate(mouseX, mouseY);
  rotateZ(x);
 // translate(-50, -50);
  fill(random(255),200, value,random(80));
  rect(x, 50, 25, 30);
  fill( value, 50 ,random(100),random(100));
  rotateX(x);
  rect(50,x, 18, 22);
  
  
}


void nextFrame() 
{
  frames[currentFrame] = get(); // Get the display window
  currentFrame++; // Increment to next frame
  if (currentFrame >= frames.length) {
    currentFrame = 0;
  }
  image(frames[currentFrame], 0, 0);
}


