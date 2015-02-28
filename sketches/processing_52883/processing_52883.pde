
float x,y;

void setup () {
 size(400,400);
 smooth(); 
  
  x = width/2;
  y = height / 2;
  
}


void draw() {
  background(0);
  
  float distance = dist(mouseX,mouseY,x,y);
  
  if ( distance < 30 ) {
    float radians = atan2(mouseY-y,mouseX-x);
    radians = radians + PI;
    x = constrain( cos(radians) * 10 + x , 15, width - 15);
    y = constrain( sin(radians) * 10 + y , 15, height - 15);
  }
  
  
  ellipse(x,y,30,30);
}
