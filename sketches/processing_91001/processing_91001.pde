
//Greg Conte
//Creative Computing
//feb 25
float circleX = 0;
float circleY = 0;
int circleSpeed=2;
void setup() {
  size(500, 500);
}

void draw() {
  fill(mouseX, mouseX, mouseY);
  ellipse(circleY, mouseY, 20, 20);
  circleY=circleY +circleSpeed;

  if (circleY > width) {
    circleSpeed= -6 ;
   
  }
 
 
  
 
    if (circleY< 0) {
      circleSpeed= 2;
    }
   fill (mouseX,mouseY,mouseY);
   ellipse(mouseX, circleX, 50, 10);
  circleX=circleX +circleSpeed;

  if (circleX > width) {
    circleSpeed= -2 ;
  }

    if (circleX< 0) {
      circleY= -2;
    }
    stroke(0);
   fill (random(0,255),random(0,255), random (0,255));
   ellipse(circleX+1,mouseX,mouseX,circleX+1);
   
     stroke(0);
   fill (255,255,255,10);
   ellipse(circleY+1,mouseY,circleY+1,mouseX);
   
  
}



