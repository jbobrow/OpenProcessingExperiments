
void setup(){
  size(500,500);
  background(255);
  smooth();
  frameRate(15);
  noStroke();
}

void draw(){
  float a = random(1,2);
  float i = random(-1,0);
  for( i=0; i<1; i=i+10){
  triangle(mouseX+a, mouseY+a,i,i+30,i,i);
  fill(29,29,27,2);

  }
}

