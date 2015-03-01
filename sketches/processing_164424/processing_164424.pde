
float x, fase, r, a;
 
void setup(){
  size(500, 500);
  frameRate(999999999);
  noSmooth();
  r = 0.001;
  fase = 0.001;
}
 
void draw(){ 
  fase=fase*1.1; //El valor de la fase solo aumentara o disminuira la frecuencia de la espiral -
  r=r * 1.15
  for(x=0; x<=500; x=x+1){
   
    fill(0, 0, 0);
    ellipse(r*cos(0.83*fase)+250, r*sin(0.83*fase)+250, 8 , 8 );
  } 
}
