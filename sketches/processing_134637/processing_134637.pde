
  int i = 1;
  float fn= 0;
  
  void setup() {
    smooth (5);
    size (700, 300);
    stroke(250);
    frameRate(15);
  }
  
  void draw() {
    fn +=1;
    background(0,0,0);
    
    for(int x = 0; x < width; x=x+1) {
      stroke ( 250,250,250);
      float n = noise(float (x) /100,fn/100);
      n = map(n,0,1,mouseX,mouseY);
      line (x,0,x,n-1);
    }
    
    i+=1;
  }
