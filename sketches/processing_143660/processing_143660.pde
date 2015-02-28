
void setup(){
  size(600,600);
  background(3,3,3);
  smooth();
 
  //noLoop();
}
void draw (){
  background(3,3,3);
  noStroke();
  noFill();
  
  for (int i = 0; i <width; i = i + 30) {
    for (int j = 0; j <height; j = j + 30) {
      fill(0,255,255,255);
      ellipse(i,j,10,10);
    }
  }
}

