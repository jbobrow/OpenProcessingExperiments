
int monsterX;
int monsterY=830;
int teller;
int speed;
int heartcollision=700;

PImage img;
import ddf.minim.*;
AudioPlayer player;
Minim minim;

int skyline=625;
int wolk1;
int wolk2;
int wolk3;
int wolk4;
int wolk5;
int vallendHart;


float xje;
float xje2;
float xje3;
float xje4;
float xje5;
float xhart;

void setup () {
  
size (720,980);


frameRate(60);
speed=10;

wolk1=-950;
wolk2=-900;
wolk3=-400;
wolk4=-450;
wolk5=-750;
vallendHart=0;

xje=50;
xje2=100;
xje3=200;
xje4=250;
xje5=150;
xhart=300;

minim = new Minim(this);
player = minim.loadFile("powerthemesong.mp3", 2048);
player.play();

}



void draw () {
  
  
  background (#9ad5e7);
  monsterX=mouseX;
  
  if(teller>30){wolk(); wolkbeweeg();}
  
  levels();
  skyline();
  
  vallendHart();
  buttercup();
  if (teller>30){wolk2();}
  teller();
  youwon();
  
}
//wolken achter monstertje
void wolk () {
  
img = loadImage("wolk.png");
image(img, xje, wolk1);


img = loadImage("wolk3.png");
image(img, xje3,wolk3);

img = loadImage("wolk4.png");
image(img, xje,wolk4);

img = loadImage("wolk5.png");
image(img, xje,wolk5);

}
// wolk voor monstertje
void wolk2(){
  img = loadImage("wolk2.png");
image(img, xje2,wolk2);

}

void wolkbeweeg(){

  wolk1 = wolk1+2;
  wolk2 = wolk2+6;
  wolk3 = wolk3+4;
  wolk4 = wolk4+3;
  wolk5 = wolk5+4;
  
  if(wolk1 > 1100){
   xje = random(50,700);
   wolk1=-100;
  }
  if (wolk2 > 1100){
  xje2 = random (0,600);
  wolk2= -200;
  }
  if (wolk3 > 1100){
    xje3 = random (0,650);
    wolk3 = -100;
  }
  if (wolk4 > 1100){
    xje4 = random (0,650);
    wolk4 = -100;
  }
  if (wolk5 > 1100){
    xje5 = random (0,650);
    wolk5 = -100;
  }
 
}

void vallendHart () {

img = loadImage("hart.png");
image(img, xhart ,vallendHart); 

vallendHart=vallendHart+speed;
 
  if (vallendHart > 1100){
    xhart = random (0,650);
    vallendHart = -100;
  }

// collision
  if (xhart <mouseX+60 && xhart > mouseX-60 && vallendHart > heartcollision && vallendHart < 850) {
    vallendHart=-20;
    xhart = random(20,680);
    teller++;
  }

}  

void teller(){
  
  fill(#e52247);
  textSize(24);
  text("Hearts:", 11, 40);
  text(teller, 100, 40);
 
  
}

void levels(){
  
  if(teller == 10){
    speed=16;  
  }
  
  if (teller ==30 ){
    speed = 24;
  }
  
  if(teller ==60){
    speed = 32;
  }
  
   if(teller ==100){
    speed = 40;
  }
  
   if(teller ==150){
    speed = 50;
  }
  
}

void youwon () {
 
 if(monsterY <-200){
 img = loadImage("youwon.png");
 image(img, 0,0); }
  
}

void buttercup () {
  
//haar zwart */ 
noStroke ();
fill (0);
ellipse (monsterX-69,monsterY-88,180,210);
 
//benen zwart */
noStroke ();
fill (0);
rect (monsterX+3,monsterY+100,35,40);
 
noStroke ();
fill (0);
ellipse (monsterX+3,monsterY+132,18,18);
 
noStroke ();
fill (0);
ellipse (monsterX+20,monsterY+132,18,18);
 
//benen wit */
noStroke ();
fill (250,250,250);
rect (monsterX+6,monsterY+100,29,36);
 
noStroke ();
fill (250,250,250);
ellipse (monsterX+6,monsterY+128,13,13);
 
noStroke ();
fill (250,250,250);
ellipse (monsterX+22,monsterY+128,13,13);
 
noStroke ();
fill (0);
rect (monsterX+6,monsterY+135,29,2);
 
noStroke ();
fill (0);
rect (monsterX+19,monsterY+100,4,36);
 
//jurk */
stroke (0);
fill (89,180,23);
rect (monsterX,monsterY+30,40,70);
 
noStroke ();
fill (0);
rect (monsterX,monsterY+55,40,20);
 
// armen */
stroke (0);
strokeWeight (3);
fill (253,209,190);
ellipse (monsterX-5,monsterY+40,10,55);
 
stroke (0);
fill (253,209,190);
ellipse (monsterX+35,monsterY+40,10,55);
 
//Hoofd */
stroke (0);
fill (253,209,190);
ellipseMode(CORNER);
ellipse (monsterX-48,monsterY-71,136,120);
 
// haar ponny */
noStroke ();
fill (0);
ellipse (monsterX-49,monsterY-72,139,100);
 
noStroke ();
fill (253,209,190);
rect (monsterX-30,monsterY-22,99,50);
 
//Mond */
noFill();
stroke(0);
ellipse (monsterX+7,monsterY,25,40);
 
noStroke ();
fill (253,209,190);
rect (monsterX,monsterY-16,35,40);
 
//oog wit */
stroke (0);
fill (255,255,255);
ellipse (monsterX-45,monsterY-33,60,60);
 
stroke (0);
fill (255,255,255);
ellipse (monsterX+25,monsterY-33,60,60);
 
//oog groen */
noStroke ();
fill (89,180,23);
ellipse (monsterX-38,monsterY-29,53,53);
 
noStroke ();
fill (89,180,23);
ellipse (monsterX+26,monsterY-29,53,53);
 
//oog zwart */
noStroke ();
fill (0);
ellipse (monsterX-26,monsterY-22,40,40);
 
noStroke ();
fill (0);
ellipse (monsterX+27,monsterY-22,40,40);
 
//oog wit */
noStroke ();
fill (255,255,255);
ellipse (monsterX-12,monsterY-10,17,17);
 
noStroke ();
fill (255,255,255);
ellipse (monsterX+35,monsterY-10,17,17);
 
noStroke ();
fill (0);
rect (monsterX-40,monsterY-33,120,12);
 
//driekhoek ponny */
noStroke ();
fill (253,209,190);
triangle(monsterX+30,monsterY-20,monsterX+20,monsterY-55,monsterX+15,monsterY-20);  
}

void skyline(){
 img = loadImage("skyline.png");
image(img,0,skyline); 
  
 if(teller >29){
  skyline=skyline+20;
 } 
 
 if(teller >29 && monsterY > 700){ 
 monsterY = monsterY-4;
 }
 if(teller >29 && heartcollision >570){
   heartcollision=heartcollision-4;
 }
  if(teller >199){
    monsterY=monsterY-20;
  }
}


