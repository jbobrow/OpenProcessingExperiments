
void setup(){
  size(450,450);
  background(0);
  noStroke();
  fill(255,255,255);
  strokeWeight(2);
  smooth();
}

void draw(){
  for(int i=0; i<width; i+=50){
    for(int j=0; j<height; j+=50){
      figure();
      translate(50,0);
    }
    translate(-width,50);
  }
}

void figure(){
  rect(0,0,50,50);
  filter(INVERT);
}
