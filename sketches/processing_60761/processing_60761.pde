
void setup() {

  size(400, 400);
  background(255);
  smooth();
}

void draw(){

  
  noStroke();
  rectMode(CENTER);
  
  
  for(int i=0; i<=400; i=i+20){
  for(int j=0; j<=400; j=j+20){
    rotate(PI/random(0,100));
    
    fill(mouseX, j, i);
    rect(i, j, random(5,20), random(5,20));
  }
  }
}


