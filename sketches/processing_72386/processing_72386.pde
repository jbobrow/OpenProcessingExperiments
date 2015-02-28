

void setup(){
  size(300,600);
  noStroke();
  background(255,255,255);
}

void draw(){
fill(0);
  for (int j= 0; j < width; j++) {
    for( int i=0; i < height; i++){
  
    ellipse(j*20,i*20,i+2,i+2);
  
  }
    
  
  }
}

