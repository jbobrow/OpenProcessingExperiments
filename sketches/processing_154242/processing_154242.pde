
float mouthSize;
float pacX;
float pacY;
float velocity;



void setup() {
  size(750, 750);
  mouthSize=PI/5;
  pacX=100;
  pacY=height/2;

  velocity = 3;

}

void draw() {

  if (dist(mouseX, mouseY, pacX, pacY) < 100) 
    println("You Win!");


  if (pacX > width + 100)
    pacX = -100;

  background(0);
  fill(255, 255, 0);
  stroke(0);
  arc(pacX, pacY, 200, 200, mouthSize, 2*PI-mouthSize);
  
  
 //dot loop
 stroke(255);
 strokeWeight(20);
 for (int dotX = 0; dotX <= 675; dotX += 75) {
   if ( pacX < dotX ) point(dotX,height/2);
 }
  
  
  pacX += velocity;


}
