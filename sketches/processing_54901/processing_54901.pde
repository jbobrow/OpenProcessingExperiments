
// ball position and size
 
float x = 30;
float y = 30;
float w = 25;
float h = 25;
float rad = w/2;

//stairs (rect variables)
float bx = 0;
float by = 100;
float bw = 100;
float bh = 100;
 
// speed of ball (x & y)
 
float speedX = PI;
float speedY = 0;
 
 // for text
 PFont f;
String[] message = {"if ball hits corner or exhibits strange behavior, 'click' to re-intialize speed and avoid the 'harry potter effect' == locking the ball under the stairs"};
int z;
int index;

 
void setup() {
 
  size(800, 600);
  smooth();
 
 //for text info
  f = createFont("MoolBoran",25,true);
  z = width;
  index = 0;
 
}
 
void draw() {
   
  //background
  background(125);
 
  // draw ball
  fill(random(255),random(255),random(255));
  ellipse(x, y, w, h);
 
  //draws stairs
  for( int i = 0; i < 16; i++){
    fill(0);
    rect( bx, by +  i*50, bw + i*50, bh);
  }
 
 
  // simple gravity for ball
  speedY = speedY + 0.5;
 
  // adding the speed ball
  x = x + speedX;
  y = y + speedY;
 
  // bounce side to side
  if ((x > width - rad) || (x <= 0)) {
    speedX *= -1;
  }
 
  //bounce from floor
  if (y > height - rad) {
    // sets floor position
    y = height - rad;
    speedY = speedY * -0.9;
   
  }
  else if (y <= 0) {          
    speedY *= -1;
  }
  
  //bounce from stairs
  // stair tops
  for(int j = 0; j < 16; j++){
    if (x > bx &&  x < bx + j*50 + bw  && y > by + rad + j*50 -w && y < by + j*50 + bh/2) {
    speedY *= -1;
  }
  
  //right side of stairs
    if (y > (by + j*50) &&  y < (by + j*50) + bh && x < bx + j*50 + bw +rad && x > bx + (bw+j*50)/2) {
    speedX *= -1;
  }
  
  // stair bottoms
   if (x > bx &&  x < bx + bw + j*50 && y < by + j*50 + bh+rad && y > by + j*50 + bh/2) {
    speedY *= -1;
  }
  
  }
  
    //for text action 
    fill(255);
  textFont(f);
  textAlign(LEFT);
  float r = 0;
  text(message[index],z,575);
                                

  
  z = z - 3;
  float textW = textWidth(message[index]);
  if( z < -textW)
  {
    z = width;
    index = (index++) % message.length;
  }
}
 
//re-intialize ball motion/speed 
void mousePressed() {
  speedX = random(-15, 15);     
  speedY = random(30);
}




