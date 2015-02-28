
//declarify the variables
float xPos;
float yPos;
float radius;
float speed1;
float speed2;
float gravity=1;
 
//setup the variations
void setup () {
  size(500, 500);
  xPos = random(0, width);
  yPos = random(0, height/4);//y shouldn't be lesser th height, otherwise the ball an not upspring 
  radius = random(40, 41);//radius of the ball shaking when upspring
  speed1=random(3, 13);
  speed2=random(2, 18);
}
 
void draw() {
  background(255);
  fill(0, 100);
  rect(0, 0, width, height);//to erase the path of ball
 
 
  speed2+=gravity;
  xPos+=speed1;
  yPos+=speed2;
 
 
  if ((xPos <= radius/2)||(xPos >= width - radius/2)) {
    speed1 = -speed1;
  }
 
  if ((yPos <= radius/2)||(yPos >= height - radius/2)) {
    speed2 = -speed2*0.9;
    speed1=speed1*0.9;
     
  }
 
  if (yPos>= height-radius/2) {
    yPos=height-radius/2;
  }
  fill(random(0,125),0,255);
  noStroke();
  ellipse(xPos, yPos,radius,radius);  
}
