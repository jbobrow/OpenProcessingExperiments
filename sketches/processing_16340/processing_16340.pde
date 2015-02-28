
int a=20;
int direccion= 37;
void setup(){
  size(700,800);
  background(255);
}
void draw(){
for(int x =10;x<=width;x=x+40){
  for(int y=10;y<=width;y=y+40){
    fill(random(0,255),random(0,0),random(34));
    rect(a,45,67,68,56,78);
    rect(a,155,67,78,56,78);
    rect(a,500,67,65,87,98);
    rect(700,500,67,65,87,98);
    rect(a,350,90,65,87,98);
    rect(a,455,67,67,56,78);
    rect(a,555,67,56,56,78);
    fill(56,98,255);
    rect(a,250,90,65,87,98);
  
    a=a+direccion;
//para que el cuadrado vuelva se necesita: y sirve para que aumente etc//
//variable de direccion//
if(a>800|| a<=0){
  direccion=direccion*-1;
}
    
    
}
}
//saveFrame();
}

