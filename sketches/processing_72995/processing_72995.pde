
/** a tiny sketch drawing the Bifurcation Diagram.   
See also http://paulbourke.net/fractals/logistic/ */
int p=512;
void setup(){
  size(p,p, P2D); 
 stroke(254,4);
 background(0);
}
void draw()
{float n=0.5;
 float d=0.00002;
 for (float r=1+random(d); r<4; r=r+d)
 {n=r*n*(1-n);
  point(-61*r*(1-r)-220, p-n*p);
}}


