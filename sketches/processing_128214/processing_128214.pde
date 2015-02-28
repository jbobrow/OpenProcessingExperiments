
void setup(){
  size(600,600);
  background (random(120));
  smooth();
  strokeCap(SQUARE);
  frameRate(5);
}

void draw(){
  for(int i=0; i<100; i++){
    strokeWeight(6);
    stroke(random(120), random(100), random(120));//random(200));
    line(i*6, 0, i*6, 800);
 
  }
  filter (BLUR);
}




