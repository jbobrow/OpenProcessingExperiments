
float playery=510;
float playerx=150;
float playert;
int timeLast=0;//used to store seconds
int x= 0;
int xx= 5;//player widthhhh
int yy= 5;//player height
boolean[] keys;
import ddf.minim.*;
AudioPlayer player;
AudioPlayer player2;
Minim minim;
void setup() {
  size(300, 600);
  keys= new boolean[3];
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  timeLast=second();
  //sound
  minim = new Minim(this);
  player=minim.loadFile("jump.mp3");
  player2=minim.loadFile("low-spring-sound.mp3");
}
void draw() {
  playert=playery+yy ; 
  frameRate(60);
  background(255);
  //movement right left
  if (keys[0]==true) {
    playerx=playerx-2;
  }
  if (keys[1]==true) {
    playerx=playerx+2;
  }


  //KEYssss
  if (keyPressed==true) {

    if (key=='a') {//left
      keys[0]=true;
    }
    if (key=='d') {//right
      keys[1]=true;
    }
    if (key=='w') {//up
      keys[2]=true;
    }
  }

  //GRAVITY
  if (playery<=580) {//if not on the floor
    playery=playery+3;//the player falls
  }
  //PLAYERR
  fill(255);
  rect(playerx, playery, xx, yy);
  println(playery);
  //PLATFORMS
  //platform 1
  fill(255,0,0);
  rect(30,550,30,10);//icon
  if ((playery+yy>=550 && playery+yy<=560) && (playerx>=30 && playerx<=60)){
    playery=playery-4;
  }
  
  fill(255);
  //begin jump swich to timer void
  if (keys[2]==true) {
    timer();
  }
}


//key triggers for multi key usage
void keyReleased() {
  if (key=='a') {
    keys[0]=false;
  }
  if (key=='d') {
    keys[1]=false;
  }
  if (key=='w') {
    keys[2]=false;
    player.rewind();
  }
}
//the jump timer
void timer() {
  if (second()!=timeLast) {
    timeLast=second();
    x+=1;
    
  }
  if (x>1) {
    x=0;
  }
  if (x==1) {
    player.play();//mario sound effect
    playery=playery-4;//jump
  }
}


