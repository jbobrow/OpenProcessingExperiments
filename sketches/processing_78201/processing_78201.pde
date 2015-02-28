
void setup() {
  size(320, 480);
  frameRate(30);
}


void draw() {
  background(100);
  stroke(0,255,0);
 
  
  
  int h = height;
  int w = width;
  
  int x = mouseX;
  int x2 = x*x/w;
  int x3 = x*x*x/w/w;
  
  int av= (x+x2)/2;
  

  line(x,0,x,h);
  line(x2,0,x2,h);
  line(x3,0,x3,h);
  line(av,0,av,h);
  
  
  line(0,x,w,x);
  line(0,x2,w,x2);
  line(0,x3,w,x3);
  line(0,av,w,av);

  
}
