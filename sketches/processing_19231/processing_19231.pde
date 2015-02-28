
//Watch the enemies show off their moves as they glide through World 1
//Control Mario by using the arrow keys and UP to jump, and  get over enemies



import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
AudioPlayer player;
Minim  minim;
//float ground=line(0,180,250,180)  ;
float gravity= 0.05;
float lk=0;
float lx=100;
float posX= 5;
float posY= 197;
float kp= 200;
float sp=100;
float s1=100;
float ks=180;
float bb=125;
float br=0;
PImage mario;
PImage level;
PImage goomba;
PImage lakitu;
PImage koopa;
PImage bulletL;
PImage shell;
PImage spinny;
PImage spinny1;
PImage bowser;
PImage luigi;
PImage bulletR;
void setup (){
  size(250,250);
  level=loadImage("level1.png");
  //mario=loadImage("super2.png");
   frameRate(60);   
 
  minim = new Minim(this);
  player =minim.loadFile("music.mp3", 2000);
  player. play();

}
   void draw(){
     goomba=loadImage("goomba.png");
     image (level,0,0,250,250);
     image (goomba,lx,182,70,80);
     lx--;
     
       mario=loadImage("super2.png");
       image(mario,posX,posY,30,40);
        
        lakitu=loadImage("lakitu.png");
        image(lakitu,lk++,15,100,100);
        lk++;
        
        koopa=loadImage ("koopa.png");
        image(koopa,kp--,170,90,100);
        
        spinny=loadImage ("spinny.png");
        image(spinny,sp++,177,70,90);
        
        spinny1= loadImage ("spinny1.png");
        image(spinny1,30,s1++,60,60);
        
       shell= loadImage("shell.png");
       image(shell,ks-- ,180,80,80);
        ks--;
        
        bowser=loadImage("bowser.png");
        image(bowser,230,130,35,50);
        
        bulletL=loadImage("bulletL.png");
        image(bulletL,bb--,50,120,120);
        bb--;
        
        luigi=loadImage("luigi.png");
        image(luigi,100,120,65,80);  
       
       bulletR=loadImage("bulletR.png");
       image(bulletR,br++,30,120,120);
       br++;
       br++;
       br++;
       br++;
       
  
        
   }
      
    
void keyPressed() {
  
  
  
     if (keyCode==RIGHT){
      posX++;
      posX++;
      posX++;
      }
     
     if (keyCode== LEFT) {
       posX--;
        posX--;
      posX--;
     }
     
     if (keyCode== UP){
       posY-=40;
      
     }
}

void keyReleased(){
if (keyCode ==UP){
posY+=800*gravity ;
int posY= min(0,140);
int poY= max (180,140);


} 
}



