
float a;
float b;
float c;
float d;
float e;
float f;
float g;
float h;
float i;
float j;
float k;
float l;
float m;

void setup () {
  a=700;
  c= random (500);
  d=random (500);
  e= random (500);
  f= random (700);
  g=random(700);
  h=random(700);
  i=random(50,150);
  j=random(50,150);
  k=random(50,150);
  l=random(500);
  m=random(700);
  size (500,700);
  background (162,255,248);
  noStroke();
  fill(255,218,5,150);
  ellipse(l,m,125,125);
  fill(255,218,5,125);
  ellipse(l,m,100,100);
  fill(255,100);
  ellipse (l,m,75,75);
  fill(255);
  ellipse (c,f,i,i);
  ellipse(c-i/2,f,i/2,i/2);
  ellipse(c+i/2,f,i/2,i/2);
  ellipse (d,g,j,j);
  ellipse (d-j/2,g,j/2,j/2);
  ellipse (d+j/2,g,j/2,j/2);
  ellipse (e,h,k,k);
  ellipse (e-k/2,h,k/2,k/2);
  ellipse (e+k/2,h,k/2,k/2);
  fill(255,100);
  ellipse (c,f,i*1.3,i*1.3);
  ellipse(c-i/2,f,i*1.3/2,i*1.3/2);
  ellipse(c+i/2,f,i*1.3/2,i*1.3/2);
  ellipse (d,g,j*1.3,j*1.3);
  ellipse (d-j/2,g,j*1.3/2,j*1.3/2);
  ellipse (d+j/2,g,j*1.3/2,j*1.3/2);
  ellipse (e,h,k*1.3,k*1.3);
  ellipse (e-k/2,h,k*1.3/2,k*1.3/2);
  ellipse (e+k/2,h,k*1.3/2,k*1.3/2);
}

void draw () {
  frameRate (10);
  a=a-60;
  b=random (-25,525);
  stroke (17,12,146);
  fill (237,91,211,200);
  arc(b,a,50,50, PI*0.8,PI*2.2);
  noStroke();
  triangle(b-20.5,a+14.5,b+20.5,a+14.5,b,a+32);
  triangle (b-20.5,a+14.5,b+20.5,a+14.5,b,a);
  stroke (17,12,146);
  line (b-17,a-5,b-7,a-5);
  line (b+7,a-5,b+17,a-5);
  line (b-17,a-10,b-7,a-5);
  line (b+7,a-5,b+17, a-10);
  line (b-12,a+9,b-6,a+16);
  line(b-6,a+16,b,a+9);
  line (b,a+9,b+6,a+16);
  line (b+6,a+16,b+12,a+9);
  line(b-20.5,a+14.5,b,a+32);
  line(b,a+32,b+20.5,a+14.5);
  line (b,a+32,b,a+100);
}

void mouseClicked() {
  a=random (600,800);
}

void keyPressed () {
  saveFrame ("Jean-Bubu####.png");
}


