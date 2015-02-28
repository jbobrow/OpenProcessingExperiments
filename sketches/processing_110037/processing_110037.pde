
void setup() {
  size(600, 600);
  background(0);
}

float noiseScale = 0.02;

void joyDivision() { 
  
  for (int x =0; x<=300; x+=3) {
    for (int y =150; y<=450; y+=15) {
 
  float noiseY = noise((mouseX+x)*noiseScale, 
                            mouseY*noiseScale);
  line(x+150, y+noiseY*random(50, 60), x+150, y+noiseY*random(50, 90)+3);  
  stroke(255);
  }
  }
}

void draw() {
  background(0);
   joyDivision();
}
