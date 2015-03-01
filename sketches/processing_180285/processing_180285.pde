
float a=0;
float s=0;

void setup() {
  size(200,200);
  background(255);
}

void draw() { 
  
  fill(255,0,0);
  
  //determine wave length
  a=a+0.1;
  //exchagerates the effect
  s= cos(a) *50;
  
  translate(100,100);
  
  //the circle is stretched in one dimention
  ellipse(0,0+s,50+s,50+s);
  
}


