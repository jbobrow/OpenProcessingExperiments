
int S=700, o=S/2, N=300, i= 3, r=-i, bg_grid=3; PVector[] T;
  
void setup(){
  size (700, 700);
  smooth ();
  background (#EEEEEE);
  stroke (0xAA000000);
  T = new PVector [N];
  float s= TWO_PI/N;
  for (int n=0; n<N; n++) T[n]= new PVector (cos (n*s), sin (n*s));
}

void draw(){ 
  if ( (r+=i)<300 ) {
    for (int p=0, j=p+1, r1=r, r2=r; p<N; p++, j=(p+1)%N, r1=r2=r){
      if (random(1)<.5) r1=r+i; else r2=r+i;
      line ( o+T[p].x*r1, o+T[p].y*r1, o+T[j].x*r2, o+T[j].y*r2); 
    }
  }
}
