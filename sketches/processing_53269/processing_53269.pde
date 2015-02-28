
int gameover=0;//0=gameover 1=touch wall 2=kill by self
int egg=1;
int fruit=1;
int headX,headY;
int dir;
float speed;
int [] headDirX={1,0,-1,0};
int [] headDirY={0,1,0,-1};//Use array to select direction
int [] tail=new int[50*50];
public static int scr=0;
//boolean re=false;
int SnakeScr;
//import processing.opengl.*;
void setup(){
  size(500,500);
  //background(20,40,50);
  noSmooth();
  headX=25;
  headY=25;
  dir=0;
  //X-->1,Y-->0 Right
  //X-->-1,Y-->0 Left
  //X-->0,Y-->1 Down
  //X-->0,Y-->-1 Up
  speed=6;
  frameRate(6);//set framerate
  for(int i=0;i<50*50;i++){
    tail[i]=0;
  }
  NextFruit();
}
void draw(){
  background(204);
  frameRate(speed);
  //draw a head
  //rect(headX,headY,9,9);
  if(gameover==1){
    background(255);
    walltoword();
  }else if(gameover==2){
    background(255);
    selftoword();
  }else{
    SnakeMove();//let Snake Move
    Score();
    
  }
  //println(dir);
}
void SnakeMove(){
  headX+=headDirX[dir];
  headY+=headDirY[dir];
  if(headX<0||headX==50||headY<0||headY==50){
    gameover=1;
    //walltoword();
    return;
  }
  if(tail[headX+headY*50]>0){
    gameover=2;
    return;
  }
  if(tail[headX+headY*50]==-1){
    egg+=fruit;
    fruit++;
    tail[headX+headY*50]=0;
    NextFruit();
  }
  tail[headX+headY*50]=egg;
  for(int i=0;i<50*50;i++){
    if(tail[i]==-1){
      int nowX=i%50;
      int nowY=i/50;
      fill(255,0,0);
      rect(nowX*10,nowY*10,9,9);
      //box(10,10,10);
      fill(255);
    }else if(tail[i]!=0){
      tail[i]=tail[i]-1;
      int nowX=i%50;
      int nowY=i/50;
      rect(nowX*10,nowY*10,9,9);
    }
  }
}
void NextFruit(){
  int nowEmpty=0;
  for(int i=0;i<50*50;i++){
    if(tail[i]==0){
      nowEmpty++;
    }
  }
  int r=int (random(nowEmpty));
  for(int i=0;i<50*50;i++){
    if(tail[i]==0){
      r--;
      if(r<=0){
        tail[i]=-1;
        scr++;
        speed+=1.5;
        SnakeScr=scr;
        println("Speed "+speed);
        println("Score "+(SnakeScr-1));
        break;
      }
    }
  }
}
void walltoword(){
  //int Testscr=Integer.parseInt(scr);
  String Testscr=String.valueOf(scr-1);
  textSize(24);
  textAlign(CENTER);
  fill(random(50,100));
  text("Don't touch the Wall!",width/2,height/2);
  text("Your Final Score is "+Testscr,width/2,height/2+24); 
  //text(scr);
}
void selftoword(){
  String Testscr=String.valueOf(scr-1);
  textSize(24);
  textAlign(CENTER);
  fill(random(50,100));
  text("I hurtd meself!!",width/2,height/2);
  text("Your Final Score is "+Testscr,width/2,height/2+24); 
}
void Score(){
  String Screenscr=String.valueOf(scr-1);
  String infospeed=String.valueOf(speed);
  textSize(15);
  textAlign(LEFT);
  text("Score "+Screenscr,20,15);
  text("Speed "+speed,80,15);
  text("L:longer",20,30);
  text("R:sheds skin(rest)",20,45);
  text("S:Speed Up",20,60);
}
void shedSkin(){
  gameover=0;
  egg=1;
  fruit=1;
  scr=1;
}
  
void keyPressed(){
  //use keyboard to move the snake
  if(keyCode==RIGHT){
    if(dir!=2)
    dir=0;
    println("Snake turn Right");
  }else if(keyCode==LEFT){
    if(dir!=0)
    dir=2;
    println("Snake turn Lift");
  }else if(keyCode==DOWN){
    if(dir!=3)
    dir=1;
    println("Snake turn Down");
  }else if(keyCode==UP){
    if(dir!=1)
    dir=3;
    println("Snake turn UP");
  }
  if(key=='l'||key=='L'){
    egg+=fruit;
    fruit++;
    println("Amazing!");
  }
  if(key=='r'||key=='R'){
    shedSkin();
    println("Snake sheds its skin!");
    //re=true;
  }if(key=='s'||key=='S'){
    speed++;
    println("Speed "+speed);
  }
}

