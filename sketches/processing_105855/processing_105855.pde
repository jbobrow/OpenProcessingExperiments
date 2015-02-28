
void setup(){
  size(600,600);
  background(255);
}
 
void draw(){
  noStroke();
  fill(0,0,0);
  for(int i=15; i<height; i+=75){
    for(int j=15; j<width; j+=75){
      rect(j,i,60,60);
    }
  }
  fill(255,255,255);
  for(int i=30; i<height; i+=45){
    for(int j=25; j<width; j+=45){
      rect(j,i,30,30);
    }
  }
 
  }



