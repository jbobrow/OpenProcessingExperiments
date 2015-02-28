
/*Neste meu Trabalho resolvi simular uma balisa no pátio do detran,
pois foi a melhor coisa que me aconteceu no ano de 2013, retirar a 
carteira nacional de habilitação. O carro se aproxima do primeiro,
para para virar o volante, faz a balisa e estaciona dentro da vaga.*/
float y =600;
float x =600;
float count = 600;
int loop = 1;
 
void balisa(){
for(int i =0;i<=600;i= i+ 150){
  stroke(0);  
  stroke(216,208,35);
    line (500,i,500,i+100);
  }
  stroke(0);
  fill(216,208,35);
  rect(700,500,100,20);
  rect(700,100,100,20);
  noFill();
  fill(0);
  textSize(50);
  textMode(CENTER);
  text("DETRAN",150,300);
}
void carro1(){
if(y>100){
  y=y-5;
  stroke(0);
  fill(216,35,35);
  rect(600,y,100,200);
  }
}
void carro2(){
  stroke(0);
  fill(216,35,35);
  rect(x,y,100,200);
 
 
 
}
void carro3(){
  stroke(0);
  fill(216,35,35);
  rect(700,y,100,200);
}
void estacionado(){
  stroke(0);
  fill(216,35,35);  
  rect(700,250,100,200);
}
void setup (){
  background(125);
  size(800,600);
  frameRate(10);
  }
 
 
void draw(){
  background(125);
 
  balisa();
  if (count > 100){
  carro1();
  count =  count -5;
  }
  if (count <= 100 && count > - 59){
   
    carro2();
   if ( y > 150){
   x = x+ 5;
   }
   y = y +5;
   count = count - 5;
   
   }
   if (count <= -59 && count >= -65){
   carro3();
   y = y + 5;
   count = count -5;
   }  
   if (count <= -65){
     estacionado();
     count = count - 5;
   }
     
 
 }


