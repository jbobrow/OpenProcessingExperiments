
//Konkuk univercity assignment 200415141 Moon sae byeok
PImage a,b,c,d,e;
PFont f1;
PFont f2;
void setup() {
size(600,600); 
stroke(50);
smooth();
f1 = loadFont("Aharoni-Bold-13.vlw");
f2 = loadFont("Arial-Black-13.vlw");
//wan_image
a=loadImage("wan_1.png");
b=loadImage("wan_2.png");
c=loadImage("wan_3.png");}
void draw(){ background(255);
// grid
strokeWeight(0);
for(int a=0; a<600; a+=10)  { stroke(0); line(a,145,a,150);  }  
for(int b=0; b<600; b+=10)  { stroke(0); line(b,327,b,332);  } 
for(int c=0; c<600; c+=25)  { stroke(0); line(c,440,c,445);  } 
line(0,145,600,145);
line(0,150,600,150);
line(0,327,600,327);
line(0,332,600,332);
line(0,440,600,440);
line(0,445,600,445);
//line
strokeWeight(0);
fill(251,178,50);
strokeWeight(2);
stroke(251,178,50);
line(27,40,575,40);
strokeWeight(8);
stroke(197,32,32);
line(0,575,530,575);
//time 
 float s =map(second(),0,60,0,600);
 float m =map(minute(),0,60,0,600);
 float h =map(hour(),0,24,0,600);
 int x=second();
 int y=minute();
 int z=hour();
//rect move
noStroke();
colorMode(RGB, 255);  
fill(255,158,(7*x));  
rect(0,53,s,92);
fill(255,158,(7*y)); 
rect(0,151,m,176);
fill(255,158,(7*z)); 
rect(0,333,h,107);
//image move
image(a,s,60);
image(b,m,153);
image(c,h,318);
//ellipse
smooth();
strokeWeight(8);
stroke(197,32,32);
fill(255);
ellipse(530,525,100,100);
strokeWeight(2);
stroke(251,178,50);
ellipse(15,39,25,25);
//move ellipse clock 
colorMode(RGB);  
strokeCap(MITER);  
strokeWeight(15);  
stroke(197,32,32);  
arc(530,525,80,80,radians(0-90),radians(x*6-90)); 
stroke(251,178,50);
arc(15,39,10,10,radians(0-90),radians(x*6-90)); 
arc(530,525,40,40,radians(0-90),radians(y*6-90)); 

//digital clock
fill(0);
textFont (f1);
String t =nf(z,2) + ":" + nf(y,2) + ":"+nf(x,2); text(t,512,530);
//Evolution type
textFont (f2);
text("Evolution CLOCK",30,40);
}





