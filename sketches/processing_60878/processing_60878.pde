
int xPos = 0;
int speed = 1;
 
void setup(){
  size(300, 700);
  background(255);
  smooth();
}

void draw(){
  //float circleSize = random(100);
  xPos = xPos + speed;
  
  if (xPos > width || xPos < 0) {
    speed = speed * -1;
  }
  
  stroke(210, 120);
  strokeWeight(random(1,20));
  fill(random(255) ,random(255), random(255));
  //ellipse(xPos, random(height), circleSize, circleSize);
  ellipse(xPos, random(height), 5, 5);
}



void keyPressed(){
  saveFrame("Ball-Zeichenautomat.png");
}

