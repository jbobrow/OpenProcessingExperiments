
import gifAnimation.*;

PImage animation, bg;
Gif loopingGif;

float xpos;
float ypos;
float drag = 20;

void setup() {
  size(650, 430);
  smooth();
  noStroke();
  fill(0); 
  noCursor();
  bg = loadImage("castle.png");
  loopingGif = new Gif(this, "tink.gif");
  loopingGif.loop();
}

void draw() {
  fill(random(255), random(255), random(255), random(255));
  background(bg);
  
  float difx = mouseX - xpos-loopingGif.width/2;
  if (abs(difx) > 1) {
  xpos = xpos + difx/drag;
  xpos = constrain(xpos, 0, width-loopingGif.width);
}  
  
  float dify = mouseY - ypos-loopingGif.height/2;
  if (abs(dify) > 1) {
  ypos = ypos + dify/drag;
  ypos = constrain(ypos, 0, height-loopingGif.height);
  
  image(loopingGif, xpos, ypos);
}  
  if(mousePressed){
  ellipseMode(CENTER);
  for(int i=0;i<500;i++){
  ellipse(random(width),random(height),3,3);
}
}
}

