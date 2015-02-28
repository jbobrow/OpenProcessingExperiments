
/*
A model for the pattern of florets in the head of a sunflower 
as proposed by H. Vogel in 1979.

Sources:

http://en.wikipedia.org/wiki/Fermat's_spiral
http://en.wikipedia.org/wiki/Sunflower

Vogel, H (1979). "A better way to construct the sunflower head"
Mathematical Biosciences 44 (44): 179–189
doi:10.1016/0025-5564(79)90080-4
*/

int n=0, s=128;
float a=radians(180*(3-sqrt(5))); // Golden angle
float r, x0, y0, x1, x2, y1, y2;
float rd=random(256), gr=random(256), bl=random(256);

void setup() {
  size(512, 512);
  smooth();
  background(0);
  strokeWeight(s);
  x0=width/2;
  y0=height/2;
}

void draw() {
  //noStroke();
  //fill(0, 4);
  //rect(0, 0, width, height);
  r=2*(n+1)/5;
  x1=x0+2*r*cos(a*n);
  y1=y0+2*r*sin(a*n);
  //r=2*(n+2)/5;
  //x2=x0+2*r*cos(a*(n+1));
  //y2=y0+2*r*sin(a*(n+1));
  stroke(rd, gr, bl, 64);
  //line(x1, y1, x2, y2);
  point(x1, y1);
  if(n++==299) {
    n=0;
    rd=random(256);
    gr=random(256);
    bl=random(256);
    if(s>2) {
      strokeWeight(s/=2);
    }
    else {
      strokeWeight(s=128);
      saveFrame("phi-####.png");
    }
  }
}

