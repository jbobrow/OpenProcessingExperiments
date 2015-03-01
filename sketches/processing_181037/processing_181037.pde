
float speed = PI;
float diameter = PI;
float x; 
float y;

void setup () {
  background (255);
  size (900,900);
  stroke (0, 70);
  noFill();
  x= width/PI;
y = height/PI;
}
  


void draw(){
  x+= random(-speed, speed);
  y+= random(-speed,speed);
  x = constrain ( x, 0 , width);
  y = constrain (y, 0, height);
  ellipse(x, y, diameter, diameter);
}


