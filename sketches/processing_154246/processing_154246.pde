
float mouthSize;
float pacX;
float pacY;
float velocity;
float mouthChange;


void setup() {
  size(750, 750);
  background(0);
  mouthSize = PI/5;
  pacX = 100;
  pacY = height/2;
  velocity = 2;
  mouthChange = .008;

  
  

  


}

void draw() {
  if (dist(mouseX, mouseY, pacX, pacY) < 100) 
    println("You Win");
    

  if (pacX > width + 100)
  pacX =-100;
  background(0);
  fill(255, 255, 255);

  // here is a loop that draws 10 dots
  stroke(255, 255, 255);
  strokeWeight(5);
  for (int dotX = 0; dotX <= 675; dotX += 75)  {
    point(dotX, height/2); }
  
 mouthSize += mouthChange;
 if (mouthSize >= PI/4) mouthChange = -.10;
  if (mouthSize <= 0) mouthChange = .10;
  pacX += velocity;
 fill(255, 255, 0);
 stroke(0,0,0);
 strokeWeight(1);
  arc(pacX, pacY, 200, 200, mouthSize, 2*PI - mouthSize);
  

}
