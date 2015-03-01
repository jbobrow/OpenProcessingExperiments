
//Variables Declared
int x;
int y;
int xSpeed;
int ySpeed;
int newSpeed;
int circSize;
int halfCirc;
int bgColor;
int downSpeed;
int upSpeed;
int bounceLimit;
int bounceTop;

void setup() {

  size (500, 800);
  
  circSize = 80;
  halfCirc = circSize/2;
  
  x = width/2;
  y = halfCirc;
  downSpeed = 6;
  upSpeed = -4;
  bounceTop = halfCirc;
  bounceLimit = height/6;

  bgColor = 255;
  
}


void draw() {
  
  background (bgColor);
  
  fill(0,255,0);
  noStroke();
  y = y+ySpeed;
  ellipse(x,y,circSize,circSize);
  
  //Initial Fall
  if (y <= halfCirc){
    ySpeed = downSpeed;
  }
  
  //Bounce
  if (y >= height-halfCirc){
    ySpeed = upSpeed;
    bounceLimit = (bounceLimit+(bounceLimit/6));
    bgColor = int(random(255));
  }
  
  //Bounce loop
  if (y <= bounceLimit){
    ySpeed = downSpeed;
  }
  
  //Stop bouncing!
  if ((bounceLimit >= height-halfCirc) && (y >= height-halfCirc)){
    ySpeed = 0;
    y = height-halfCirc;
  }
  
  
  //Hover mouse over ball to grab/drag -- move mouse quickly off of ball to release
  if (((mouseX >= x-halfCirc) && (mouseX <= x+halfCirc)) && ((mouseY >= y-halfCirc) && (mouseY <= y+halfCirc))){
     x = mouseX;
     y = mouseY;
   }
  
}
  

/* void mousePressed(){
   if (((mouseX >= x-halfCirc) && (mouseX <= x+halfCirc)) && ((mouseY >= y-halfCirc) && (mouseY <= y+halfCirc))){
     x = mouseX;
     y = mouseY;
   }
 }
 */
  


