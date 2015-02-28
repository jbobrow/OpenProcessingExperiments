
//FIXED POINT TEST

int fixedX, fixedY, endX, endY;    //integers
int chimeLength;

void setup() {
  size(700, 400);
  background(255);
  fixedX = width/2;    //Sets the fixed point as the center of the screen
  fixedY = height/2;
  chimeLength = int(width/5);    //the length of the windchime
}

void draw(){
  fill(255);
  rect(0, 0, width, height);
  chimeMove();    //runs the chimeMove class to invoke movement
}

void chimeMove(){
  int mouseFollowX = mouseX - fixedX;    //sets two variables to follow the location of the mouse
  int mouseFollowY = mouseY - fixedY; 
  float distance = sqrt(mouseFollowX * mouseFollowX + mouseFollowY * mouseFollowY);    // calculates distance of ...
  
  int a = chimeLength;
  int b = chimeLength;
  float c = min(distance, a + b);    //calculates the smallest number out of the values
  
  float B = acos((b*b - a*a - c*c) / (-2*a*c));    //trigonometry calculations
  float C = acos((c*c-a*a-b*b)/(-2*a*b));
  
  float D = atan2(mouseFollowY, mouseFollowX);
  float E = D + B + PI + C;
  
  endX = int((cos(E) * a)) + fixedX;
  endY = int((sin(E) * a)) + fixedY;
  
  stroke(0);
  line(fixedX, fixedY, endX, endY); 
  
  
  
  
  
  
}
  





