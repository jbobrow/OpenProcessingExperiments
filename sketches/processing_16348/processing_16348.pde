

int a=20;
int direccion= 37;
PFont letra;
void setup() {
  size(600,500);
 
    letra= loadFont("ArialNarrow-BoldItalic-48.vlw");
  textFont(letra);
}
void draw() {
 background(56,389,67,98);
  int s=second();
  int m=minute();
  int h= hour();
  int d= day();
  int e= month();
  String t=nf(h,2)+":"+nf(m,2)+":"+nf(s,2);
  String f= nf(d,2)+"-"+nf(e,2);

  textAlign(CENTER);
  text(t,280,230);
  text (f,280, 320);

for(int x =10;x<=width;x=x+40){
  for(int y=10;y<=width;y=y+40){
    fill(random(0,299),random(0,10),random(298));
    rect(98,a,6,a,56,a);
    rect(508,a,6,a,56,a);
 rect(260,358,67,98,a,56);
 rect(260,48,67,98,a,56);
 
    a=a+direccion;
//para que el cuadrado vuelva se necesita: y sirve para que aumente etc//
//variable de direccion//
if(a>800|| a<=0){
  direccion=direccion*-1;
}
    
    
}
}
}



