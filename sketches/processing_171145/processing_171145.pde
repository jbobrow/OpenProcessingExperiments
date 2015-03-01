
void setup(){
  size(1000,250);
}

float n=0.03;

void draw(){
  background(0);
  for(int i=0; i<width; i++){
    float v=noise((mouseX+i)*n,mouseY*n);
    stroke(0,v*250,v*150);
    strokeWeight(20);
    line(i, mouseY+v*80, i, height-mouseY-v*80);
    stroke(255,v*255,v*255);
    strokeWeight(20);
    line(i, mouseY+v*80, i, height-mouseY-v*80);
  }
}
