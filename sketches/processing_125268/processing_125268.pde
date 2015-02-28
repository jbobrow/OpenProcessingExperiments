
void setup(){
  size(800,800);
  
}

void draw() {
  rectMode(CENTER);
  for(int i=0;i<width;i+=30){
    for (int j=0;j<height;j+=30) {
      for(int k=10;k<30;k+=2){
        noFill();
        strokeWeight(2);
        stroke(int(random(255)));
        rect(i,j,k,k);
      }
    } 
  }
}
