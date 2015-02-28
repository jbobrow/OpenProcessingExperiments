
void setup(){
  size(640, 480);
  frameRate(30);

}

void blackbox(int rectW, int rectH){
   rect(random(mouseX), random(height), rectW, rectH);
   fill(random(255), random(255), random(255));
}

void draw(){
  background(0, 0, 0);
  noStroke();
  for(int i = 0; i < 1000; i++){
  blackbox(1, 1);
  }
}

