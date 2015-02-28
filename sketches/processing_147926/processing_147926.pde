
//noise mountains

int n = 100;
int x;
float y = .05;
float noiseY;
float sWeight;

void setup() {
size(1000,600);
background(1,47,77,255);
frameRate(5);
}

void draw() {

  fill(1,47,77,57);
  rectMode(CENTER);
  rect(500,300,1010,610);
  
for(int i = 1; i < n; i++) {
 y += .02;
 x = i* (width/n);
 noiseY = noise(y) * height;
 sWeight = (int(random(7))); 
 strokeWeight (sWeight);
 line(x, height, x, noiseY);
 float a = (int(random(256)));
  float b = (int(random(256)));
   float c = (int(random(256)));
 stroke(a,b,c,157);
}
}

void mousePressed() {
  noLoop();
}

void keyPressed() {
loop();
}

