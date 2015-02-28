
int a=20;
int direccion= 3;
void setup(){
  size(800,800);
  background(200,109,180);
}
void draw(){
for(int x =10;x<=800;x=x+10){
 line(x,10,x,800);
 line(10,x,800,x);
 
//primera declaracion de variable,2test verificaciòn//
//que es verdadero o falso,800 (ancho) puede ser heigth//
//3 es la acciòn lo que quiero que haga, +,-,*,/,//

fill(213,234,123,200);
for(int i=0;i <height;i+=20){
  fill(87);
  rect(5,i,width,5);
  fill(20,30,125,4);
  rect(i,0,0,height);
   rectMode(CENTER);
  fill(225,20,134);
rect(a,400,167,167);
//para mover background dentro del corchete en draw//
//si quiero que se mueva todo en conjunto  background despues de setup//
a=a+direccion;
//para que el cuadrado vuelva se necesita: y sirve para que aumente etc//
//variable de direccion//
if(a>800|| a<=0){
  direccion=direccion*-1;

}
}
}
fill(8,50,20,256);
fill(213,234,3,200);
ellipse(400,400,450,450);
for(int i=0;i <height;i+=20){
  fill(i);
  rect(5,i,width,1);
  fill(20,0,i,105);
  ellipse(345,387,98,76);
  ellipse(442,387,98,76);
  ellipse(490,387,198,96); 
  ellipse(295,387,198,96);
  ellipse(400,500,a,90);
  fill(234,76,98,9);
  ellipse(400,500,87,a);
 rect(384,179,7,7,97,97);

}
}


