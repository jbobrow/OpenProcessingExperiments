
PFont tipo_letra;
int i=0;
int j=0;
PFont tipo_letra2;
void setup(){
  size(600,500);
  frameRate(2);
}
void draw(){
  int n=65;
  tipo_letra=createFont("Segoe Script",15);
  textFont(tipo_letra);
    char c=char(n+i);
    float ancho=textWidth(c);
    text(c,ancho+20*i,50);
    i++;
    int m=97;
    tipo_letra2=createFont("CordiaNew-48",15);
    textFont(tipo_letra2);
    char d=char(m+j);
    float ancho2=textWidth(d);
    text(d,ancho2+20*j,150);
    j++;  
    
}

