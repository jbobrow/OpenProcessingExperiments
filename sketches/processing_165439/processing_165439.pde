
int d_cero,d_uno,d_dos;
int a_uno,a_dos,a_tres;
int c;
int i=0;
int j=0;
int k=0;
int m=0;
void setup () {
 size (500,200);
d_cero=100;
d_uno=d_cero+50;
d_dos=d_uno+50;
a_uno=a_dos=a_tres=50;
c=a_uno/2;
frameRate(30);
}

void draw() {  
  background(255); 
  banderita(450,150);
  muevase();
 //segmento(d_uno,150,a_dos,20);
 //segmento(d_dos,150,a_tres,20);
 
  /*
  if((i>c)&&(i<=2*c) ){
  
   segmento(d_cero+c,150,a_uno-c+j,20);
 segmento(d_uno+j,150,a_dos-j,20);
 segmento(d_dos,150,a_tres,20); 
   i=i+1;
  j=j+1; 
  
  }
  
  */
  
  
  
}



void banderita(float Xi, float Yi){
line(Xi,Yi,Xi,Yi-60);
fill(255,255,0);
triangle(Xi,Yi-60, Xi-30,Yi-45,Xi,Yi-30);
/*
line(Xi,Yi-60,Xi-30,Yi-45);
line(Xi-30,Yi-45,Xi,Yi-30);
*/
}

void segmento(int X_i,int Y_i, int ancho, int alto){
 fill(0,255,0);
  rect(X_i,Y_i, ancho, alto,7);
  
}



void muevase(){
if( i<=c){
  
 
 segmento(d_cero+i,150,a_uno-i,20);
 segmento(d_uno,150,a_dos,20);
 segmento(d_dos,150,a_tres,20);
 i=i+1;
 
 
 }
  
  
  else if((j<=c)&&(i>c)){
  segmento(d_cero+i,150,a_uno-i+j,20);
 segmento(d_uno+j,150,a_dos-j,20);
 segmento(d_dos,150,a_tres,20);
  j++;
  }
  
 else  if((k<=c)&&(j>c)){
  segmento(d_cero+i,150,a_uno-i+j,20);
 segmento(d_uno+j,150,a_dos-j+k,20);
 segmento(d_dos+k,150,a_tres-k,20);
  k++;
  }
  
 else if   ((m<=c)&&(k>c)){
  segmento(d_cero+i,150,a_uno-i+j,20);
 segmento(d_uno+j,150,a_dos-j+k,20);
 segmento(d_dos+k,150,a_tres-k+m,20);
  m++;
  }
  
  else if (m>c){
  segmento(d_cero+i,150,a_uno-i+j,20);
 segmento(d_uno+j,150,a_dos-j+k,20);
 segmento(d_dos+k,150,a_tres-k+m,20);
  
  }
  
  
  
}
