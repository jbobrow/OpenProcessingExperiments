
float q=350f,a,b,c,d,x,y,X,Y,u,v,U,V,f,g,ca,cb,sa,sb,qc;

void setup() {
  size(700,700);background(#eeeeee);stroke(0x15000000);noFill();smooth();
  a=PI;b=a/2; f=a/random(18,180);g=a/random(18,180); c=1f;
}
void draw() {
  qc= q-(c+=.01);
  x=q+(sb=sin(b+=g))*c; y=q+(cb=cos(b))*c; X=q-sb*qc; Y=q-cb*qc;
  u=q+(sa=sin(a+=f))*c; v=q+(ca=cos(a))*c; U=q-sa*qc; V=q-ca*qc;
  bezier(x,y,u,v,U,V,X,Y);
}
void mousePressed() {setup();}

                
                                                                                                                                
