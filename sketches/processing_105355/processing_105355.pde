
//Declare positions and speed
float x;
float y;
float xspeed = 2;
float yspeed = 1;
color colorRandom = color(random(255), random(255), random(255));
color ballColor = color(200,50,0);

void setup() {
  size(500,500);
  smooth();
}

void draw() {
  background(255);
  //Add speed to the position
  x = x + xspeed;
  y = y + yspeed;
  //Multiply by -1 turn it around
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1; 
    ballColor=colorRandom * 255;
   
  }
  //Both positions
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
    ballColor=colorRandom - 255;
    
  
  }
  //Display
  noStroke();
  fill(ballColor);
  ellipse(x,y,23,23);
}










