
int xPos = 0;
int yPos = 5;
int speed = 15;  
int yspeed = 1;


void setup(){
size(400,400);
 smooth();
 
}

void draw(){
  background(255);
  fill(0);
  fill(random(255),random(255),random(255));
 
  
  xPos = xPos + speed;
  if(xPos >= width || xPos < 0){
    speed = speed * (-1);
  }
   yPos = yPos + yspeed;
  if(yPos >= height || yPos < 0){
    yspeed = yspeed * (-1);
  }
  //noStroke();
  ellipse(xPos, yPos, 30, 30);
  noFill();
  strokeWeight(10);
  stroke(random(255),random(255),random(255));
  rect(0,0,400,400);
}


void mousePressed(){
  saveFrame("ball.png");
}

