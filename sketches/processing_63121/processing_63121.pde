



void setup() {
  
  size(800,640);
  noStroke();
  
}

void draw() {
//
// float mx = mouseX/640.0; // normalizing
// float mx2 = mx *255;
// 

float mx = map(mouseX, 0, width,0,255);

 
  fill(mx);
  rect(0,0,width, height);
  
}

