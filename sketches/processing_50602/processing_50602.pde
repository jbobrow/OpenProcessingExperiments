
int posT;
int posTa;
int posR;
int posQ;
void setup(){
  size(700,400);
int posT=+100;
int posTa=+90;
posQ=20;
posR=100;
  
}

void draw(){
  background(255);
  //mar
    fill(0,100,150);
  rect(0,250,700,200);
 
  //velas
   fill(0);
 triangle(posT+100,100,posT+150,200,posT+100,200);
 triangle(posTa+90,100,posTa+45,200,posTa+90,200);
 
 //vigas
fill(100,200,30);
 rect(posR,200, 5, 30);
 rect(posR-15,200,5,30);
 
 //mastil
 fill(200,100,0);
 quad(posQ,230,posQ+150,230,posQ+105,270,posQ+45,270);
 posTa=posTa+1;
 posT=posT+1;
 posQ=posQ+1;
 posR=posR+1;
}
  

