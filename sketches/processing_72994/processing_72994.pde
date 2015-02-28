
float a=0.0, d=18, r, x0, x1, x2, y0, y1, y2;
float re=random(10), gr=random(10), bl=random(10);
 
void setup() {
  size(512, 512);
  x0=width/2;
  y0=height/2;
  smooth();
}
 
void draw() {
  //background(0);
  noStroke();
  fill(re, gr, bl, 4);
  rect(0, 0, width, height);
  stroke(255-re, 255-gr, 255-bl);
  r=height/164;
  
  for(int i=0; i<d*10; i++) {
    x1=x0+r*cos(a+TWO_PI*i/d);
    y1=y0+r*sin(a+TWO_PI*i/d);
    r+=2;
    x2=x0+r*cos(a+TWO_PI*(i+1)/d);
    y2=y0+r*sin(a+TWO_PI*(i+1)/d);
      line(x1, y1, x2, y2);
  }
  a+=TWO_PI/d/7;
}

