


void setup(){
  size(600,600);
  background(0);
  smooth();
}


void draw(){
// randomSeed(0);
 for(int i=0; i < width; i+=10) {
   for(int j=0; j<height; j+=10){
  float x = random(0, 255);
  stroke(0);
  fill(x);
  rect(i, j, 20, 20);
}  
 }
}

