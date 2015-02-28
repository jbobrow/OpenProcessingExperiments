
void setup() {
  size(600,600);
  background(0);
  noStroke();
  smooth();
}

void draw(){
  if (mousePressed) {
  
  for (int i = 0; i< width; i+= 45){
    for(int j = 0; j< height; j+= 45){
      
      fill(random(100), 0, random(255));
      rect(i+5,j+5,25,25);
    }
  }  
  }
}

