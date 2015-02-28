
/*This
is very
complex so
expand width
care!
*/
float x =425;
float y =425;
float a =100;
float b =150;
float c =325;
float d =250;
float h =400;
float v =300;
float xspeed =5;
float yspeed =3;
float aspeed =3;
float bspeed =5;
float cspeed =4;
float dspeed =3;
float hspeed =4;
float vspeed =2;

void setup() {
  size(1250,650,P3D);
  smooth();
  background(255);
}

void draw() {
  noStroke();
  fill(255,225);
  rect(0,0,width,height);
  
  x = x + xspeed;
  y = y + yspeed;
  a = a + aspeed;
  b = b + bspeed;
  c = c + cspeed;
  d = d + dspeed;
  h = h + hspeed;
  v = v + vspeed;

  if ((x+16 > width) || (x-16 < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y+16 > height) || (y-16 < 0)) {
    yspeed = yspeed * -1;
  }
  if ((a+16 > width) || (a-16 < 0)) {
    aspeed = aspeed * -1;
  }
  if ((b+16 > height) || (b-16 < 0)) {
    bspeed = bspeed * -1;
  }
  if ((c+16 > width) || (c-16 < 0)) {
    cspeed = cspeed * -1;
  }
  if ((d+16 > height) || (d-16 < 0)) {
    dspeed = dspeed * -1;
  }
  if ((h+16 > width) || (h-16 < 0)) {
    hspeed = hspeed * -1;
  }
  if ((v+16 > height) || (v-16 < 0)) {
    vspeed = vspeed * -1;
  }
  stroke(0);
  if((a>x-150)&&(a<x+150)&&(b>y-150)&&(b<y+150)||(x>a-150)&&(x<a+150)&&(y>b-150)&&(y<b+150)){
    line(x,y,a,b);
  }
  if((c>x-150)&&(c<x+150)&&(d>y-150)&&(d<y+150)||(x>c-150)&&(x<c+150)&&(y>d-150)&&(y<d+150)){
    line(x,y,c,d);
  }
  if((a>c-150)&&(a<c+150)&&(b>d-150)&&(b<d+150)||(c>a-150)&&(c<a+150)&&(d>b-150)&&(d<b+150)){
    line(c,d,a,b);
  }
  if((x>h-150)&&(x<h+150)&&(y>v-150)&&(y<v+150)||(h>x-150)&&(h<x+150)&&(v>y-150)&&(v<y+150)){
    line(h,v,x,y);
  }
  if((c>h-150)&&(c<h+150)&&(d>v-150)&&(d<v+150)||(h>c-150)&&(h<c+150)&&(v>d-150)&&(v<d+150)){
    line(h,v,c,d);
  }
  if((a>h-150)&&(a<h+150)&&(b>v-150)&&(b<v+150)||(h>a-150)&&(h<a+150)&&(v>b-150)&&(v<b+150)){
    line(h,v,a,b);
  }

  fill(125,125);
  ellipse(h,v,20,20);


  stroke(0);
  fill(125,125);
  ellipse(x,y,20,20);
  ellipse(a,b,20,20);
  ellipse(c,d,20,20);
}


