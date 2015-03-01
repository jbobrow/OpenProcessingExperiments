
float mouthSize;
float pacX;
float pacY;
float velocity;


void setup() {
  size(750, 750);
  background(0);
  mouthSize= PI/5;
  pacX = 100;
  pacY = height/2;
  velocity = 15;
  fill(255,255,0);
  arc(pacX,pacY,200,200,mouthSize,2*PI- mouthSize);
  
}

void draw() {
  if  (dist(mouseX,mouseY,pacX,pacY)<100) {
    println("You Win!!!");
  }
  pacX += velocity;  
  background(0);
  //here is a loop that draws ten dots
  strokeWeight(7); 
  stroke(255);
  for (int dotX = 50; dotX <= 700; dotX += 75) {
  point(dotX, height/2);
  if (dotX < pacX) {
  stroke(0);
  } 
  else {
    stroke(255);
  }
  if (dotX <pacX)
}
 
   stroke(0);
  strokeWeight(1);
  arc(pacX,pacY,200,200,mouthSize,2*PI- mouthSize);
  
  if (pacX>850) {
    pacX=-100;
  }
}

