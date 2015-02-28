
void setup(){
 background(255);
 noFill();
  size(500, 500);
  // Decrease framerate for better visual outcome
  frameRate(5);
}

int a=1;

void draw(){
  ellipse(250,250,a*a,a);
  ellipse(250,250,a,a*a);
  a += 4; 
  
}

