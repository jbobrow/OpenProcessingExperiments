
float time=0;

void setup() {
  size(400,400);
  stroke(255);
  frameRate(20);
  colorMode(HSB,100);
  smooth();

}

void draw() {
  time += 0.005;
  background(#0D1339);
  translate(width/2, width/2);
  
  for (int i = 0; i < 20; i++) {
    rotate(time);
    fill(100* noise(time*5),50,50,80);
    rect(i,i,i*5,i*5);
  }
}
