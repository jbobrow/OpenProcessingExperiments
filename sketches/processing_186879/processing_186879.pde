
void setup () {
  size (500, 500);
  background (random(255),random(255), random(255));
  float q1, q2,t,z,q3,p, q4,x1,y1,x2,y2,x3,y3,x4,y4,r;
  z=random(100);
  q1=random(250, 500);
  q2=random(250);
  q4=random(z,150);
  fill (random(255),random(255),random(255));
  noStroke();

  t=327648425;
  x2=q4-z;
  p=random(100);
  x3=q4*2+z;

  x4=q4*2;

  quad (q4,q2,q4-z,q1,q4*2+z,q1,q4*2,q2);
  r=((q4-z)+(q4*2+z))/2;
  quad(q4*2+z-p, q1, r + p,q1,r+p,t,q4*2+z-p,t);
  quad (r-p,q1,r-p-z, q1, r-p-z,t,r-p,t);
}

