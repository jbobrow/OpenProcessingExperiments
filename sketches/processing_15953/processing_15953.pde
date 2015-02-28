
int a=20;
int direccion= 37;
void setup(){
  size(700,800);
  background(255);
}
void draw(){
for(int x =10;x<=width;x=x+40){
  for(int y=10;y<=width;y=y+40){
    fill(random(0,299),random(0,10),random(298));
    rect(98,a,6,a,56,a);
    rect(208,a,6,a,56,a);
    rect(458,a,6,a,56,a);
    rect(508,a,6,a,56,a);
    rect(608,a,6,a,56,a);
  
    a=a+direccion;
//para que el cuadrado vuelva se necesita: y sirve para que aumente etc//
//variable de direccion//
if(a>800|| a<=0){
  direccion=direccion*-1;
}
    
    
}
}
}

void mousePressed(){
  saveFrame();
}

