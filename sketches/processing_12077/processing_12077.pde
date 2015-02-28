

void setup(){
  size(600, 600);
  background(250, 159, 217);
  smooth();
  
  
  float x1 = 100;
  float y1 = 100;
  
  beginShape();
  int i = 0;
  while(i < 100) {
    x1 = random(width*.2);
    y1 = random(height*.2);
    ellipse(x1, y1, x1/2, y1/2);
    i+=2;
  }
  
 while(i < 1000) {
    x1 = random(width*.4);
    y1 = random(height*.4);
    ellipse(x1+300, y1+300, x1/2, y1/2);
    i+=2;
 }
    
  endShape();
}




