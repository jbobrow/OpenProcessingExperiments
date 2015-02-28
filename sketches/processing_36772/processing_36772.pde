
void setup(){
  size(500, 500); 
}

void draw(){
  background(255,255,255);
  fill(0,0,0);
  smooth();
  
  float constrainedMouseX = constrain(mouseX, 0, width);
  float entropy = map(constrainedMouseX, 0, width, 0, 255);
  float antiEntropy = map(entropy, 0, 255, 0, 200);
  
  for(int i = -20; i < width+40; i=i+20){
    for(int j = -20; j < height+40; j=j+20){
      translate(i, j);
      rotate(entropy);
      fill(random(antiEntropy,entropy), random(antiEntropy,entropy), random(antiEntropy,entropy));
      rect(0, 0, random(antiEntropy,entropy), random(antiEntropy,entropy));
      rotate(-entropy);
      translate(-i,-j);
    }
  }
}               
