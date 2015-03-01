
int r=int(random(0,255));
int g=int(random(0,255));
int b=int(random(0,255));
int x=int(random(0,500));
int y=int(random(0,500));
int size=2;

void setup() {
 size(500,500);
 smooth();
 background(0); 
}

void draw() {
  stroke(r,g,b);
  noFill();
  ellipse(250,250,size,size);
  line(250,250,x,y);
    
  r=int(random(0,255));
  g=int(random(0,255));
  b=int(random(0,255));
  x=int(random(0,500));
  y=int(random(0,500));
  size=size+1;
  
  if(mousePressed) {
    background(0);
    size=2;
  }
  
}


