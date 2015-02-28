
class pendulo{

pendulo(float x,float y, float diametro,float pendx,float pendy){
  
 strokeWeight(5);
line(627,200,787,200);
strokeWeight(10);
line(787,200,787,325);
strokeWeight(1);
  fill(56, 86, 236);
  if(empezar==false){
  x=(pendx_i + r*cos(theta_0));
  y=(pendy_i + r*sin(theta_0));
  pendx=647;
  pendy=200;
 
  }
  stroke(2);
  line(pendx,pendy,x,y);
ellipse(x,y,diametro,diametro);

}

void mover (){

alfa= 10*g/r;
float count_timer= millis();
  float timer=count_timer/1000-(timer_clic);
  if(angle<3.1416/2){
  theta= (alfa*timer*timer)/2+theta_0;
  w= alfa*timer;
  t=timer;
  vel=w*r;
  
  }
  else{
  theta=3.1416/2;
  bandera_pendulo=1;
  }
  angle=theta;
  x_i_pendulo1 = (pendx_i + r*cos(angle));
  println(  x_i_pendulo1 );
  y_i_pendulo1 = (pendy_i + r*sin(angle));
  
}
};
//********************************************************************************************************************************************************************************

class bala{
 float balax_i=585;
 float balay_i=290;
 
bala(float balax,float balay,float anchobala ,float altobala){
  ellipse(balax,balay,10,10);
  image(img,590,275,anchobala,altobala);  
}

void mover(){
  float t_bala_count=millis();
  float t_bala=(t_bala_count/1000)-t-timer_clic;
  float vel_bala=1.3*vel;
  float beta=7*3.1416/6;
  
  if(bandera_parar_bala==0){
  posx_bala=balax_i+vel_bala*cos(beta)*t_bala;
  posy_bala=balay_i+vel_bala*sin(beta)*t_bala+(g*t_bala*t_bala)/2;
  t_f_bala=t_bala;
  }  
  
  if(posx_bala<=230){
    if(theta_0<=1.34 & theta_0>=1.32){
      
      bandera_parar_bala=1;
      //println(t_f_bala);
      
    
    }
  }

  if(bandera_parar_bala==1){
  posx_bala=balax_i+vel_bala*cos(beta)*t_f_bala;
  posy_bala=balay_i+vel_bala*sin(beta)*t_f_bala+(g*t_f_bala*t_f_bala)/2;
  bandera_disco=1;
  
  velx_bala=vel_bala*cos(beta);
   }
}

};
//***************************************************************************************************************************************************************************
class disco{
float x_dis_i=215,y_dis_i=182;
  
disco(float x_dis,float y_dis,float diametro_dis){
  fill(25,36,24);
ellipse(x_dis,y_dis,diametro_dis,diametro_dis);

}

void mover(){
 float vel_0_disco=velx_bala/4;
 float t_disco_count=millis();
 float t_disco=t_disco_count/1000-t_f_bala-t-timer_clic;
boolean disco_piso=false;
t_f_disco=t_disco;
 posx_disco=x_dis_i+vel_0_disco*t_disco;
 posy_disco=y_dis_i+(g*t_disco*t_disco)/2; 
 
 if(posy_interruptor>=445){
   bandera_disco2=0;
 posx_disco=75;
 posy_disco=431;
 bandera_carro=1;
 println(t_f_disco);
 }
 
 if(posy_disco>=445){
 posy_disco=440;
 disco_piso=true;
}



}



};
//***********************************************************************************************************************************************************************************
class interruptor{
interruptor(float x_inte,float y_inte,float ancho_inte,float alto_inte){
  fill(216,4,4);
    rect(x_inte,y_inte,ancho_inte,alto_inte);
  }

void mover(float y_disco_golpe){
posy_interruptor=y_disco_golpe;
}

};
//*******************************************************************************************************************************************************************************************
class carro{
float x_carro_i=275,y_carro_i=295;
  carro(float x_carro,float y_carro,float anchocarro,float altocarro){
  image(carro,x_carro,y_carro,anchocarro,altocarro);
  
    }
void mover(){
  float t_carro_counter=millis();

 float t_carro=t_carro_counter/1000-t_f_disco-t_f_bala-t-timer_clic;
posx_carro=x_carro_i+(acel_carro*t_carro*t_carro)/2;
posy_carro=y_carro_i;

 if (posx_carro>=515){
 bandera_fin=1;
 posx_carro=515;
                     }
}
};

//********************************************************************************************************************************************************************************************
float x_i_pendulo1,y_i_pendulo1,pendx_i=647,pendy_i=200;
char bandera_pendulo=0,bandera_disco=0,bandera_disco2=1;
float posx_bala=600,posy_bala=285;
float vel;
float theta_0=.1;
float x_dis_i=215,y_dis_i=182;
float posx_disco=215,posy_disco=182;
float posx_interruptor=70,posy_interruptor=435,ancho_interruptor=10,alto_interruptor=5;
 float posx_carro=275,posy_carro=295,ancho_carro=40,alto_carro=30;
 char bandera_carro=0,bandera_fin=0;
 float acel_carro=20,t_carro;
float angle = 0.0;
int r= 100;
float w=0;
float theta=0.1;
float t;
float g=9.8;
float alfa=0;
pendulo masa1;
bala masa2;
disco masa3;
pendulo masa4;
interruptor gate;
PImage img;
int bandera_parar_bala=0;
float velx_bala;
float t_f_bala;
float t_f_disco;
PImage piso,piso2,torre,carro,banderas,fin;
carro crash;
boolean empezar=false;
boolean time=true;
float timer_clic;
//string enunciado_0= "Objetivo: Encuentre el angulo de inclinacio del pendulo con respecto a la horizontal";
//string enuncioado_1= "de tal manera que cuando choque con el cañon, salga disparada una bala y golpee una roca ";
//string enunciado_2= "angulo: ";

//*******************************************************************************************************************************************************************************
void setup(){
  
  size(800,500);
 frameRate(415); 
piso = loadImage("piso.jpg");   
img = loadImage("cañon.jpg"); 
piso2=loadImage("piso2.jpg");
torre=loadImage("torre.jpg");
carro=loadImage("carro.jpg");
banderas=loadImage("banderas.jpg");
fin=loadImage("fin.jpg");
  smooth();
 


}
//*************************************************************************************************************************************************************************************
void draw(){
  
  float count_timer_clic=millis();
  println(timer_clic);
  background(44 ,181,254);
  fill(0);
  textAlign(LEFT);
  text("Objetivo: Usted debe encontrar el angulo con respecto a la horizontal",5,20);
  text("con el cual, el pendulo debe dejarse caer e impactar a un cañon que",5,35);
  text("dispara una bala para que la roca que esta en lo mas alto de la torre",5,50);
  text("pueda caer sobre el interruptor y el carro se encienda para llegar a su meta.",5,65);
  image(banderas,510,255,50,30);
  stroke(1);
  image(piso,130,325,800,275);
  image(torre,175,190,100,138);
  textSize(12);
  text("Instrucciones:",440,455);
  text("Presione (a) para aumentar el angulo y (d) para disminuirlo",440,470);
  text("y de click para que el pendulo se deje caer ",440,485);
  masa1=new pendulo(x_i_pendulo1,y_i_pendulo1,13,pendx_i,pendy_i);
  
  gate=new interruptor(posx_interruptor,posy_interruptor,ancho_interruptor,alto_interruptor);
  masa3=new disco(posx_disco,posy_disco,20);
  masa2=new bala(posx_bala,posy_bala,50,50);
  crash=new carro(posx_carro,posy_carro,ancho_carro,alto_carro);


  if(empezar==false){
    if(keyPressed){
      if((key=='a')||(key=='A')){
      theta_0+=0.04;
      if(theta_0>=1.33){
      theta_0=1.33;
      }
      }
  
  if((key=='d')||(key=='D')){
theta_0-=0.04;
if (theta_0<=-3.14/4){
theta_0=-3.14/4;
}

  }
}
}

if(mousePressed & time==true){empezar=true;
 time=false;
timer_clic=count_timer_clic/1000;
}
  if(empezar==true){
masa1.mover();
if(bandera_pendulo==1){
masa2.mover();
}

if(bandera_disco==1 & bandera_disco2==1){
  masa3.mover();
}

if(posy_interruptor<=posy_disco+10 & posx_disco>=70){
gate.mover(posy_disco+10);
}

if(bandera_carro==1){
crash.mover();
bandera_parar_bala=2;

}
  }
strokeWeight(3);
line(510,255,510,325);
strokeWeight(1);
//base interruptor
image(piso2,0,450,130,50);
fill(25,36,24);
 rect(60,440,30,10);
 textAlign(LEFT);
 textSize(10);
 text("Angulo en radianes: "+theta_0,620,185);
 if(bandera_fin==1){
   textSize(64);
   fill(0,200,0);
   textAlign(CENTER);
   text("You win!",400,250);
   textSize(10);
 }
 
  
  
}


