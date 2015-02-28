
//
// put 7 objects around the mouse equally spaced 
//

int numObj = 12;
int distance = 50;
float angleInc = TWO_PI/7;
float currAngle = 0;

void setup() {
  size(600,600);
  noStroke();
  smooth();
}

void draw() {
  background(0);
  colorMode(HSB, 360, 100, 100);
  distance = int(sin(millis()*.01)*50);
  
  for (int i = 0; i < numObj; i++ ) {
    fill(map(angleInc * i, 0, TWO_PI, 0, 360), 100, 100); // converting radians to degrees
    float offsetX = cos(angleInc * i)*distance;
    float offsetY = sin(angleInc * i)*distance; 
    ellipse(mouseX + offsetX , mouseY + offsetY, 20, 20);
    offsetX = cos(angleInc * i+PI)*distance;
    offsetY = sin(angleInc * i+PI)*distance; 
    ellipse(mouseX + offsetX , mouseY + offsetY, 20, 20);
    
    distance += 20;
  }

//YOU CAN DO THIS BY HAND TOO
//  float offsetX = cos(currAngle)*distance;
//  float offsetY = sin(currAngle)*distance;
//  offsetX = cos(currAngle+angleInc)*distance;
//  offsetY = sin(currAngle+angleInc)*distance;
//  ellipse(mouseX+offsetX, mouseY + offsetY, 20, 20);
//  
//  offsetX = cos(currAngle+2*angleInc)*distance;
//  offsetY = sin(currAngle+2*angleInc)*distance;
//  ellipse(mouseX+offsetX, mouseY + offsetY, 20, 20);
//  
//  offsetX = cos(currAngle+3*angleInc)*distance;
//  offsetY = sin(currAngle+3*angleInc)*distance;
//  ellipse(mouseX+offsetX, mouseY + offsetY, 20, 20);
//  
//  offsetX = cos(currAngle+4*angleInc)*distance;
//  offsetY = sin(currAngle+4*angleInc)*distance;
//  ellipse(mouseX+offsetX, mouseY + offsetY, 20, 20);
  
}


//float  rectX;
//float angle = 0;
//
//void setup () {
//  size(400,400);
//  rectX = width *.5;
//}
//
//void draw() {
//  angle += 0;
//  background(0);
//  rectX = cos(millis() * .005)*50 + mouseX; // cos/sin(a * b) * c + d
//  //d moves the shape over so it doesn't go off the screen
//  //c changes the distance which the shape moves back and forth
//  //b changes how fast it does this
//  rect(rectX, height*.5, 20, 20); // faster for computers to multiply than divide
//}
