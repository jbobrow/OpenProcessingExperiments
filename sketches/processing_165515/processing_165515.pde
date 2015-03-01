
int d;
int d1;
int d2;
int d3;
int C=15;
int i;
int j;
int k;
int l;


void setup(){
  background (255);
  size (600, 330);
d=200; d1=d+30; d2=d1+30;
i=0;
 j=0;
 frameRate(5);
  
}
void draw(){
  background(255);
  banderita(450,150);
  if (i<=C){
  segmento(d+i,150,30-i,10);
  segmento(d1,150,30,10);
  segmento(d2,150,30,10);
  i++;
}
else if (j<= C){
  segmento(d+i,150,30-i+j,10);
  segmento(d1+j,150,30-j,10);
  segmento(d2,150,30,10);
  j++;
}
else if (k<=C){
  segmento(d+i,150,30-i+j,10);
  segmento(d1+j,150,30-j+k,10);
  segmento(d2+k,150,30-k,10);
  k++;
}
   else if (l<= C){
  segmento(d+i,150,30-i+j,10);
  segmento(d1+j,150,30-j+k,10);
  segmento(d2+k,150,30-k+l,10);
l++;
   }
}
 
void segmento(int xi, int yi, int ancho, int alto){
  stroke (255,0,255);
  fill (255,255,81);
  rect(xi,yi,ancho,alto);
  
}
  void banderita(float xi, float yi){
  line(xi,yi,xi,yi-60);
  fill (138,138,255);
  triangle(xi,yi-60,xi-30,yi-45,xi,yi-30);
  noFill();
}
