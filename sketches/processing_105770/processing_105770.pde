
int yPos = 180;
int xVel = 1;
int xPos = 200;
int yVel = 1;
int diameter = 20;
int value;

void setup (){
  size(400, 400);
  noStroke();
  value= 20;
}
void draw (){
  
  fill(255, 10);
  rect(0,0, width, height);
  fill(255, value, 100);
  
  for (int i = -10; i < 40; i++){
  ellipse (80*(i+1), yPos, diameter, diameter);
  ellipse(xPos, 80*(i+1), diameter, diameter); 
  ellipse(20*(i+1),yPos , diameter, diameter); 
  ellipse(xPos, 15*(i+1), diameter, diameter); 
 }
 
 moveCircle();
}

void mousePressed() {
  if (value == 20) {
    value = (230);
    } else {
      value = 20;
    }
}


void moveCircle(){
  if(yPos < - 80 || yPos > 440){
    yVel=yVel * (-1);
    }
    yPos = yPos + yVel;
    
  if (xPos < - 30 || xPos > 460) {
    xVel = xVel*(-1);
    }
    xPos = xPos + xVel;
  
}
