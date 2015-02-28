
PFont font;
PImage c;
PImage r;
PImage rock1;
PImage rock1broken;
PImage reddead;
int cary=110;
int rockx=500;
int rocky=150;
char[] alphabet ={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
char letter;
int rockxb=-30;
int rockyb=-30;
int randy;
boolean dead=false;
int speed=1;
int score=0;

void setup(){
  size(500,300);
  font=loadFont("ArialMT-20.vlw");
  c=loadImage("carsprite.png");
  r=loadImage("roadbackground.png");
  rock1=loadImage("rock1.png");
  rock1broken=loadImage("rock1broken.png");
  reddead=loadImage("reddead.png");
  textFont(font,20);
  
  int picker = int(random(alphabet.length));  
  letter=alphabet[picker];  
}

void draw(){
  background(160,82,45);
  image(r,0,90);
  image(rock1,rockx,rocky,35,35);
  text(letter,rockx+11,rocky+27);
  image(rock1broken,rockxb,rockyb,30,30);
  rockx-=speed;
  rockxb-=speed;
  image(c,0,cary,93,60);
  text("Score: "+score,10,20);
  if(rockx<=90){
    dead=true;
    tint(255,0,0,129);
    image(reddead,0,0);
    text("Your score was: "+score,10,20);
  }
}

void keyPressed(){
  if((key==letter)&&(dead==false)){
    rockxb=rockx;
    rockyb=rocky;
    image(rock1broken,rockxb,rockyb,30,30);
    int picker = int(random(alphabet.length));  
    letter=alphabet[picker];  
    rockx=500;
    randy=int(random(2));
    if(randy==0){
      rocky=150;
    }else{
      rocky=100;
    }
    score+=1;
    if(score%10==0){
      speed+=1;
    }
  }
  if((key=='r')&&(dead==true)){
    speed=1;
    rockx=500;
    score=0;
    int picker = int(random(alphabet.length));  
    letter=alphabet[picker];
    noTint();
    background(160,82,45);
    image(r,0,90);
    image(rock1,rockx,rocky,35,35);
    text(letter,rockx+11,rocky+27);
    image(rock1broken,rockxb,rockyb,30,30);
    dead=false;
  }
}

