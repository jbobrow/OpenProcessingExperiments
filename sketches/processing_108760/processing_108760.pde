
float r;
float g;
float b;
float a;

float diam;
float x;
float y;
int ellipseCount = 0;
int state = 0; 

void setup() {
  size(325,325);
  smooth();
  background(255);
}

void draw() {
  // Trailing off transparency
  noStroke();
  fill(255, 255, 255, 15);
  rect(0, 0, width, height);

  // Body
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);
  
  // mouseX is a keyword that the sketch replaces with the horizontal position of the mouse.
  // mouseY is a keyword that the sketch replaces with the vertical position of the mouse.
  noStroke();
  fill(r,g,b,a);
  ellipse(mouseX+random(-10,10),mouseY+random(-10,10),diam,diam); 
  ellipseCount++;
  
  if (state == 0) {
    r = random(255);
    g = random(255);
    b = random(255);
    if (ellipseCount > 100 && ellipseCount < 200){
      state = 1; }
  }
    else if (state == 1){
      r =  255;
      g = 0;
      b = 0;
    if (ellipseCount > 200 && ellipseCount < 300){
      state = 2;}
    }
    else if (state == 2){
      r = 0;
      g = 255;
      b = 0;
    if (ellipseCount > 300 && ellipseCount < 400){
      state = 3;}
    }
    else if (state == 3){
      r = 0;
      g = 0;
      b = 255;
    if (ellipseCount > 400){ 
      ellipseCount = 0; 
      state = 0; } 
    }   
}


