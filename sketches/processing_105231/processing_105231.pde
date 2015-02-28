
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer song;
PImage ship;
PImage UFO;
PImage background;
int x=650;
int y=600;
int m=0;
int d=0;
float r=0;
int rr = 0;
int first =0;

void setup(){
frameRate(1000);
size(1450,700);
loadSong();
ship=loadImage("ship.jpg");
UFO=loadImage("UFO#.jpg");

background=loadImage("space.jpeg");
background.resize(1450,700);
background(background);
ship.resize(100,100);
UFO.resize(200,140);
image(UFO,30,0);
image(UFO,230,0);
image(UFO,430,0);
image(UFO,630,0);
image(UFO,830,0);
image(UFO,1030,0);
image(UFO,1230,0);
stroke(63,255,0);
m=millis();
}
void draw(){
frameRate(400);
if(gameOver == 0){
if(first==0){
x=650;
y=600;
first=1;
}
if(millis()>m+800){
dropLines();
m=millis();
}else{
background(background);
image(UFO,30,0);
image(UFO,230,0);
image(UFO,430,0);
image(UFO,630,0);
image(UFO,830,0);
image(UFO,1030,0);
image(UFO,1230,0);
d=d+3;
line(x1[rr],y1[rr]+d,x2[rr],y2[rr]+d);
}
image(ship,x,y);
if(keyPressed==true){
if(key==CODED){
if (keyCode==RIGHT){
background(background);
image(UFO,30,0);
image(UFO,230,0);
image(UFO,430,0);
image(UFO,630,0);
image(UFO,830,0);
image(UFO,1030,0);
image(UFO,1230,0);
image(ship,x++,y);
line(x1[rr],y1[rr]+d++,x2[rr],y2[rr]+d++);
}
if(keyCode==LEFT){
background(background);
image(UFO,30,0);
image(UFO,230,0);
image(UFO,430,0);
image(UFO,630,0);
image(UFO,830,0);
image(UFO,1030,0);
image(UFO,1230,0);
image(ship,x--,y);
line(x1[rr],y1[rr]+d++,x2[rr],y2[rr]+d++);
}
}
}
if(x>1350){
x=1400;
}
if(x<0){
x=0;
}
textSize(25);
if(x2[rr]>=x&&x2[rr]<=x+100&&(y2[rr]+d)>700){
image(ship,x,800);
background(background);
image(UFO,30,0);
image(UFO,230,0);
image(UFO,430,0);
image(UFO,630,0);
image(UFO,830,0);
image(UFO,1030,0);
image(UFO,1230,0);
song.play();
textSize(100);
fill(255,0,0);
text("Game Over",450,350);
text("Press space to restart",250,450);
gameOver=1;
}
}if(gameOver==1&&keyPressed&&key==' '){gameOver=0;loadSong();first=0;}
}
int []x1={600,460,400,260,60,130,330,530,670,740,800,870,940,1000,1070,1140,1200,1270,1340,1410};
int []y1={100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100};
int []x2={600,460,400,260,60,130,330,530,670,740,800,870,940,1000,1070,1140,1200,1270,1340,1410};
int []y2={150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150};
int gameOver =0;
void dropLines(){
  
r=random(19);
rr=int(r);
line(x1[rr],y1[rr],x2[rr],y2[rr]);

d=0;
  
}
void loadSong(){
minim=new Minim(this);
song = minim.loadFile("explosion.mp3");
}




