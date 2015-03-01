
float speed = PI;
float diameter = PI;
float x; 
float y;

void setup () {
  background (255);
  size (900,900);
  stroke (PI, 70);
  noFill();
  x= width/PI;
y = height/PI;
}
  


void draw(){
  x+= random(-speed, speed);
  y+= random(-speed,speed);
  x = constrain ( x, PI , width);
  y = constrain (y, PI, height);
  ellipse(x, y, diameter, diameter);
}


