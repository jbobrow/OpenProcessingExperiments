
PFont font1, font2,font3,font4;
PImage o;
float x1=1000;
float x2=2000;
float x3=-2000;
float x4=3000;
float x5=0;
float angle = 0;

import ddf.minim.*;
AudioPlayer player;
Minim minim;
boolean old=false;
String n= "He's an old MAN!";
String p="What a Loser.";
String q="What did you call me? I'll tell you what i am press space";
String a= "BUT NOW that I'm an old fuck......... and that's what I consider myslef to be,an old fuck.";
String b= "old fuck is very specical TERM, it's not like old man, old man is different, old man itsn't really a time in you're life or a period of years.";
String c= "it's an attitude, old man is point a view, it's a way of looking at things";
String d= "Some guys are old men when there in there tweinties, you've met guys like that";
String e="there just wired like old men";
String f="NOT ME";
String g="not an old man, and not an old fart";
String h="cause an old fart is kinda like"; 
String r="lamamamamaaa";
String i="what I am is an old fuck";
String j="it's kinda like a FAT fuck";
String k="know what I mean?";
String s= "Fat fuck";
String t="Tall fuck"; 
String u="Skinny fuck"; 
String v= "Short fuck";
String l="OLD FUCK, who's the old fuck? That's Gerogie, Gerogie the old fuck.";
String m="In this repect, fuck is actually a synonym for the word fellow";

void setup () {

  size (600, 400);
  font1 = loadFont("BellMTItalic-48.vlw");
  font2 = loadFont("Boopee-Bold-32.vlw");
  font3 = loadFont("ForteMT-32.vlw");
  font4 = loadFont("MonotypeCorsiva-32.vlw");
  o= loadImage ("billy.jpg");
  minim = new Minim(this);
  player = minim.loadFile("old.mp3", 2048);
}


void draw() {

  outershell();

  if (old)innershell();
  //int sx = second();
}






void outershell() {
  background(o);
  textFont(font2);
  
  fill(255);
  ellipse(490, 100, 200, 70);
  fill(255, 10, 10);
  text(n, 410, 110);

  fill(255);
  ellipse(100, 200, 200, 70);
  fill(10, 200, 10);
  text(p, 20, 210);

  
  textSize(30);
  fill(255);
  rect(50,10,600,50);
  fill(5,38,245);
  text(q, 50, 50);
}




void innershell() {
  background(255);
  player.play();
  textFont(font1);


  fill(0);
  textSize(20);
  text (a, x1, 100);  
  x1-=2;

  if (x1<20)
  

 text (b, x2, 150);
  x2-=2.3;
  

  if (x2<10)
   
    text(c, 0, x3);
  x3+=1.76;
   
  if (x3>10)
   
  text (d, 0, x4);
  x4-=1.9;
  
  if (x4>-230 && x4<0)
   
    text (e, 300, 400);
    textSize(50);
   
  if (x4<-240 && x4>-310)
    text (f,190,200);
   textSize(30);
 
 if (x4<-320 && x4>-520)
   text(g,50,100);
     
 
 if (x4<-530&& x4>-710)
 {
   text(h,x5,375);
  
   
 }

  
 if (x4<-720 && x4>-1020)
 {
   textSize (20);
   angle +=.01;
   translate(255,155);
   rotate(angle);
   text (r,100,100);
   textSize(40);
   
 }
 if (x4<-1125 && x4>-1300)
     text (i,199,200);
     textFont(font3);
     textSize(48);
 
 if(x4 <-1400 && x4>-1600)
   text(j,75,200);
   textFont(font1);
   textSize(20);
 
 if(x4 <-1700 && x4>-1750)
   text (k,100,100);
   textFont(font3);
   textSize(30);
   
 if(x4<-1750 && x4>-2150)
 {
    text(s,0,200,100,150);
    textFont(font2);  
    text(t,100,100,150,400);
    textFont(font1);
    textSize(27);
    text(u,250,200,75,200);
    textSize(10);
    text(v,400,300,75,150);
    
 }
 if (x4<-2200 && x4>-2600)
 {
     textFont(font4);
     textSize(20);
     text(l,0,50);
 }
if (x4<-2770 && x4>-4000)
{
  textFont(font2);
  textSize(30);
  text(m,10,150);
  text("press v to exit",200,200);
}


}


void keyPressed () {
  if (key==' ') {
    old=true;
  }
  if (key== 'v')
    old=false;
}


void stop()
{
if ( player == null )
{
  player.close();
}
  minim.stop();

  super.stop();
}






