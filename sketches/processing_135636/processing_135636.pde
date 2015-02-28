
int x=40;
int y=220;
int sx=5;//incremento orizz pallina
int sy=1;//incr verticale pallina
int port1=250;
int port2=250;
int incR=10;//movimento portiere
int punteggio1=0;
int punteggio2=0;
PFont font, font2;



void setup(){
  size(1000,500);
  font=createFont("gillsans",21);
  
}
void draw(){
  background(0,200,70);
  stroke(255);
  strokeWeight(5);
  //lina di campo
  line (500,0,500,500);
  fill(0,200,70);
  //porta 1
  rect(-5,100,200,300);
  //porta 2
  rect(1005,100,-200,300);
  //portieri
  strokeWeight(0);
  stroke(255,0,0);
  fill(255,0,0);
  rect(0,port1,20,40);//portiere 1
  
  stroke(0,0,255);
  fill(0,0,255);
  rect(1000,port2,-20,40);//portiere 2
  //palla
  smooth();
  stroke(255,255,0);
  fill(255,255,0);
  ellipse(x,y,10,10);
  //condizioni pallina 
  x=x+sx;
  y=y+sy;
  
  if(x>width -10){
    sx=-1*sx;
  }
  
  if(y>height-10){
    sy=-1;
  }
  
  if(x<0){
    sx=-1*sx;
  }
  if(y<0){
    sy=1;
  }
  
  //collision detection
  if((x==20)&&(y>=port1)&&(y<=port1 + 40)){
    sx=-1*sx;
  }
  if((x==(width-30))&&(y>=port2)&&(y<=port2+40)){
    sx=-1*sx;
  }
  
  //punteggi
  if((x>width -10)&&(y>=100)&&(y<=400)){
    punteggio1=punteggio1+1;
    x=width/2;
    y=height/2;
    sx=1*sx;
  }
  if((x==0)&&(y>=100)&&(y<=400)){
    punteggio2=punteggio2+1;
    x=width/2;
    y=height/2;
    sx=-1*sx;
  }
  //mostra punteggio
  fill(255);
  textFont(font);
  text(punteggio1,(width/2)-45,30);
  text(punteggio2,(width/2)+30,30);
    
  //condizione di vittoria
  if(punteggio1==5 || punteggio2==5){
    background(0);
    fill(255,0,0);
    
    font2=createFont("Gill sans", 50);
    textFont(font2);
    if(punteggio1>punteggio2){
      text("HA VINTO IL GIOCATOE ROSSO",width/2-350, height/2-10);
    } else {
        text("HA VINTO IL GIOCATORE BLU",width/2-350, height/2-10);
      }
    noLoop();
  }

}

//pulsanti
void keyPressed(){
  if(key=='a'){
    port1=port1-incR;
  }
  if(key=='z'){
    port1=port1+incR;
  }
  if(key=='k'){
    port2=port2-incR;
  }
  if(key=='m'){
    port2=port2+incR;
  }
}
    
    




