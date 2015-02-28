
void setup() {
  size(400, 400);
  background(0);
  smooth();
  noLoop();
  
  colorMode(HSB,360,100,100);
}

void draw(){
  for(int i= 0; i < 360;i++){
    stroke(i,100,100);
    strokeWeight(random(1,20));
    fill(0);
    bezier(0, 20+i, i, i*2, 90+i, 0, i*5, i+80);
  }
}

