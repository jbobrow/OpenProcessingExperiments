
void setup(){
  size(500,500);
  colorMode(HSB);
  noStroke();
}
 
void draw(){
  background(0);
  fill(0);
 
  //experimenting with the minus iterator 
  for (int j= height; j >= 0; j--) {
    for( int i= width; i >= 0; i--) {
      fill(i*5, 255, 255);
      ellipse(i*20,j*20,i+1,i+1);
    }
  }
}



