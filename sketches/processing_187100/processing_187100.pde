
void setup(){
  size(600, 600);
}
  
void draw(){ background(255,255,255);
  for(int i = 0; i<width; i = i + 1)
  for(int k = 0; k<height; k = k + 1){
  noStroke();
  smooth();
  fill(i*35,k*85,150);
  ellipse(i*40,k*50,50,50);
//  fill

  
  }
}

