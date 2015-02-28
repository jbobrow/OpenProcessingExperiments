
int a=20;
int direccion= 37;
void setup(){
  size(700,800);
  background(255);
}
void draw(){
for(int x =10;x<=width;x=x+40){
  for(int y=10;y<=width;y=y+40){
    fill(random(0,55),random(0,16),random(234));
    rect(300,100,a,a,189,189);
 
    a=a+direccion;
//para que el cuadrado vuelva se necesita: y sirve para que aumente etc//
//variable de direccion//
if(a>800|| a<=0){
  direccion=direccion*-1;
}
    
  
}
}
}

