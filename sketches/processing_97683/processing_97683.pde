
/*JÚLIA DUCAT HINOJOSA
Pràctica 4c:Bucles
INFORMÀTICA
grup 02
2n GEDI 2012-2013
*/

//Declaració de variables fons estàtic
int distanX,distanY;
int dibuixH,dibuixV;
int u=6;//variable pel color

//Declaració de variables pizza

int xur=10;
int pern=6;
int oliv=7;
int oliv2=2;
color colorXY;
int numPizzes=25;

//Creem una matriu de posicionsX amb "numPizzes"elements:
float[] posX = new float[numPizzes];
//el mateix per posicionsY:
float[] posY = new float[numPizzes];
//i per velocitatsX:
float[] velX = new float[numPizzes];
//i velocitatsY:
float[] velY = new float[numPizzes];

void setup() {

stroke(255,255,255);
strokeWeight(2);
distanX=30;//espai entre dibuix horitzontalment
distanY=30;//espai entre dibuix verticalment
dibuixH=15;//mida dibuix horitzontal
dibuixV=15;//mida dibuix vertical
frameRate(50);//velocitat moviment

//inicialitzem posicionsi velocitats
for(int i=0;i<numPizzes; i++){
 posX[i]=width/2;
 posY[i]=height/2;
 velX[i]=random(1,3);//velocitat aleatòria
 velY[i]=random(1,3);
} 
  noStroke();
  smooth();//definició
  
size(distanX*dibuixH+dibuixH,distanY*dibuixV+dibuixV);//size(distanX x mida dibuixH,distanY x mida dibuixV)

}

void draw() {
  
  background(154,211,211);//color fons estàtic
  //configuració bucle fons estàtc
  for(int x=0; x<width; x+=distanX)for(int y=0; y<height; y+=distanY){//matriu fons estàtic
  
    fill(255,255,255,150); //color quadrat del fons estàtic
    stroke(255,255,255);
    rect(x,y,dibuixH,dibuixV);
   
    colorXY=color(posX[u]-60,posY[u]-168,150,200);
    fill(colorXY);//color quadradet(que varia) del fons estàtic
    noStroke();
    rect(x+dibuixH/2,y+dibuixV/2,dibuixH/2,dibuixV/2);
    
    fill(144,216,85,200);//color quadradet2 del fons estàtic
    rect(x+dibuixH/6,y+dibuixV/6,dibuixH/2,dibuixV/2);
    }
    
  //POU
  colorXY=color(posX[u]-5,posY[u]-255,100);
  fill(colorXY);
  bezier(60,310,150,150,200,0,340,310);
  ellipse(99,320,80,80);
  ellipse(301,320,80,80);
  rect(99,240,202,120);
  
    //format ulls
  fill(255);
  stroke(0);
  strokeWeight(2);
  ellipse((width/2)-50,height/2-30,40,45);
  ellipse((width/2)-10,height/2-30,40,45);
  
  //boca
  if(mousePressed==true) {
     fill(121,16,16);
     bezier(150,285,180,320,220,330,250,285);
     bezier(150,285,190,215,220,220,250,285);
  } else {
    noFill();
  bezier(140,245,139,255,130,300,170,280);
  }
  

  //ninetes
  fill(0);
  ellipse(175+mouseX/28,195+mouseY/28,10,10);
  ellipse(215+mouseX/28,195+mouseY/28,10,10);
  noFill();
    
    
  //iniciem bucle perque faci les mateixes accions 
  //a tots els valors de les matrius
  for(int i = 0; i<numPizzes; i++){
    
    //actualitzem posicions
    posX[i] += velX[i];
    posY[i] += velY[i];

    //comprobem limits X (rebot)
    if((posX[i]<50)||(posX[i]>width-50)){
      velX[i] = -velX[i];
    } 
    //comprobem limits Y (rebot)
    if((posY[i]<0)||(posY[i]>height-50)){
      velY[i] = -velY[i];
    } 
  
   //i dibuixem (tros pizza)
  
  noStroke();
  fill(183,129,63);//pà
  triangle(posX[i],posY[i],posX[i]+50,posY[i]+50,posX[i]-50,posY[i]+30);
  fill(227,221,160);//motzzarella
  triangle(posX[i]+6,posY[i]+6,posX[i]+50,posY[i]+50,posX[i]-38,posY[i]+32);
  fill(196,49,49);//xuriço
  ellipse(posX[i]-2,posY[i]+30,xur,xur);
  ellipse(posX[i]+20,posY[i]+30,xur,xur);
  ellipse(posX[i]+8,posY[i]+18,xur,xur);
  fill(224,147,201);//pernil
  rect(posX[i]-20,posY[i]+25,pern,pern);
  rect(posX[i]+27,posY[i]+38,pern,pern);
  fill(0);//olives
  ellipse(posX[i]+11,posY[i]+35,oliv,oliv);
  ellipse(posX[i]-3,posY[i]+16,oliv,oliv);
  fill(227,221,160);
  ellipse(posX[i]+11,posY[i]+35,oliv2,oliv2);
  ellipse(posX[i]-3,posY[i]+16,oliv2,oliv2);
  }
  }


