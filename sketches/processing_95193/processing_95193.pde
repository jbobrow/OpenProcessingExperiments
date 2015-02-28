
int upp=+25;

void setup(){
  size(500, 500);
  background(255);
  strokeWeight(0);
}

void draw(){
  
  //The bars
  upp=upp-1;
  upp=max(0, upp);
  fill(0);
  rect(150, 200+upp, 18, 40);
  rect(175, 180+upp, 18, 60);
  rect(200, 160+upp, 18, 80);
  rect(225, 140+upp, 18, 100);
  rect(250, 120+upp, 18, 120);
  
  //The Signal starter
  rect(100, 235, 10, 30);
  rect(100, 205, 10, 30);
  rect(85, 220, 40, 10);
  fill(20,193,47);
  ellipse(105, 220, 50, 30);
  
  
  
}

