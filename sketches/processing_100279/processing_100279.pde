
//suzanne1, suzanne choi, project1


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
int Phase;

PFont f;
Minim minim;
AudioPlayer s1,s2,s3,s4,s5,s6,s7;

float diam = 20;
float bar = 250;
float []x={
50,100,150,200,250,300,350
};
float [] y={
 0,0,0,0,0,0,0};
float []x1 = {
50-(diam/1.5),100-(diam/1.5),150-(diam/1.5),
200-(diam/1.5),250-(diam/1.5),300-(diam/1.5),350-(diam/1.5)};
float []y1 = {
70,170,270,370,470,570,670};

color [] col = {
color (random(10,100),random(80,200),random(190,255)),
color (random(10,100),random(80,200),random(190,255)),
color (random(10,100),random(80,200),random(190,255)),
color (random(10,100),random(80,200),random(190,255)),
color (random(10,100),random(80,200),random(190,255)),
color (random(10,100),random(80,200),random(190,255)),
color (random(10,100),random(80,200),random(190,255))
};

color [] col2 = {
color (209,67,86),
color (232,131,23),
color (232,225,23),
color (69,142,129),
color (67,106,183),
color (25,27,88),
color (132,81,160)
};


float [] deltaY = {
random(5,10),random(5,10),random(5,10),random(5,10),
random(5,10),random(5,10),random(5,10)};

float [] deltay = {2,3,2,4,1,2,1};

void setup()
{
size (400,800);
frameRate(20);
minim = new Minim(this);
s1 = minim.loadFile("1.mp3");
s2 = minim.loadFile("2.mp3");
s3 = minim.loadFile("3.mp3");
s4 = minim.loadFile("4.mp3");
s5 = minim.loadFile("5.mp3");
s6 = minim.loadFile("6.mp3");
s7 = minim.loadFile("7.mp3");
Phase=0;
}

void draw(){
  background (255);
  if (Phase == 0 )
  {showInstruction();
  }
   
  else if (Phase == 1)
  {
  drawLine();
  drawEllipse();
  drawRect();
  sound();
  } 
}

void showInstruction(){
fill(150);
textSize(10);
text("do you want to hear what raindrop wants to tell you?", width/3, height/3);
text("click your mouse and listen carefully to the raindrops.", width/3.1, height/3+30);
text("if you want to listen more, press 'b'", 10, height/1.8);
text("if you want to listen less, press 's'", 10, height/1.8+30);
smooth();
noStroke();
fill(156,196,234);
ellipse(width*.7, height*.8, 70,70);
triangle(width*.7,height*.73,width*.637,height*.77, width*.767,height*.77);
}

void mousePressed()
{
  if (Phase == 0 )
  {
    Phase=1;
  }
}



void drawEllipse(){
for (int i=0; i<x.length; i++){
     y[i] = y[i] +deltaY[i];
fill(col[i]);
noStroke();
triangle(x[i],y[i]-diam,x[i]+diam/2.1,y[i]-diam/5, x[i]-diam/2.3,y[i]-diam/5);
ellipse(x[i], y[i], diam,diam);
  
 if ( y[i] > height){
     y[i] = -height+diam/2;
 }   
}
}

void drawLine(){
for (int i=0; i<x1.length;i++){
  stroke(col2[i]);
  strokeWeight(2);
  line(x1[i]+(diam/1.4),0,x1[i]+(diam/1.4),height);
}
}

void drawRect(){
  for (int i=0; i<x1.length;i++){
  y1[i] = y1[i]-deltay[i];
  noStroke();
 
  fill(col2[i]);
  rectMode(CORNER);
  rect(x1[i],y1[i],diam+diam/2,bar);
  if (y1[i]<-bar){
  y1[i]=height;} 
}
}

void sound(){  
float dist_1 = dist(x[0], y[0], x1[0], y1[0] );
float dist_2 = dist(x[1], y[1], x1[1], y1[1] );
float dist_3 = dist(x[2], y[2], x1[2], y1[2] );
float dist_4 = dist(x[3], y[3], x1[3], y1[3] );
float dist_5 = dist(x[4], y[4], x1[4], y1[4] );
float dist_6 = dist(x[5], y[5], x1[5], y1[5] );
float dist_7 = dist(x[6], y[6], x1[6], y1[6] );

if(dist_1 < 50){
    col2[0] = color(227,64,140);
    s1.play();
} 
else if (dist_1>bar){
   
   s1.pause();
   s1.rewind();
   col2[0] = color (209,67,86);
}

if(dist_2 < 50){
    col2[1] = color(245,159,89);
    s2.play();
} 
else if (dist_2>bar){
   s2.pause();
   s2.rewind();
   col2[1] =color (232,131,23);
}

if(dist_3 < 50){
  col2[2] = color(240,235,143); 
  s3.play();
} 
else if (dist_3>bar){
   s3.pause();
   s3.rewind();
   col2[2] = color (232,225,23);
}

if(dist_4 < 50){
    s4.play();
    col2[3]= color(179,242,209);
} 
else if (dist_4>bar){
   s4.pause();
   s4.rewind();
   col2[3] = color (69,142,129);
}

if(dist_5 < 50){
    col2[4] = color(179,218,242);
    s5.play();
} 
else if (dist_5>bar){
   s5.pause();
   s5.rewind();
   col2[4] = color (67,106,183);
}

if(dist_6 < 50){
  col2[5] = color (89,91,131);  
  s6.play();
} 
else if (dist_6>bar){
   s6.pause();
   s6.rewind();
   col2[5] = color (25,27,88);
}

if(dist_7 < 50){
  col2[6] = color(207,166,234);  
  s7.play();
} 
else if (dist_7>bar){
   s7.pause();
   s7.rewind();
   col2[6] = color(132,81,160);
}

}

void keyPressed(){
if (key == 'b')
{
  bar=bar+30;
}
else if (key == 's')
{
  bar=bar-30;
}
}



