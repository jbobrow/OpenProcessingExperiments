

float mouseSpeedX; // horizontal sped
float mouseSpeedY; //vertical speed
float mouseSpeed; //avergae speed

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  //pmouseX and p mouseY give the position
  //of the mouse form the last frame
  mouseSpeedX = abs(pmouseX - mouseX);
  mouseSpeedY = abs(pmouseY - mouseY);
  
  //calculate average speed
  mouseSpeed = (mouseSpeedX + mouseSpeedY) / 2;
  
  // use a transparent color
  fill (91, 24, 27, 90);
  noStroke();
  
  // draw a circle using mouse speed;
   rect(0, 0, mouseSpeed*4, mouseSpeed*4);
   
    fill (122, 37, 74, 95);
   
  ellipse(200, 200, mouseSpeed*4, mouseSpeed*4);
  
  
  fill(35,14,193, 70);
   ellipse(300, 300, mouseSpeed*4, mouseSpeed*4);
   
    fill(159,239,46,50);
   
   ellipse(100, 100, mouseSpeed*4, mouseSpeed*4);
   
  
   
 fill(135,44,183,50);
  ellipse(275,275, mouseSpeed*4, mouseSpeed*4);
   
  
}


