


/*@pjs preload="apple_white.png, d315ccf1.gif";*/
int c;
int d;
int e;
int f;
int g;
PImage img;
int speed = 5;
int x =0;
//basic information

void setup(){
  size(450,450);
  colorMode(HSB,360,100,100);
  background(random(0,255),44,92);
  noStroke();
  smooth();
  c = 0;
  
//back color

colorMode(RGB,255,255,255);

PFont font;
PFont myFont = loadFont("MyanmarText-48.vlw");
fill(119,114,114);
textFont(myFont);
textSize(48);
//language
frameRate(30);
}

void draw(){
 for(int i=0; i<450; i+=60){
 for(int a=0; a<450; a+=20){
 img = loadImage("apple_white.png");
 image(img,i,a,15,15);
 colorMode(HSB,360,100,100);
 tint(random(0,360),23,96);
 colorMode(RGB,255,255,255);
 x = x +speed;
  }
  }
  
 img = loadImage("apple_white.png");
 tint(255,255,255,c); 
 image(img,-70,100,210,250);
 text("A",40,250);
//A
//picture Apple white

img = loadImage("apple_white.png");
tint(255, 255, 0,d); 
image(img,30,130,210,250);
text("p",140,280);
//p
//picture Apple yellow

img = loadImage("apple_white.png");
tint(255, 20, 147,e); 
image(img,100,160,210,250);
text("p",220,310);
//p
//picture Apple red

img = loadImage("apple_white.png");
tint(30, 144, 255,f);
image(img,180,200,210,250);
text("l",300,340);
//l
//picture blue

text("e",370,370);
img = loadImage("d315ccf1.gif");
tint(0, 0, 0,g);
image(img,280,220,210,250);
//e
//picture Apple black


}

void mouseMoved() {  
  c += 50;
  if(c > 255) {
    c = 255;
  }
//white
 d += 50;
  if(d > 255) {
    d = 255;
  }
//yellow
  e += 50;
  if(e > 255) {
    e = 255;
  }
//red
 f += 50;
  if(f > 255) {
    f = 255;
  }
//blue  
  g += 50;
  if(g > 255) {
    g = 255;
  }
//black

}

void mousePressed(){   
  c -= 50;
  if(c <0) {
    c = 0;
  }
//white
 d -= 50;
  if(d <0) {
    d = 0;
  }
//yellow  
  e -= 50;
  if(e <0) {
    e = 0;
  }
//red
 f -= 50;
  if(f <0) {
    f = 0;
  }
//blue  
  g -= 50;
  if(g <0) {
    g = 0;
  }
//black

}




 
  
  
  


