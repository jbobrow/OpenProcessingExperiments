
float a,b;
float[] x = {0};
float[] y = {0};
float ang;

void setup() {
  size(199,264);
  background(255);
  frameRate(30);
}
void draw() {
  background(255);
  noStroke();
  pushMatrix();
  translate(width/2,height/2);
  scale(1,1.5);
  rotate(ang);
  for( int i=0; i<x.length-1; i++ ) {
    float c = map(i,ang*50,x.length,1,0);
    stroke(c*255);
    strokeWeight(c*50);
    line(x[i],y[i],x[i+1],y[i+1]);
  }
  popMatrix();
  
  a = random(-5,5);//random(-5,5);
  b = random(-5,5);//random(-5,5);
  
  if( x.length < 2000 ) {
    x = append(x,0);
    y = append(y,0);

    for( int i=1; i<x.length-1; i++ ) {
      x[i] += 0.01*x[i];
      y[i] += 0.01*y[i];
      x[i] += a;
      y[i] += b;
    }
  }
  ang += 0.01;
  
  windows();
  
}

void windows() {
  stroke(0);
  strokeWeight(1);
  for( int x=0; x<width; x+=4 ) {
    line(x,0,x,height);
  }
}


