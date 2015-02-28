
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;  //audio playback object
AudioPlayer gun_sound;  //Variable for audio
AudioPlayer flyBy;  //planes sound variable

float posX=700;  //Variable for X coord of enemy plane
float posY=100;  //Variable for Y coord of enemy plane
float bulletsXCord;  //Variable for X coord of player bullets
float bulletsYCord;  //Variable for Y coord of player bullets
int score=0;          //Variable for Score of player
int perHitScore;      //Variable for per hit score
PImage bomber,playerRecticle;
PImage gameWin,gameLost;  //Variables of images
PImage []playerWeapon;
int health=200;     //Effective health of player
float bullets; //size of bullets explosion
boolean startGame=true;  //this checks whether to draw images or not
int weaponPos=0;
float enemyHealth=100;

void setup() {
  size(800, 600);  
  imageMode(CENTER);  //Setting Image position coord to center of image
  
  //Loading Images 
  playerWeapon = new PImage[3];
  for(int i=0;i<3;i++){
    playerWeapon[i]=loadImage("gun"+i+".png");
  }
  
  bomber=loadImage("bomber1.png");
  gameWin=loadImage("endGame.jpg");
  gameLost=loadImage("gameLost.jpg");
  playerRecticle= loadImage("reticle.png");  
  
  minim=new Minim(this); //telling minim to play this sketch
  gun_sound=minim.loadFile("gunSound.wav");  //loading sound file
  flyBy=minim.loadFile("flyBy.wav"); 
  frameRate(30);
}

void draw() {  
   if(startGame){
   if(health>0){//checking health is greater then zero
      drawEnemy();
      image(playerRecticle,mouseX,mouseY); //this shows reticle on screen at mouse position
      image(playerWeapon[weaponRotate()],width/2,505);
       if(posY>300){
           float damage=random(4,8);
           health-=damage;
            flyBy.cue(0);
            flyBy.play();
           fill(#FF1A24);
           textAlign(CENTER);
           textSize(35);  
           text("Take Cover!!!!!!",width/2,height/3);
       }
    }//end of if
    
    //If players score reaches minimum operational health
    if(health<=40){
      statistics();  //calling function
    }
  }
}

void mousePressed(){
  //checking whether to draw bullets.
   if(startGame){
      gun_sound.cue(0);
      gun_sound.play();
      for(int i=0;i<2;i++){
            bullets = random(1,8);
            fill(#FFFF31);
            bulletsXCord=mouseX+random(-5,5);
            bulletsYCord=mouseY+random(-5,5);
            ellipse(bulletsXCord,bulletsYCord,bullets,bullets); 
        }
       if(bulletsXCord==posX&&bulletsYCord>=posY||bulletsYCord<=posY){
          score+=perHitScore;
          enemyHealth-=random(30,70);
      }
    }
}

void drawEnemy(){
    background(255);
    textSize(18);
    textAlign(LEFT);
    fill(#FF1A24);   
    text("Score "+score,0,550);
    text("Armour "+health,0,600);
    
    float add=random(3,8);
   
   if(score<100&&health>0){
       image(bomber, posX-=add, posY+=add);
       perHitScore=10;
   }
 
    if(score>=100&&health>0){
      image(bomber, posX-=add, posY+=add);
      add=random(4,8);
      image(bomber,(posX-=add)-200, (posY+=add)-200);
      perHitScore=20;
    }
    
    if(posY>350||enemyHealth<=10){
      enemyHealth=100;
      posX=700;
      posY=100;
    }
}

void keyPressed(){
  if(key=='s'||key=='S'){
  saveFrame("AirDefence##.png");
  }
}

void statistics(){
  startGame=false;
  flyBy.pause();  //this pasues fly by sound
  imageMode(CORNER);  
  if(score>=perHitScore&&health>=30&&health<=40){
      image(gameWin,0,0);
      textSize(50);
      fill(#0AFF18);
      textAlign(CENTER);
      text("Score "+score,width/2,height-20);
      text("Press S to take screen shot",width/2,50);
    }else if(score==0&&health<=40){
       image(gameLost,0,0);
       textSize(50);
       fill(#0AFF18);
       textAlign(CENTER);
       text("!!You did your level best!!",width/2,50);
     }
}


//This function checks and returns an integer value which rotates turret to left or right\\
int weaponRotate(){
  if(mouseX<350){    //This rotates turret to left i.e image is loaded of turret facing left 
    return 2;
  }
  else if(mouseX>450){//This rotates turret to right 
    return 1;
  }else  
    return 0;
}
  



