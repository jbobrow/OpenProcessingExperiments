
float xPos, yPos;
float rad ;//radius of the circle
float xVel;//speed
float inc;
float angle;

void setup() {
  size(800, 200);
  smooth();
  xVel = 1;
  xPos = 15; 
}

void draw() {
  background(255);

  rad = 50;
  inc = 2;
  angle+= inc;
  xPos+= 2* xVel;   
  yPos = height/2 + sin(radians(angle)) * (rad);

 
   //bounce
  if (xPos > width-15  || xPos < 15) {
    xVel= xVel* -1;
     } 
     
 
  fill(0);
  noStroke();
  ellipse(xPos, yPos, 30, 30);
       

}

