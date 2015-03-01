
int d, d1, d2, d3, C=15, i, j, k, l;

void setup(){
  background(255);
  size(600,300);
 d=200; d1=d+30; d2=d1+30;
 i=0;
 j=0;
 frameRate(5);

}
void draw(){
     
    background(255);

 bandera(450,160);
if (i<= C){
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
  
else if (k<= C){
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

void bandera(float Xi, float Yi){
fill(0,128,64);
  text("META", Xi-25, Yi-35);
  stroke(255,0,0);
  line(Xi, Yi, Xi, Yi-30);
    fill(255,0,0);
  triangle(Xi, Yi-20, Xi,Yi-30,Xi-20, Yi-30);
  noFill();
  
}

void segmento (int Xi, int Yi, int ancho, int alto){

  stroke(0,255,0);
 fill(128,255,128);
  rect(Xi, Yi, ancho, alto);

}

