
int a=20;
int direccion= 37;
void setup(){
  size(800,800);
  background(255);
}
void draw(){
for(int x =10;x<=width;x=x+40){
  for(int y=10;y<=width;y=y+40){
    fill(random(0,255),random(0,16));
    rect(x,y,40,40);
    fill(345,76,100);
    rect(345,a,76,87,65,65);
    fill(4,7,278);
    rect(a,300,76,87,65,65);
    rect(35,a,87,65,65,76);
    rect(645,a,76,47,65,65);
 
    a=a+direccion;
//para que el cuadrado vuelva se necesita: y sirve para que aumente etc//
//variable de direccion//
if(a>800|| a<=0){
  direccion=direccion*-1;
}
    
  
}
}
}

