
float grow1 = 250;
float grow2 = 250;
float grow3 = 30;
float grow4 = 30;

float grow5 = 250;
float grow6 = 250;
float grow7 = 470;
float grow8 = 470;

void setup(){
  size(500,500);
  smooth();
}

void circleGrow(){
  
  fill(random(255), random(255), random(255));
  stroke(random(255), random(255), random(255));
  
  grow3 += 5;
  grow4 += 5;
  ellipse(grow1, grow2, grow3, grow4);
  if (grow3 == 500 || grow4 == 500){
    grow3 = 0;
    grow4 = 0;
  }
}

void circleShrink(){
  
  fill(random(255), random(255), random(255));
  stroke(random(255), random(255), random(255));
  
  grow7 -= 5;
  grow8 -= 5;
  ellipse(grow5, grow6, grow7, grow8);
  if (grow7 == 0 || grow8 == 0){
    grow7 = 500;
    grow8 = 500;
  }
}
  
  
void draw(){
  background(random(255), random(255), random(255));
  circleGrow();
  circleShrink();
}
