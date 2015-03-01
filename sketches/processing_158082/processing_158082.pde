
int tono=0;
void setup(){
  size(700,600);
  colorMode(HSB);//novedad - Tono,Saturacion, Brillo
}
void draw(){
  tono++;
  if(tono>255){
    tono=0;
  }
  background(tono,255,255);
}
