


//================================= global vars

int num = 10;    
float angnoise, radiusnoise;
float xnoise, ynoise;
float angle = -PI/2;
float radius = 100;
float strokeCol = 254;
int strokeChange = -1;


//================================= init

void setup() {
  size(1300, 800);
  smooth(); 
  frameRate(30);
  
  background(255);
  
  angnoise = random(10);
  radiusnoise = random(10);
  xnoise = random(10);
  ynoise = random(10);
}
//================================= frame loop

void draw() {
  
  radiusnoise += 0.005;
  radius = (noise(radiusnoise) * 550) +1;
  
  angnoise += 0.005;
  angle += (noise(angnoise) * 6) - 3;
  if (angle > 360) { angle -= 360; }
  if (angle < 0) { angle += 360; }
  
  // wobble centre
  xnoise += 0.01;
  ynoise += 0.01;
  float centreX = width/2 + (noise(xnoise) * 100) - 50;
  float centreY = height/2 + (noise(ynoise) * 100) - 50;
  
  float rad = radians(angle);
  float x1 = centreX + (radius * cos(rad));
  float y1 = centreY + (radius * sin(rad));
  
  // opposite
  float opprad = rad + PI;
  float x2 = centreX + (radius * cos(opprad));
  float y2 = centreY + (radius * sin(opprad)); 
  
  noFill();
  strokeCol += strokeChange;
  if (strokeCol > 254) { strokeChange *= -1; }
  if (strokeCol < 0) { strokeChange *= -1; }
  stroke(strokeCol, 60);
  strokeWeight(1);
  line(x1, y1, x2, y2);
}


//================================= 

void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("waveclock-####.png");
  }
}

void mousePressed() {
  background(255);
}




