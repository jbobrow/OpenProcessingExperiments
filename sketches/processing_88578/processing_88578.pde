
void setup() {
  size (400, 400);
  smooth();
}

void draw() {
  background(0, 0, 0);
  for (int i=400; i>0; i-=20){
    for (int j=400; j> 0; j-=20){
      stroke(40,255,0);
      fill(0,0,0);
      rectMode(CENTER);
      rect(200,200,i,j);
    }
  }
  
  for (int i=50; i<400; i+=100){
    for (int j=50; j<400; j+=100){
      fill(255,255,255);
      rect(i,j,40,40);
    }
  }
}


