
/*el fons és un aspiral amb ellipses que creixen de mida, 
al centre de la pantalla hi ha 50 pilotes que giren en cercle de forma concentrica, cadescuna independentment,
col·locades per fer l'efecte d'una rosa que va girnat.*/



int szx,szy;
float grau;
int numPilotes=50;
int[] posx=new int[numPilotes];
int[] posy=new int[numPilotes];
int[] velx=new int[numPilotes];
int[] vely=new int[numPilotes];


void setup() {
size(600, 600);
frameRate(100);
grau=0;
}

void draw() {
  background(255);
  /*amb una matriu i variables de posicio i angle, 
  totes en funció de la variable de la matriu per 
  aconseguir l'efecte d'espiral*/
  
  translate(width/2,height/2);
  strokeWeight(1);
for(float i=0;i<height;i+=0.5){
int extrem= int(i/5);
float angle=PI+0.1*i;
float posx=cos(angle)*i;
float posy=sin(angle)*i;
stroke(20,255,20);
   fill(150,255,150,100);
    ellipse(posx, posy,extrem,extrem);
    /*seguit de punts col·locats cada cert angle, fan l'efecte de ser rectes que surten del centre,
    aquest afegit feia que les parts amb moviment s'enlentisin
    per això l'he suprimit */
    
   /*for(angle=PI/8;angle<8*PI;angle+=PI/8){
     float posxx=cos(angle+PI)*i;
     float posyy=sin (angle+PI)*i;
     int extremM= int(i/16);
      stroke(200,20,20,20);
      fill(255,20,20,20);
      ellipse(posxx,posyy,extremM,extremM);
    }*/
}

for (int i=0; i<numPilotes; i+=1) {
  
  grau=grau+0.1;
  strokeWeight(i/5);
  stroke(random(75,100),random(0,60),random(0,60));
  fill(25*i,i/2,i);
  szx=i*2;
  szy=i*2;
  posx[i]=0;
  posy[i]=0;
  velx[i]=int(cos(grau+i)*2*i);
  vely[i]=int(sin(grau+i)*2*i);
  posx[i]+=velx[i];
  posy[i]+=vely[i];
  ellipse(posx[i],posy[i],szx,szy);
}
}








