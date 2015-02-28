
float eyeR; 
float eyeG; 
float eyeB;
float g = random (255);
float r = random (255); 
float a = random (234); 
float b = random (255); 
float x = mouseX;
float y = mouseY;
int circleX = 50; 
int circleY = 100;
int speed = 1;

void setup() {
  size(200,200);
  smooth();
}


void draw() {
  //background
  background (r,b,a);
  r = mouseX;
  a = mouseX;
  b = mouseY;



//body
  ellipseMode(CENTER);
  rectMode(CENTER);
  stroke(255);
  fill(250,160,63);
  rect(100,100,30,75);
  
  
//head
stroke(255);
fill(250,234,58);
ellipse(100,70,60,60);

//eyes
eyeR = random(255); 
eyeG = random(255); 
eyeB = random(255); 
fill(eyeR,eyeG,eyeB);
rect(85,63,20,10);
rect(115,63,20,10);


//mouth
fill(0);
ellipse(100,85,5,10);

//leg
fill(185,209,255);
stroke(0);
rect(90,148,10,20);
rect(110,148,10,20);

//hat
fill(245,37,37);
rect(100,42,50,1.5);
fill(245,37,37);
rect(100,35,20,15);

//hand
fill(252,148,200);
rect(50,100,4,20);
fill(252,148,200);
rect(150,100,4,20);

 //circle
  circleX = circleX + speed;
  
  if((circleX < 50) || (circleX > 150))  {
    speed = speed * -1;
  }
  
  stroke(0); 
  fill(183,24,24); 
  ellipse(circleX,circleY,10,10);

}

