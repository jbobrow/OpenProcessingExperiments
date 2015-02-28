
// why is slow?


void setup() {
  size(800,600,P2D);
  frameRate(30);
  
}

void draw() {
  background(255);
  stroke(120);
 
  translate(mouseX,mouseY); 
  scale(0.8);
  
  int num = 45;
  int spikes = mouseX / 20;
  
  float l1 = sin(frameCount * 0.1) * 20 + 40;
  for(int i = 0; i<num; i++){
    float l2 = sin(frameCount * 0.1 + TWO_PI / num * i * spikes) * 20 + 200;
  line(l1,0,l2 ,0);
  ellipse(l2, 0, 15,15);
  rotate(TWO_PI / num);
  }
 
}


