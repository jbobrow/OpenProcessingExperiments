
int d0;
int d1; 
int d2;
int c=25;
int i=0;
int j=0;
int k=0;
int l=0;

void setup (){ 
  size(640,330);
d0=100; d1=d0+50;  d2=d1+50;
frameRate(10);
}


  void draw (){
  background (125);
  banderita(450,150);
  if(i<=c){
  segmento(d0+i,150,50-i,20);
  segmento(d1,150,50,20);
  segmento(d2,150,50,20);
  i=i+1;
}
  else if(j<=c){
  segmento(d0+i,150,50-i+j,20);
  segmento(d1+j,150,50-j,20);
  segmento(d2,150,50,20);
  j=j+1; 
}
   else if(k<=c){
  segmento(d0+i,150,50-i+j,20);
  segmento(d1+j,150,50-j+k,20);
  segmento(d2+k,150,50-k,20);
  k=k+1; 

   }
   else if(l<=c){
  segmento(d0+i,150,50-i+j,20);
  segmento(d1+j,150,50-j+k,20);
  segmento(d2+k,150,50-k+l,20);
  l=l+1; 

 }
  }
void segmento (int xi, int yi, int ancho, int alto) {
  rect (xi,yi,ancho,alto);
}
void banderita(float xi, float yi){
  line(xi, yi, xi, yi-60);
  fill(255,255,0);
  triangle (xi,yi-60,xi-30,yi-45,xi,yi-30);
  noFill();

}



