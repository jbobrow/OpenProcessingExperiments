
int i = 1;
float fn= 0;
 
void setup() {
  smooth (10);
  size (1300, 500);
  stroke(250);
  frameRate(36);
  noCursor();
}
 
void draw() {
  fn ++;
  background(72,235,255,50);
   
  for(int x = 0; x < width; x ++) {
    stroke (255,173,213);
    float n = noise(float (x) /100,fn/100);
    n = map(n,0,1,n,mouseY);
    line (x,0,x,n-1);
  }
   
  i+=1;
}

