
int margen = 50;
int xo =50;
int yo = 275;
int wo =50;
int ho=10;
int nseg = 3;
int d0, d1, d2;
int i =0;
int c = 25;
int j =0;
int k, h =0;

void setup(){
  size(500, 500);
   d0 = xo;
   d1 = d0 +50;
   d2 = d1+ 50;
 
 banderita(width-margen,height/2);
 frameRate(10);

}

void draw (){

  background(255);
   banderita(width-margen,height/2);
  if (i<=c){
 

     segmento ( d0+i, yo, wo-i,ho);
     segmento ( d1, yo, wo,ho);
     segmento ( d2, yo, wo,ho);
     i++;
  }

   if (j<=c && i>c)
  {
    segmento ( d0+i, yo, wo-i+j,ho);
    segmento ( d1+j, yo, wo-j,ho);
    segmento ( d2, yo, wo,ho);
    j++;
  }
 
 
     if (k<=c && j>c)
  {
    segmento ( d0+i, yo, wo-i+j,ho);
    segmento ( d1+j, yo, wo-j+k,ho);
    segmento ( d2+k, yo, wo-k,ho);
    k++;
  }
 
  if (h<=c && k>c)
  {
    segmento ( d0+i, yo, wo-i+j,ho);
    segmento ( d1+j, yo, wo-j+k,ho);
    segmento ( d2+k, yo, wo-k+h,ho);
    h++;
  }
}

void banderita (int xi, int yi){
 
  rect(xi,yi,5,50);
  line(xi-15,yi+15,xi,yi+30);
  line(xi-15,yi+15,xi,yi);  
}

void segmento(int xi, int yi, int ancho, int alto) {
 
  rect(xi,yi,ancho,alto);
 
 }
