
float a;

void setup() { 
  size(600, 400);
  stroke(0); 
  a = height/2;
}

void draw() {  
fill (255);
rectMode(CORNER);
rect(a,0,a,width);
a = a-0.6;
if ( a < 0) { 
a = height;
  }
}
