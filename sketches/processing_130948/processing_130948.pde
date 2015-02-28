
float x = -5;
float y = 5;


void setup() {
  size(500, 500);
  background(255);
  frameRate(120);
  
}

void draw() {
  x = x+10;
  translate(x, y);
  rotate((TWO_PI)/random(2));
  rectMode(CENTER);
  fill(255,255,0);
  if(x >= 500){
    y = y+10;
    x = -5;
  }
  if(y >= 500){
    y = 5;}
    
  fill(x/random(3), random(255), y/3);
  strokeWeight(0.2);
  stroke(255);
  rect(0, 0, (x+y)/20, 10);
  
 
}

