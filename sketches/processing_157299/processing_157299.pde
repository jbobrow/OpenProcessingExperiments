
float time = 0;

void setup() {
  size(800,800);
  colorMode(HSB,100);
  noFill();
  background(0,0,0);
}

void draw() {
  for(int i = 0 ; i < 100 ; i++) {
    rectoid(frameCount - time, i); 
  }
}

void rectoid(float time, int index) {
   stroke(time*noise(index) % 100,100,80,25);
   
   rect(width/2,height/2,cos(index)*time,sin(index)*time);
}

void mouseClicked() {
   background(0,0,0);
   time = frameCount;
}
