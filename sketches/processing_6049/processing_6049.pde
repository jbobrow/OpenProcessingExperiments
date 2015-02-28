
int yPosition = 0;
int xPosition = 0;
int speedx= 2;
int speedy=7;

void setup() {
  size(500, 500);
  }

void draw() {
  
  background(0, 13, 46);
  
  fill(19, 20, 21, 150);
  ellipse(100, yPosition, 300, 300);
  
  fill(19, 20, 21, 150);
  ellipse(xPosition, 375, 300, 300);
  
  fill(19, 20, 21, 150);
  ellipse(500, yPosition, 300, 300);
  
  fill (0, 8, 28, 150);
  ellipse(400, 400, 350, 350);
  
  fill (19, 20, 21, 150);
  ellipse(350, 350, 325, 325);
  
  fill (0, 16, 59, 150);
  ellipse(300, 300, 300, 300);
  
  fill (0, 21, 77, 150);
  ellipse(250, 250, 275, 275);
  
  fill (0, 25, 93, 150);
  ellipse(200, 200, 250, 250);
  
  fill(19, 20, 21, 150);
  ellipse(10, yPosition, 200, 200);
  
  fill(19, 20, 21, 150);
  ellipse(xPosition, 400, 200, 200);
  
  fill (0, 31, 113, 150);
  ellipse(150, 150, 225, 225);
  
  fill (0, 36, 131, 150);
  ellipse(100, 100, 200, 200);
  
  fill (0, 41, 152, 150);
  ellipse(50, 50, 175, 175);
  
  fill (0, 47, 173, 150);
  ellipse(0, 0, 150, 150);
  
  fill(0, 16, 59, 150);
  ellipse(400, yPosition, 150, 150);
  
  fill(0, 16, 59, 150);
  ellipse(xPosition, 20, 150, 150);
  
  fill(0, 16, 59, 150);
  ellipse(50, yPosition, 100, 100);
  
  fill(0, 16, 59, 150);
  ellipse(xPosition, 50, 100, 100);
  
  fill(50, 64, 103, 150);
  ellipse(250, yPosition, 100, 100);
  
  fill(50, 64, 103, 150);
  ellipse(xPosition, 260, 100, 100);
  
  fill(0, 27, 98, 150);
  ellipse(80, yPosition, 80, 80);
  
  fill(0, 27, 98, 150);
  ellipse(xPosition, 90, 80, 80);
  
  fill(0, 35, 129, 150);
  ellipse(10, yPosition, 60, 60);
  
  fill(0, 35, 129, 150);
  ellipse(xPosition, 450, 60, 60);
  
  fill(0, 52, 191, 150);
  ellipse(260, yPosition, 20, 20);
  
  fill(0, 52, 191, 150);
  ellipse(xPosition, 75, 20, 20);
  
  fill(73, 91, 139, 150);
  ellipse(365, yPosition, 20, 20);
  
  fill(73, 92, 139, 150);
  ellipse(xPosition, 25, 20, 20);
  
  yPosition = yPosition + speedy;
  xPosition = xPosition + speedx;
  
  if (yPosition > width){
    speedy= speedy * -1;
  } else if (yPosition <0) {
    speedy = speedy * -1;
  }
  
   if (xPosition > width){
    speedx= speedx * -1;
  } else if (xPosition <0) {
    speedx = speedx * -1;
  }
}

