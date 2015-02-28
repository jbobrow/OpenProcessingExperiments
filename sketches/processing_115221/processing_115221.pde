
float a=1;
float b=1;
float c=1;
float d=255;
float e=255;
float f=255;
float g=1;
float h=1;
float i=1;
float j=255;
float k=255;
float l=255;
float m=1;
float n=1;
float o=1;
float p=255;
float q=255;
float r=255;

void setup() {                    // static setup
  size(300, 100);                 // size
}

void draw() {                     // open looped drawing
  fill(a, b, c);                  // fill with RGB based on a,b,c
  noStroke();                     // remove outline
  rect(0, 0, 100, 100);           // draw rectangle
  a=a+0.1;                        // + 0.1 to a on each loop
  b=b+0.1;                        // + 0.1 to b on each loop
  c=c+0.3;                        // + 0.3 to c on each loop

  fill(d, e, f);
  noStroke();
  ellipse(50, 50, 100, 100);
  d=d-0.3;
  e=e-0.3;
  f=f-0.1;

  fill(g, h, i);
  noStroke();
  rect(100, 0, 100, 100);
  g=g+0.3;
  h=h+0.1;
  i=i+0.1;

  fill(j, k, l);
  noStroke();
  ellipse(150, 50, 100, 100);
  j=j-0.1;
  k=k-0.3;
  l=l-0.3;

  fill(m, n, o);
  noStroke();
  rect(200, 0, 100, 100);
  m=m+0.1;
  n=n+0.3;
  o=o+0.1;

  fill(p, q, r);
  noStroke();
  ellipse(250, 50, 100, 100);
  p=p-0.3;
  q=q-0.1;
  r=r-0.3;
}



