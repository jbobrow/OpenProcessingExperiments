
float[] valores = {25.0, 45.0, 5.0, 15.0, 10.0};
int ancho;
int anchoacum;
int valmax = 0;

void setup(){
  size(400, 400);
  noStroke();
  
  dibujargraf();
}
void dibujargraf(){
  background(0);
  int ancho = width/(valores.length);
  
  for(int i = 0; i < valores.length; i++){
    if(valores[i]>valmax){
      valmax=int(valores[i]);
    }
  }
  
  for(int i = 0; i < valores.length; i++){
    fill(random(50,255), random(50,255), random(50,255));    
    rect(anchoacum, height, ancho, -map(valores[i],0,valmax,0,height));
    anchoacum = anchoacum+ancho;
  }
}               
