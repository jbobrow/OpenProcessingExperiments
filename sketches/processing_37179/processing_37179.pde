
float xPos;
float yPos;
 
void setup(){
  size(400,400);
  background (255);
  xPos = 6;
  yPos = 6;
}
 
void draw(){
  // on each frame, move 5% towards the target (mouse) in X, 
  //            and move 2% towards the target (mouse) in Y 
 
  for (float x=xPos; x<200; x=x+6){
   for (float y=yPos; y<200; y=y+6){
  xPos = xPos + .06*mouseX; 
  yPos = yPos + .05*mouseY;
  float strokecolor= random (0,220);
  stroke (strokecolor);
//line(xPos, 200,yPos, 400);
 line (xPos, yPos,  5, 400);
   }
  //ellipse(xPos, yPos, 20,20);
}
}
