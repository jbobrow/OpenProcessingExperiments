

float angle;
float radius;
int cX;
int cY;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  angle = 0;
  radius = 10;
  cX = 500/2;
  cY = 500/2;
}

void draw() { //draw function loops 
  int xx = 5;
  radius+=xx*Math.sin(angle/45);
  int pX = cX+Math.cos(angle)*radius;
  int pY = cY+Math.sin(angle)*radius;
  
  fill(radius%4,radius%4,radius%4,5);
   //ellipse(pX, pY, 5, 5);
  angle++;
  stroke(radius,radius,radius);
  line(cX,cY,pX,pY);
}
