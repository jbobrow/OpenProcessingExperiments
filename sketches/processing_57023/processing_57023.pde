
int x = 0;

void setup() {
  size (500, 500);
  frameRate(100);
  noStroke();
  smooth();
}

void draw() {
  
  if( x==0 ){
  fill(random(255), random(255), random(255), 3);
  ellipse(random(500), random (500), 100, 100);
  fill (155);
  }
  
  if (x == 1){
    
  }
  
}

void mousePressed() {
  if(x == 0) {
    x = 1;
  } else {
    x = 0;
  }
}

