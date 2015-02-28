
void setup(){
  size(500, 500);
  background(255);
  smooth();
  noStroke();
}

void draw(){
  int r=15;
  for(int i=0;i<width;i+=r+2){
    for(int j=0;j<height;j+=r+2){
      fill(i/2, j/2, 0); 
      ellipse(i, j, r, r);
    }
  }
}


