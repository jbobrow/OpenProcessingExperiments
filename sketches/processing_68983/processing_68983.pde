
float x = 200;
float y = 200;
float d = 100;
float cibleX;
float cibleY;
float pupilleD = 30;
   
void setup() {
  size(400,400);
  smooth();
  noStroke();
}
   
   
void draw() {
  background(0);
  fill(255);
   
  stroke(0);
  ellipse(x,y,d,d);
    
  float radians = atan2(mouseY-y,mouseX-x);
  float distance = dist(mouseX,mouseY,x,y);
   
  distance = constrain(distance,0,d/2 - pupilleD/2);   
   
  float pupilleX = cos(radians)* distance + x;
  float pupilleY = sin(radians)* distance + y;
    
  fill(0);
  ellipse(pupilleX,pupilleY,pupilleD,pupilleD);
  
  x = (cibleX-x) *0.07 + x;
  y = (cibleY-y) *0.07 + y;   
}

void mousePressed(){ 
  cibleX = mouseX;
  cibleY = mouseY;
}
