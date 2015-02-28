
void setup(){
  size(400,400);
  smooth();
  noStroke();
}

void draw(){
  for(int i=0; i<width ; i+=4){
    for(int j=0; j<height ; j+=4){
      fill(random(255),random(255),random(255));
      rect(i,j,4,4);
    }
  }
}

