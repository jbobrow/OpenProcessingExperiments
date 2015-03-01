
float posX;
float posY;
float velocidadeX;
float velocidadeY;
float velocidade;
int contador1;
int contador2;
//0 - arranque 1 jogo 2 gameover
int state =0;
float posPad,vPadY;
int contadorLevel;
int padDisplacement =20;
int velCounter = 5;
float nextTime;
float rate =1.0;
float pontos;

void setup()
{
  size (1080,720);
  noCursor();
  //noLoop();
  contadorLevel=1;
  nextTime = millis()+(velCounter*1000);
  pontos=0;
  
}

void draw()
{
  if(millis()>nextTime)
  {
    rate +=0.1;
    nextTime = millis()+(velCounter*1000);
    
  }
  if (state == 0)
  {
    gameStart();
    if (mousePressed){
      state=1;
    }
  }
  if(state ==1)
  {
    joga();
    vPadY= 5+contadorLevel ;
   println(vPadY); 
    
    if(contador1==3){
    contadorLevel=contadorLevel+1;
    contador1=0;
    contador2=0;
    //vPadY= 4 + contadorLevel;  
    }
    
  }
  if (contador2 == 3){
   state=2;
   gameover();
   contadorLevel=1;
 }
  if(state==2){
   state=0;    
  }
     
}
PFont font;
void gameStart()
{
  background(0);
  fill (131,255,0);
  font=loadFont("GulimChe-250.vlw");
  textFont(font, 250);
  text("PONG",300 ,height/2);  
  
  textSize(50); 
  text("Press LMB to PLAY",335,500);
  contador1 = 0;
  contador2 = 0;
  velocidade= -5;
  posX = width/2;
  posY = height/2;
  velocidadeX = velocidade;
  velocidadeY = velocidade;

}
void gameover()
{
  textSize(200);
  fill(255,0,0); 
  text("GAME",340,280);
  text("OVER",340,480);
}




void mouseClicked()
{
  loop();
     
}





void joga()
{
  pontos=(millis()*contadorLevel/100);
  
//campo
  fill(0);
  rect (0,0,width,height);
  fill(255);
  rect((width/2)-2,0,4,height);
  float v = velocidade*rate;
//bola & pads  
  ellipse(width/2,height/2,50,50);
  fill (131,255,0);
  rect (padDisplacement,mouseY,15,150);
  rect (width -padDisplacement- 7,posPad/*-75*/,15,150);
  ellipse (posX,posY,20,20);

  //condiçoes  
  posX += velocidadeX;
  posY = posY + (int)velocidadeY;
  if (posPad+75 > posY)
    posPad -= vPadY;
  else 
    posPad += vPadY;

  if((posY >height) || (posY<0))
  {
    velocidadeY = -velocidadeY;
  }
  if(posX >width){
    posX = width/2;
    posY = height/2;
    contador1 = contador1+1;
    noLoop();
    velocidadeX=velocidade;
    rate =1.0;
  }
  if(posX <0){
    posX = width/2;
    posY = height/2;
    contador2 = contador2+1;
    noLoop();
    velocidadeX=-velocidade;
    rate=1.0;
    
  }
  if(posX>20 && posX<padDisplacement+15 && posY>mouseY && posY<mouseY+30){
    velocidadeX = -1.5*v;
    velocidadeY = 2*v;
  }
  if(posX>20 && posX<padDisplacement+15 && posY>mouseY+30 && posY<mouseY+60){
    velocidadeX = -1.25*v;
    velocidadeY = 1.25*v;
  }
  if(posX>20 && posX<padDisplacement+15 && posY>mouseY+60 && posY<mouseY+90){
    velocidadeX = -v;
    velocidadeY = 0;
  }
  if(posX>20 && posX<padDisplacement+15 && posY>mouseY+90 && posY<mouseY+120){
    velocidadeX = -1.25*v;
    velocidadeY = -1.25*v;
  }
  if(posX>20 && posX<padDisplacement+15 && posY>mouseY+120 && posY<mouseY+150){
    velocidadeX = -1.5*v;
    velocidadeY = -2*v;
  }
  if(posX >width-padDisplacement-10 && posX<width-padDisplacement+5 && posY>posPad && posY<posPad+30){
    velocidadeX = 1.5*v;
    velocidadeY = 2*v;
  }
  if(posX >width-padDisplacement-10 && posX<width-padDisplacement+5 && posY>posPad+30 && posY<posPad+60){
    velocidadeX = 1.25*v;
    velocidadeY = 1.25*v;
  }
   if(posX >width-padDisplacement-10 && posX<width-padDisplacement+5 && posY>posPad+60 && posY<posPad+90){
    velocidadeX = v;
    velocidadeY = random(-v,v);
   } 
   if(posX >width-padDisplacement-10 && posX<width-padDisplacement+5 && posY>posPad+90 && posY<posPad+120){
    velocidadeX = 1.25*v;
    velocidadeY = -1.25*v;
   }
     if(posX >width-padDisplacement-10 && posX<width-padDisplacement+5 && posY>posPad+120 && posY<posPad+150){
    velocidadeX = 1.5*v;
    velocidadeY = -2*v;
   }
    println(v);
//nivel
  textSize(42);
  text("LEVEL " + contadorLevel, 30,35);

  textSize(22);
  text("SCORE " + pontos, 900 ,35);
  
    
//contadores    
  fill(255);
  textSize(42);
  text(contador1,0.375*width,60);
  text(contador2,0.59375*width,60);
}




