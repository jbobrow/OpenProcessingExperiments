
float px, py, px2, py2;
float angle, angle2;
float radius = 200;
float frequency = 3;
float frequency2 = 3;
float x, x2;
float currentColor = 0;
float currentColorRect = 0;
float currentColorRect2 = 0;

void setup() {
  size(800, 300);
  background(0);
}

void draw() {
  background(0);
  px = cos(radians(angle))*(radius);
  py = 150 + sin(radians(angle))*(radius/2);
  

  rectMode(CENTER);
  noStroke();
  fill(currentColorRect2);
  rect(x, py, 60, 60);
  

  rectMode(CENTER);
  noStroke();
  fill(currentColorRect);
  rect(x, py, 40, 40);
  
  ellipseMode(CENTER);
  noStroke();
  fill(currentColor);
  ellipse(x, py, 20, 20);
  
  
  angle -= frequency;
  x+=1;
  
  
  if (mousePressed) {
   
   currentColorRect = 100;
   currentColorRect2 = 50;
   
  }
  else{
   currentColor = 255 ; 
   currentColorRect = 0;
   currentColorRect2 = 0; 
  }
}


