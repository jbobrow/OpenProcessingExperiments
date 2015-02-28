
void setup() {
  size(600,600);
  background(0);
  strokeWeight(1);
  smooth();
}

void draw(){
  randomSeed(mouseX);
  
  for (int i=0; i<600; i+=10){
    for(int j=0; j<600; j+=10){
      
      fill(random(255), random(255), random(50));
      rect(i,j,random(10),random(10));
    }
  }  
}

