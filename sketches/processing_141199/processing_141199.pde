
float cx;
float cy;
float diameter;
float radius;

float x;
float y;
float angle;

void setup(){
  size(500, 500);
  frameRate(10);
  cx = width/2;
  cy = height/2;
  diameter = (width/3)*2;
  radius = diameter/2;
  angle = -90;
  
  ellipseMode(CENTER);
}

void draw() {
  
  background(128);
  fill(255);
  ellipse(cx, cy, diameter, diameter); 

  if(frameCount % 10 == 0){ // every second add one to the angle
    angle++;
    println(angle);
  }
  
  x = cos(radians(angle))*radius;
  y = sin(radians(angle))*radius;
  
  line(cx, cy, cx+x, cy+y);
  ellipse(cx+x, cy+y, 10, 10);
  
}


