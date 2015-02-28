
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/100272*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
Temps cronometre = new Temps();
int x=0;
int y=0;
int a=(int)random(random(100,200));
Cercle[] c;
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup(){
  size(400,400);
  noStroke();
  cronometre.reinicia();
  smooth();
  fill(random(255));
  c = new Cercle[36];
  for(int i=0;i<36;i++){
    c[i]=new Cercle(a);
  }
  minim = new Minim(this);
  player = minim.loadFile("HS.mp3");
  player.play();
}
void draw(){  
/* tiempoMostrado:
  textSize(12);
  fill(0);
  text(cronometre.minuts()+":"+cronometre.segons(), 10, 60);*/
  
//-------------------------------------------------------------------  
  if(cronometre.segons()<16){ //cuando el segundo es menor que ();
    background(0);//fondo

    for(int j=20;j<260;j+=40){
      for(int i=20;i<260;i+=40){
        fill(250);
        ellipse(80+i,80+j,20,20);
        //el primer bombo
        fill(random(200),random(200),random(200));
        ellipse(100,100,20,20);
      }
    }
//------------------------------------------------------------------
  //cuando pasa el limite de tiempo
  }else if(cronometre.segons()>15 && cronometre.segons()<31){
    //background(random(200),0,0);//fondo
    
    for(int j=20;j<260;j+=40){
      for(int i=20;i<260;i+=40){
        fill(random(200),random(200),random(200));
        ellipse(80+i+x,80+j+y,20,20);
      }
    }
//------------------------------------------------------------------
  //segundo cambio del tiempo
  }else if(cronometre.segons()>30 && cronometre.segons()<44){
    background(0,random(0),0);//fondo
    
    for(int j=20;j<260;j+=40){
      for(int i=20;i<260;i+=40){
        fill(random(200),random(200),random(200));
        ellipse(80+i+x,80+j+y,20,20);
      }
    }
    x=(x+20)%3;
    y=(y+2)%3;
//------------------------------------------------------------------
  //tercer cambio del tiempo
  }else if(cronometre.segons()>43 && cronometre.segons()<57){
    background(random(200),random(200),random(200));
    
    for(int i=0; i<c.length; i++){
      c[i].show();
      c[i].move();
    }
  }else{
    background(0);
  }
//------------------------------------------------------------------
}
class Temps{
  int principi;
  Temps(){
    principi=millis();
  }
  void reinicia(){
    principi=millis();
  }
  int mostraTotalSegons(){
    return millis()-principi;
  }
   int segons(){
    return (millis()-principi)/1000%60;
  }
  int minuts(){
    return (millis()-principi)/60000;
  }
}
//-------------------------------------------------------------------
class Cercle{
  float x,y;
  int r;
  int col;
  float vx,vy;

  Cercle(int c){
    col=c;
    x=random(r,width-r);
    y=random(r,height-r);
    r=(int)random(15,35);
    vx=random(-1,1);
    vy=random(-1,1);
  }
//------------------------------------------------------------------
  void show(){
    smooth();
    ellipse(x,y,r,r);
  }
  void move(){
    x=x+vx*50;
    y=y+vy*50;
    if( x<r || x>width-r ){
      vx=vx * -1;
    }
    if( y<r || y>height-r ){
      vy = vy * -1;
    }
  }
}
void stop(){
  player.close();
  minim.stop();
  super.stop();
}

