
PFont tipo_letra;
PFont tipo_letra2;
void setup(){
  size(600,500);
}
void draw(){
  background(0);
  int n=65;
  tipo_letra=createFont("Segoe Script",15);
  textFont(tipo_letra);
  for(int i=0;i<26;i++){
    char c=char(n+i);
    float ancho=textWidth(c);
    text(c,ancho+20*i,50); 
  }
  int m=97;
  tipo_letra2=createFont("CordiaNew-48",15);
  textFont(tipo_letra2);
  for(int j=0;j<26;j++){
    char d=char(m+j);
    float ancho2=textWidth(d);
    text(d,ancho2+20*j,150);
  }
  
}
