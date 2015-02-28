


int     radius;
float	frequency, position, positionAdder;
float   pos1, pos2;
float bezPos1, bezPos2;

// Blue balls

int radiusBlueBall = 15;
float [] xPos = new float [12];  
float [] yPos = new float [12];

void setup() {
  size(600, 600);
  background(255);
  smooth();
  
  radius = 50;
  frequency = 200;
  position = 0;
  positionAdder = ((float)frequency / 44100) * TWO_PI;
  
  for (int i = 0; i < 12; i++) {
    int deg = i * 30;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radiusBlueBall;
    yPos[i] = sin(angle) * radiusBlueBall;
  }
  
}

void draw(){
  
  noStroke();
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  
  translate(width/2, height/2);
  
  position += positionAdder;
  
  // Red Ball
  noStroke();
  fill(255, 0, 0);
  pos1 = oscillationPositive(position);
  ellipse(100, pos1, 20, 20);
  
  // Red Bezier
  noFill();
  strokeWeight(3);
  stroke(255, 0, 0);
  bezPos1 = oscillationPositive(position);
  bezier(0, 0, 30, bezPos1, 20, bezPos1, 100, bezPos1);
  
  // Green Ball
  noStroke();
  fill(0, 255, 0);
  pos2 = oscillationNegative(position);
  ellipse(100, pos2, 20, 20);
  
  //Green Bezier
  noFill();
  strokeWeight(3);
  stroke(0, 255, 0);
  bezPos2 = oscillationNegative(position);
  bezier(0, 0, 30, bezPos2, 20, bezPos2, 100, bezPos2);
  
  // Blue balls
  for (int i = 0; i < 12; i++) {
    strokeWeight(2);
    stroke(0, 0, 255);
    ellipse(xPos[i], yPos[i], 15, 15);    
  }


}

float oscillationPositive(float position) {

  float pos = sin(position);
  pos = pos * radius;

  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { position -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}

float oscillationNegative(float position) {

  //Subtract PI to provide a value on the opposite side in radians
  float pos = sin(position-PI);
  pos = pos * radius;
  
  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { position -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}


