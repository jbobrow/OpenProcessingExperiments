


float rad;

float theta = 0;

void setup(){
  size(500, 1000);
  smooth();
  background(0);
}

void draw(){
 background(0);
  stroke(255);
  noFill();
  for(int i = 0; i <= height; i += 50){
    
  awa(250, i);
  }
}

void awa(int x, int y){

  strokeWeight(5);
  rad = random(5, 30);
  ellipse(x+100*sin(theta), y+100*cos(theta), rad, 50);
  theta += 0.3;
}


