
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage img; 
PImage img1;
float posizioneXCacchina;
float posizioneYCacchina;
float PosizioneYCarta;
int start;
int avanti;
int goal;
int parata;

PFont font;

void setup(){

  size(400,350);
  img = loadImage ("cacchina1.gif");
  img1 = loadImage ("carta.gif");
start=1;
  avanti=1;
  PosizioneYCarta=300;
  goal=0;
  parata=0;
 font = loadFont("CenturyGothic-20.vlw"); 
  textFont(font);
    
minim = new Minim(this);
  player = minim.loadFile("canzone.mp3");
  player.loop();    

}


void draw(){

  background(170,34,68);
  image(img,posizioneXCacchina,posizioneYCacchina);
  
  imageMode(CENTER);
  image(img1, 0+mouseX,PosizioneYCarta);
 
 fill(0);
 text("I    WON:", 30, 30);
  text("I    LOST:", 30, 60);
  text(parata, 130, 30);
  text(goal, 130, 60);
  
  if (start==1)
  {
    posizioneXCacchina=random(width);
    posizioneYCacchina=0;
  image(img,posizioneXCacchina,posizioneYCacchina);
    start=0;
  }
  else
  {
    if (avanti==1)
    {
 posizioneYCacchina=posizioneYCacchina+5;
  image(img,posizioneXCacchina,posizioneYCacchina);
      
if(mouseX-30<posizioneXCacchina && mouseX+30>posizioneXCacchina && PosizioneYCarta-50<posizioneYCacchina && PosizioneYCarta+50>posizioneYCacchina)
      {
        avanti=0;
        
        parata=parata+1;
        println("numero parate: ");
        println(parata);
       

        
      }
      else
      {
        if(posizioneYCacchina==PosizioneYCarta+30){
          goal=goal+1;
          println("numero goal: ");
          println(goal);
          start=1;
        }
      }

    }
    else{//indietro
    
          posizioneYCacchina=posizioneYCacchina-5;
  image(img,posizioneXCacchina,posizioneYCacchina);
                    
          if(posizioneYCacchina<0){
          
            start=1;
            avanti=1;
          }

    
    }
  
  
  }
  
}
  
  



