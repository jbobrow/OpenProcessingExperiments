
int x;
int y;
int iH; 
int iV; 

void setup() {
  size(760,760);
  frameRate(10);
  smooth();
}

void draw() {
  background(121,7,7);
  
 
  iH = 30;
  iV = 30;
  
  for(y = 75; y <= 720; y += iV) {
    for(x = 75; x <= 680; x += iH) {
      strokeWeight(random(0.5,2));
      stroke(234,202,12);
      noFill();
      ellipse(x,y,random(20),random(20));
    }
  }
}


