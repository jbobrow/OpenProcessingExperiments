
float a;
void setup() {
  size(199,264);
}

void draw() {
  background(255);
  
  for( int x=0; x<width; x++ ) {
    for( int y=0; y<height; y++ ) {
      float r = norm(x,0,width);
      float g = norm(y,0,height);
      float b = (sin(a)+1)*0.5;
      stroke(r*255,g*255,b*255);
      point(x,y);
    }
  }
  a=a+0.01;
  
  windows();
}

void windows() {
  stroke(0);
  strokeWeight(1);
  for( int x=1; x<width; x=x+4 ) {
    line(x,0,x,height);
  }
}

