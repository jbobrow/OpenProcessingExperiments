

int r, g, b;

void setup(){
  size(600, 600);
  noStroke();
  background(0);
  makeTartan();
}

void resetColour(){
  
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
}

void makeTartan(){
  resetColour();
  genStripes(20, 30);
  
  resetColour();
  genStripes(20, 30);
}

void genStripes(int a, int f){
  
  for(int i = 1; i < f; i++){
  fill(r, g, b, a);
  rect(int(random(width)), 0, int(random(100)), height);
  }
  for(int i = 1; i < f; i++){
  fill(r, g, b, a);
  rect(0, int(random(height)), width, int(random(100)));
  }
}

void draw(){
}

void mouseClicked(){
   background(0);
   makeTartan();
}

