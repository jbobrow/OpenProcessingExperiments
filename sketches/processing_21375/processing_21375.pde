
// Two global variables
float x;
float y;

void setup() {  //setup function called initially, only once
  size(700,300);
  frameRate(30);
  background(0); //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  smooth();
  x = width/2;
  y = height/2;
}

void draw() {
  //  new x & y position designed randomly. 
  float xPos = constrain(x + random(-40,40),0,width);
  float yPos = constrain(y + random(-40,40),0,height);
  // draw line
  //stroke(random(255),100,255);
  stroke(x,y,xPos);
  line(x,y,xPos,yPos);
  // giving to x & y new location
  x = xPos; 
  y = yPos;
}                       
