
int xPos = 100;
int xDir = 5;
int yPos = 100;
int yDir = 5;

void setup() {
 size(500,400);
 smooth();
 
}

void draw() {
  
  int m = millis();
  
  background(0);
  ellipse(xPos, yPos, 50, 50);
  xPos += xDir;
  yPos += yDir;
  if(xPos > width-25 || xPos < 25){
    xDir = xDir * -1;
  }
  if(yPos > height-25 || yPos < 25){
    yDir = yDir * -1;
  }
  
  
  if(mousePressed){
    if(mouseX < width/2){
      fill(m % 255,0,0);
      rect(0,0,width/2,height);
    }
    if(mouseX > width/2){
      fill(0,0,m % 255);
      rect(width/2,0,width/2,height);
    }
  }
  
}


