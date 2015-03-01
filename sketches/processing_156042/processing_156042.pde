


float rad;

float theta = 0;

void setup(){
  size(500, 1000);
  smooth();
  background(0);
  frameRate(10);
}

void draw(){
 background(0);
  stroke(255);
  fill(255);
  for(int i = 0; i <= height; i += 30){
    for(int j = 0; j <= width; j += 30){
      
  awa(j, i);
  
    }
  }
}

void awa(int x, int y){

  strokeWeight(1);
  rad = random(1, 10);
  ellipse(x+100*sin(theta), y+100*cos(theta), rad, rad);
  theta += 0.3;
}


