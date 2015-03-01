
void setup() {
size(400, 400);
background(0);
}

void draw() {
  rectMode(CENTER);
  
  float litR = random(255);
  float litG = random(255);
  float litB = random(255);
  fill(0, 0, litB);
  rect(width/2, height/2, 100, 100);
  
  fill(255);
  text("deep space", 175, height/2);
}


