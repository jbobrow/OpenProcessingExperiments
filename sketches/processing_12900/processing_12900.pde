
  float a;
void setup() {
  size(600,600);
  background(#7C4A24);
}
void draw() {
  fill(#7C4A24,70);
  noStroke();
  rect(0,0,width,height);
   
  for( int x=0; x<width; x++ ) {
    for( int y=0; y<height; y++ ) {
      int n = int(noise(x*0.007,y*0.003+a*2,a)*255);
      if( n%10 < 2 ) {
        set(x,y,color(#5481C6));
      }
    }
  }
  a+=0.005;
  art();
}
void art() {
  stroke(0);
  strokeWeight(2);
  for( int x=1; x<width; x+=4 ) {
  }
}

