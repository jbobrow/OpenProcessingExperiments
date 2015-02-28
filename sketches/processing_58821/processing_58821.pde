
float a=0.0, d=18, r, x0, x1, x2, y0, y1, y2;
float rd=random(256), gr=random(256), bl=random(256);

void setup() {
  size(512, 512);
  x0=width/2;
  y0=height/2;
  smooth();
}

void draw() {
  //background(0);
  noStroke();
  fill(rd, gr, bl, 4);
  rect(0, 0, width, height);
  stroke(255-rd, 255-gr, 255-bl);
  r=height/64;
  for(int i=0; i<d*10; i++) {
    x1=x0+r*cos(a+TWO_PI*i/d);
    y1=y0+r*sin(a+TWO_PI*i/d);
    r+=2;
    x2=x0+r*cos(a+TWO_PI*(i+1)/d);
    y2=y0+r*sin(a+TWO_PI*(i+1)/d);
    //if(x1>=0 || x1<width || y1>=0 || y1<height) {
      //line(x0, y0, x1, y1);
      line(x1, y1, x2, y2);
    //}
  }
  //a+=TWO_PI/d;
  a+=TWO_PI/d/7;
  rd+=random(2)-1;
  gr+=random(2)-1;
  bl+=random(2)-1;
  constrain(rd, 0, 255);
  constrain(gr, 0, 255);
  constrain(bl, 0, 255);
}

