
float r=int(random(255));
float g=int(random(255));
float b=int(random(255));float xVel = 1.5;
int XPos = 200;
int YPos = 200;  
int XVel = 2;
int YVel = 1;

void setup(){
  size(500,500);
  frameRate(60);
  smooth();
  ellipseMode(CENTER); 
  noStroke();
}
void draw(){
  noStroke();
  fill(r*2-XPos/2,g*2-YPos/2,b*2-YPos/2);
  rect(0,0,width,height);
  println("R = "+YPos/2+ "G = "+XPos/2+ "B="+YPos/2);
  ellipse(XPos,YPos,50,50);
  fill(r+YPos/2,b+YPos/2,g+XPos/2);
  
   for (int i=0; i<6; i++) {
    

    ellipse(0+80*(i+1), YPos, 20, 30);
    
    
    ellipse(XPos, 0+80*(i+1), 37, 20); 
  }

  moveCircles(5); 
}

void moveCircles(int speedMultiplier) {

  if (YPos == 10 || YPos == 490) { 
    YVel = YVel*(-1); 
  }
  YPos = YPos + speedMultiplier*YVel;
  
  if (XPos == 10 || XPos == 490) {
    XVel = XVel*(-1);
  }
  XPos = XPos + speedMultiplier*XVel;
}

