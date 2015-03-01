
//////////////////////////////////
//////////////////////////////////
//Day 3 Homework
//////////////////////////////////
//////////////////////////////////

//Define variables
PImage universe;
PFont myFont;
float scale;
float speed;
//load image and fonts
void setup(){
  size(600,600);
  universe = loadImage("universe.jpeg");
  myFont = loadFont("LucidaSans-TypewriterBold-48.vlw");
}
//use draw function to manipulate image
void draw(){
  background(0);
  imageMode(CENTER);
  speed = 20;
  scale = map(sin(frameCount/speed), -1, 1, 1, 1.2);
  image(universe, width/2, height/2, scale*universe.width, scale*universe.height); //frame count is 30 frames per second
//insert text  
  textAlign(RIGHT, TOP);
  textFont(myFont, scale*30);
  fill(255);
  text("You are here", width/2, height/9);
//draw arrow  
  strokeWeight(2);
  stroke(255,0,0);
  drawArrow(100,100,120,20);
}

//Define function using local variables
//Note: code found on Processing Forum from user 'quarks'
void drawArrow(int cx, int cy, int len, float angle){
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}

//////////////////////////////////
//END
//////////////////////////////////


