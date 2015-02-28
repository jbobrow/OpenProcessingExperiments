
float x = 200;
float y = 200;
float d = 100;
 
float xCible = 200;
float yCible = 200;

float pupilleD = 30;
   
void setup() {
  size(400,400);
  smooth();
  noStroke();
}
   
void mousePressed(){
  xCible = mouseX;
  yCible= mouseY;
  
}

void draw() {
  background(0);
  fill(255);
  
   
x = (xCible - x) * 0.04 + x;
y = (yCible - y) * 0.05 + y;
   
   
  stroke(0);
  ellipse(x,y,d,d);
  
    
  float radians = atan2(mouseY-y,mouseX-x);
  float distance = dist(mouseX,mouseY,x,y);
   
  distance = constrain(distance,0,d/2 - pupilleD/2);
   
   
 float pupilleX = cos(radians)* distance + x;
 float pupilleY = sin(radians)* distance + y;
    
  fill(0);
  ellipse(pupilleX,pupilleY,pupilleD,pupilleD);
   
  }


