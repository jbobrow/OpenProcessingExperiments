
PFont txt;
float twitch = 0;
float sevenP = 0;
float square = 0;
float speed = 1;

void setup() {
  size(250,250);
  smooth();
  txt = loadFont("Impact-48.vlw");
  frameRate(24);
}

void draw() {
  textMode(CENTER);
  rectMode(CENTER);
  fill(0,15);
  noStroke();
  rect(width/2,height/2,width,height);
  
  
 for(int i=0; i<250; i+=10)
 for(int f=0; f<250; f+=10){
    
    stroke(255);
    strokeWeight(2+(i/100));
    point(i,f);
    
    fill(#43ad55,90);
    textFont(txt,90);
    text("R9",i*10,(f*10)+twitch*5);
  }
  
  fill(255,99);
  for (int i=0; i<250; i+=60){
  textFont(txt,-20);
  text("L7P3R9",60+i,55);
  textFont(txt,20);
  text("9R3P7L",195,90+(i/3));
  }

  fill(250+(twitch*30),0,0);
  textFont(txt,60);
  text("L7",0+twitch*10,50);
  twitch=random(-.3,.3);
  
  fill(255,200,0);
  textFont(txt,80);
  text("P3",width/2-20,height/2+40);
  
  fill(0,0,50,50);
  text("R9",random(width),random(height));
  
  noStroke();
  fill(#ffb026,99);
  rect(50,100,100,100);
  
  fill(#473f8f,99);
  textFont(txt,200);
  text("7P",sevenP,300);
if (sevenP>250) {sevenP=-250;}
sevenP+=2;

stroke(#62defd,50);
strokeWeight(30+twitch*100);
line(170,0,170,250);

fill(#ff2390,95);
noStroke();
rect(175,square,50,70);
if (square>125 || square<0) {speed*=-1;}
square+=speed+(twitch*4);
 
}


