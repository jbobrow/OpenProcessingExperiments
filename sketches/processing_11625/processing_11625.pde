
float a;
color[] cs = {color(255),color(0)};
void setup() {
  size(199,264);
}
void draw() {
  fill(0,80);
  noStroke();
  rect(0,0,width,height);
  
  for( int x=0; x<width; x++ ) {
    for( int y=0; y<height; y++ ) {
      int n = int(noise(x*0.007,y*0.003+a*1.5,a)*255);
      if( n%10 < 4 ) {
        set(x,y,color(255));
      }
    }
  }
  a+=0.001;
  windows();
}
void windows() {
  stroke(0);
  strokeWeight(1);
  for( int x=1; x<width; x+=4 ) {
    line(x,0,x,height);
  }
}

