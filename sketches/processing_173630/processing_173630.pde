

float a= 400; //ubicacion
float b=0; 
float velocidad= 10; //velocidad de los de abajo
float gravedad= 0.50; //gravedad (o aceleracion) 
float velocidath= 10; 
float gravedath= 0.30; 
float d=0; 
float velocidaw= 2; //arriba
float gravedaw= 0.40;  

void setup(){
  size(600,600);
  smooth();
  ellipseMode(RADIUS);
}
void draw(){
  frameRate(40);
  fill(0,12);
  rectMode(CORNER);
  rect(0,0,width,height);
  
    noStroke();
    fill(#FF747D,random(100));
  ellipse(a,b,6,6);
  ellipse (a/2,b,4,4);
  ellipse (50,b,10,10);
  fill(#4852FF,random(150));
  ellipse(550,b,5,5);
  ellipse(75,b,5,5);
  ellipse(310,b,10,10);
  ellipse(160,b,5,5);
  b = b + velocidad; //agrega velocidad a ubicacion
  velocidad= velocidad + gravedad; //agrega gravedad a velocidad
  if(b>height){
    velocidad=velocidad*-0.95; //multiplicar por 0.95 reduce la velocidad
  }
     fill(#FF8D12,random(150));
  ellipse(1000,b,10,10);
  ellipse(30,b,5,5);
  ellipse(130,b,10,10);
  ellipse(330,b,5,5);
  ellipse(390,b,5,5);
  ellipse(230,b,10,10);
  fill(#FFFFFF,random(50));
  ellipse(370,b,5,5);
  ellipse(460,b,5,5);
  ellipse(15,b,5,5);
  ellipse(90,b,10,10);
  ellipse(130,b,5,5);
  ellipse(170,b,5,5);
  ellipse(260,b,5,5);
  fill(#45A744,random(150));
  ellipse(445,b,5,5);
  ellipse(115,b,8,8);
  ellipse(150,b,6,6);
  ellipse(180,b,5,5);
  ellipse(215,b,7,7);
  b=b+velocidath;
  velocidath=velocidath+gravedath;
  if(b>height){
    velocidath=velocidath*-0.95;
  }
  
  fill(#C4FF79,random(150));
  ellipse(420,d,9,9);
  ellipse(5,d,5,5);
  ellipse(190,d,5,5);
  fill(#4BC1FF,random(150));
  ellipse(580,d,7,7);
  fill(#FFA61F,random(150));
  ellipse(180,d,5,5);
  fill(#991FFF,random(100));
  ellipse(170,d,7,7);
  ellipse(150,d,10,10);
  ellipse(360,d,5,5);
  ellipse(300,d,5,5);
  ellipse(230,d,5,5);
  fill(#DAFF48,random(150));
  ellipse(250,d,8,8);
  ellipse(530,d,5,5);
  fill(#8EEABD,random(150));
  ellipse(80,d,5,5);
  ellipse(500,d,6,6);
   d=d+velocidaw;
  velocidaw=velocidaw+gravedaw;
  
  if(d>height){
    velocidaw=velocidaw*-0.95;
  }
}
