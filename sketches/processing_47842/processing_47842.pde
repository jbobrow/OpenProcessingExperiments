
import ddf.minim.*;
PImage back, dude, speed;
PImage[] num = new PImage[10];
float x,y;
int timer,timer2,timer3,timer4,count,count2,count3,count4, game;
Minim minim;
AudioPlayer song;

void setup(){
  size(800,600);
  minim = new Minim(this);
  song = minim.loadFile("speedgame.mp3");
  song.loop();
  x=30;
  y = 320;
  timer = millis();
  timer2 = millis();
  timer3 = millis();
  timer4 = millis();
  back = loadImage("dudeback.png");
  dude = loadImage("dude.png");
  speed = loadImage("speeddude.png");
  num[0] = loadImage("0.png");
  num[1] = loadImage("1.png");
  num[2] = loadImage("2.png");
  num[3] = loadImage("3.png");
  num[4] = loadImage("4.png");
  num[5] = loadImage("5.png");
  num[6] = loadImage("6.png");
  num[7] = loadImage("7.png");
  num[8] = loadImage("8.png");
  num[9] = loadImage("9.png");
  count=9;
  count2=9;
  count3=9;
  count4=2;
  game=0;
}

void draw(){
 if(game==0){ 
 image(back,0,0);
 }
 
 if(!keyPressed){
 image(dude,x,y);
 }else{
   fill(0);
 ellipse(random(800),random(300),10,10);
 }
 if(keyPressed&&key=='d'){
  x+=.38;
  image(speed,x,y); 
 }
 if(keyPressed&&key=='a'){
  x-=4;
  image(speed,x,y); 
 }
 image(num[count],720,0);
 image(num[count2],640,0);
 image(num[count3],560,0);
 image(num[count4],480,0);
 if(millis()-timer>10){
   timer=millis();
  if(count!=0){
  count--; 
  }else{
  count=9;
  } 
 }
 if(millis()-timer2>100){
   timer2=millis();
  
  if(count2!=0){
  count2--; 
  }else{
  count2=9;
  }
 }
 if(millis()-timer3>1000){
   timer3=millis();
  
  if(count3!=0){
  count3--; 
  }else{
  count3=9;
  }
 }
 if(millis()-timer4>10000){
   timer4=millis();
  
  if(count4!=0){
  count4--; 
  }else{
  count4=9;
  }
 }

 if(x>680){
   x=-100;
 }
 
  
  
  
}


