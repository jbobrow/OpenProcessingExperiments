
/*
    Andor Salga
    March 2014
    Idea based on '0th dimension'
    
    Changed code to avoid using any state other than using millis()
*/
final int NumLines = 10;

void setup(){
  size(400, 400);
  stroke(255);
  strokeWeight(10);
}

void draw(){
  fill(0,15);
  // offset rect rather than calling noStroke()
  rect(-10,-10, width+20, height+20);
  
  noFill();
  for(int i = 0; i < NumLines; i++){
    float s = (millis()/1000.0 + i) % NumLines;
    ellipse(width/2, height/2, s * 100, s * 100);
  }
}
