
int margen = 50;
int xo = 50;
int yo = 275;
int wo = 50;
int ho= 10;

int con = 0;
int d0, d1, d2;
int ban=0;
int y=0;

int i = 0;
int c = 25;
int j =  0;
int k =  0; 
int h =  0;
  
int iii = 0;
int jj =  0;
int kk =  0; 
int hh =  0;

int iiii = 0;
int jjj =  0;
int kkk =  0; 
int hhh =  0;


void setup(){
  size(500, 500);
  frameRate(10);
}

void draw (){
  background(255);
  banderita(width-margen,height/2);
  
      d0 = xo;
      d1 = d0 + 50;
      d2 = d1 + 50;

      int m = CicloMovimientoOruga(d0,d1,d2);
            
/*      if (m > c) {
        
        d0 = d0 + m;
        d1 = d0 + 50;
        d2 = d1 + 50;
        
        y = CicloMovimientoOruga1(d0,d1,d2);
      }
      
      if (y > c) {
        
        d0 = d0 + y;
        d1 = d0 + 50;
        d2 = d1 + 50;
        
        int z = CicloMovimientoOruga2(d0,d1,d2);
      } */
}

void banderita (int xi, int yi){
  rect(xi,yi,5,50);
  line(xi-15,yi+15,xi,yi+30); 
  line(xi-15,yi+15,xi,yi);  
}



int CicloMovimientoOruga(int d0,int d1,int d2) {

  println(i,j,k,h,c);
  
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
  println(d0+i, d1+j, d2+k);
  return(h);
}

int CicloMovimientoOruga1(int d0,int d1,int d2) {

  if (iii<=c){
     segmento ( d0+iii, yo, wo-iii,ho);
     segmento ( d1, yo, wo,ho);
     segmento ( d2, yo, wo,ho); 
     iii++;
  }

   if (jj<=c && iii>c)
  {
    segmento ( d0+iii, yo, wo-iii+jj,ho);
    segmento ( d1+jj, yo, wo-jj,ho);
    segmento ( d2, yo, wo,ho); 
    jj++;
  }
  
 
     if (kk<=c && jj>c)
  {
    segmento ( d0+iii, yo, wo-iii+jj,ho);
    segmento ( d1+jj, yo, wo-jj+kk,ho);
    segmento ( d2+kk, yo, wo-kk,ho); 
    kk++;
  }
  
  if (hh<=c && kk>c)
  {
    segmento ( d0+iii, yo, wo-iii+jj,ho);
    segmento ( d1+jj, yo, wo-jj+kk,ho);
    segmento ( d2+kk, yo, wo-kk+hh,ho); 
    hh++;
  }
  println(d0+iii, d1+jj, d2+kk);
  return(hh);
}

int CicloMovimientoOruga2(int d0,int d1,int d2) {

  if (iii<=c){
     segmento ( d0+iii, yo, wo-iii,ho);
     segmento ( d1, yo, wo,ho);
     segmento ( d2, yo, wo,ho); 
     iii++;
  }

   if (jjj<=c && iii>c)
  {
    segmento ( d0+iii, yo, wo-iii+jjj,ho);
    segmento ( d1+jjj, yo, wo-jjj,ho);
    segmento ( d2, yo, wo,ho); 
    jjj++;
  }
  
 
     if (kkk<=c && jjj>c)
  {
    segmento ( d0+iii, yo, wo-iii+jjj,ho);
    segmento ( d1+jjj, yo, wo-jjj+kkk,ho);
    segmento ( d2+kkk, yo, wo-kkk,ho); 
    kkk++;
  }
  
  if (hhh<=c && kkk>c)
  {
    segmento ( d0+iii, yo, wo-iii+jjj,ho);
    segmento ( d1+jjj, yo, wo-jjj+kkk,ho);
    segmento ( d2+kkk, yo, wo-kkk+hhh,ho); 
    hhh++;
  }
  println(d0+iii, d1+jjj, d2+kkk);
  return(hhh);
}


void segmento(int xi, int yi, int ancho, int alto) {
   rect(xi,yi,ancho,alto);
}
