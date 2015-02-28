
int playery=510;//510 to start
int playerx=150;//150
int timeLast=0;//used to store seconds
int x= 0;
int xx= 5;//player widthhhh
int yy= 10;//player height
int plat3 = 0;//moving platform #3
float plat7 = 0;//moving platform #7
int plat8 = 200;
int dir=-1;
float dir2=.5;
PFont font;//number font
int playerb;

boolean[] keys;
import ddf.minim.*;
AudioPlayer player;
AudioPlayer player2;
Minim minim;
void setup() {
  font = loadFont("AgencyFB-Bold-12.vlw");
  textFont(font, 20);
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
  plat3 = plat3+1;
  plat7 = plat7+dir2;
  plat8=plat8+dir;
  playerb=playery+yy ; 
  frameRate(60);
  background(255);//clear screen
  
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
  fill(255, 0, 0);
  rect(playerx, playery, xx, yy);
  println(playery);
  //PLATFORMS
  //platform 1
  fill(150);
  rect(30, 550, 30, 10);//icon
  //platform 2
  fill(150);
  rect(0, 510, 20, 10);//icon
  //platform 3 (moving)
  rect(plat3, 460, 30, 10);
  if (plat3>=300) {
    plat3 = 0;
  }
  if ((playerb>=545 && playerb<=555) && (playerx>=30 && playerx<=60)) {
    playery=545-yy;
  }

//platform 2
  if ((playery+yy>=505 && playery+yy<=510) && (playerx>=0 && playerx<=20)) {
    playery=505-yy;
  }
//platform 3
  if ((playery+yy>=455 && playery+yy<=460) && (playerx>=plat3 && playerx<=plat3+30)) {
    playery=455-yy;//make this platform bigger
  }
  //platform 4
  fill(150);
  rect(100, 410, 50, 10);//icon
  if ((playerb>=405 && playerb<=415) && (playerx>=100 && playerx<=150)) {
    playery=405-yy;
  } 
  //platform 5
  fill(150);
  rect(0, 370, 70, 10);
  if ((playerb>=365 && playerb<=370) && (playerx>=0 && playerx<=70)) {
    playery=365-yy;
  }
  //platform 6 
  fill(150);
  rect(0,345,300,10);
  if ((playerb>=340 && playerb<=345) && (playerx>=0 && playerx<=300)) {
    playery=340-yy;
  }
  //platform 7
  fill(150);
  rect(plat7,300,60,10);
  if (plat7>300-60) {
    dir2=dir2*-1;
  }
  if (plat7<0) {
    dir2=dir2*-1;
  }
  
  if ((playerb>=295 && playerb<=300) && (playerx>=plat7 && playerx<=plat7+60)) {
    playery=295-yy;
  }
  //platform 8 
  fill(150);
  rect(plat8,240,80,10);
  if (plat8>220) {
    dir=dir*-1;
  }
  if (plat8<0) {
    dir=dir*-1;
  }
  if ((playerb>=235 && playerb<=240) && (playerx>=plat8 && playerx<=plat8+80)) {
    playery=235-yy;
  }
  // BIG BOX PLATFORM
  fill(0);
  rect(100,210,40,40);
  //left side
  if ((playerx>=90 && playerx<=95) && (playery>=210 && playery<=250)) {
    playerx=90;
  }
  //right side
  if ((playerx>=140 && playerx<=145) && (playery>=210 && playery<=250)) {
    playerx=145;
  }
  //top side
  if ((playerb>=205 && playerb<=210) && (playerx>=99 && playerx<=140)) {
    playery=205-yy;
  }
  //jumping block
  fill(0,0,255);
  rect(100,100,5,50);
  if ((playery>=100 && playery<=150) && (playerx>=100 && playerx<=105)) {
    playery=playery-5;
  }
  //platform 9 
  fill(150);
  rect(130,60,30,10);
  if ((playerb>=55 && playerb<=60) && (playerx>=130 && playerx<=160)) {
    playery=55-yy;
  }
  //winner
  text("It", 140, 50);
  //rect(140,40,10,10); show space
  if ((playery>=40 && playery<=50) && (playerx>=140 && playerx<=147)) {
    fill(0);
    text ("You found It",30,90);
    exit();
  }
  

  

  fill(0);
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




