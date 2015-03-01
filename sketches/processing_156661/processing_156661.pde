
//Easing example showing the ball following the mouse 

float circleX, circleY;
float diam = 30;
float easing = 0.1;
float red, blue, green;


void setup() {
  size(700, 700);
  background(255);
  circleX = width/4;
  circleY = height/4;

}


void draw() {

  float targetX = mouseX;
  float targetY = mouseY;
  
  fill ((abs(diam) % 255), mouseY, mouseX);
  
  circleX += (targetX - circleX)*easing;
  circleY += (targetY - circleY)*easing; 
  
  ellipse(circleX, circleY, diam, diam);


}



