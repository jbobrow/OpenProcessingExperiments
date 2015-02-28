
float r = random(0,450);
float d = random(0,450);
float x = random(40,60);

void setup() {
  size(450,450);
  background(0);
  
}

void draw() {
}

void keyPressed() {
  x = random(40,60);
  r = random(0,450);
  d = random(0,450);
  fill(random(255),random(255),random(255));
  rect(r,d,x,x);
}               
