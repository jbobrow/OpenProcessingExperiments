
float dt;
long startTime;

void setup() {
 size(1024,480);
 startTime = millis();
}

void draw() {
  long t = millis();
  dt = (t - startTime)/400.0;
  background(0);
    
  for (int i = 0; i < 10; ++i) {
    noFill();
    stroke(255*floor(i)/10 + 100.255*floor(i)/10  + 30,0, 0, 205*floor(i)/10.0 + 50);
    strokeWeight(2*i*dt*dt/20);
    ellipse(200.0, 240.0, i*5*dt*dt + i*5*dt, i*5*dt*dt + i*5*dt);
  }
  
  for (int i = 0; i < 10; ++i) {
    noFill();
    stroke(0, 255*floor(i)/10 + 100.255*floor(i)/10  + 30,0, 205*floor(i)/10.0 + 50);
    strokeWeight(8*i*dt*dt/20);
    ellipse(800.0, 240.0, i*8*dt*dt + i*8*dt, i*8*dt*dt + i*8*dt);
  }
  
  
  if (dt > 13) {
    startTime = t;
  }
}
