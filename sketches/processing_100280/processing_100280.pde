
//suzanne1, suzanne choi, project2
//this project includes some tweaks of john gruen's video example on blob1.

PImage love;
PImage kiss;
PImage laugh;
PImage poop;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer s1,s2,s3,s4;

import processing.video.*;
Capture v;
color target;
color vColor;
final int DS = 2;
final int THRESH = 100; 
float r,g,b,rT,gT,bT; 
float xPos,yPos,xPosPrev,yPosPrev,xTarget,yTarget,dX,dY;
float x,y;

float hEasing = .2; 
float vEasing = .2; 
float dia = 40;
int xTotal;    
int yTotal;   
int grabTotal; 

final int TQ = 20; 
float[] dxa = new float[TQ]; 
float[] dya = new float[TQ]; 
boolean showImg = true; 
int fc; 
int clickCount; 

void setup() {
  size(800,800);
  v = new Capture(this,800,800,30);
  smooth();
  noStroke();
  minim = new Minim(this);
  s1 = minim.loadFile("iloveyou.wav");
  s2 = minim.loadFile("kiss.wav");
  s3 = minim.loadFile("hehe.wav");
  s4 = minim.loadFile("poop.wav");
  love = loadImage("iloveyou.png");
  kiss = loadImage("kiss.png");
  laugh = loadImage("laugh.png");
  poop = loadImage("poop.png");
  x = width/2;
  y = height/2;
  rectMode(CENTER);
}

void draw() {
  v.read(); 
  v.loadPixels();
  if (showImg == true){ image(v,0,0); 
  textSize(20);
  fill(255,98);
  text("click: click rectangle on a color to set track color", width/3,height/2);
  text("click again: reshow image to change the color", (width/3),(height/2)+30);
  text("click again: select a new color", width/3, (height/2)+60);}
  else {background(255);
  textSize(20);
  fill(0,80);
  text("select: select your animal by typing 1 or 2 or 3", (width/3)-80,height/2);
  text("move: move to four circled location to see what happens!", (width/3)-80,(height/2)+30);
 }
  drawlocations();
  trackArray();
  traverseOne(); 
  setBlob(); 
  v.updatePixels();
  play();
}

void drawlocations(){
fill(200);
ellipse(x+x/2,y+y/2, dia,dia);
ellipse(x-x/2,y+y/2, dia,dia);
ellipse(x+x/2,y-y/2, dia,dia);
ellipse(x-x/2,y-y/2, dia,dia);
}

void setBlob() {
dX= xTarget - xPosPrev; //distance btwn  current xTarget and previous x position
dY= yTarget - yPosPrev; // ditto, but for y
noFill();
stroke(200);
strokeWeight(2);
rect(xPos,yPos,dia,dia);
if (key == '1') {
noStroke();
fill(214,200,41);
ellipse(xPos-dia*1.5, yPos-dia*2, dia*2,dia*2);
ellipse(xPos+dia*1.5, yPos-dia*2, dia*2,dia*2);
fill(255);
ellipse(xPos+dia*1.5, yPos-dia*2,dia*1.5,dia*1.5);
ellipse(xPos-dia*1.5, yPos-dia*2,dia*1.5,dia*1.5);
fill(214,200,41);
ellipse(xPos, yPos, dia*5,dia*5);
fill(255);
ellipse(xPos,yPos+10,dia*1.5,dia*1.5);
fill(0);
ellipse(xPos,yPos-10,10,10);
ellipse(xPos-35,yPos-dia,10,10);
ellipse(xPos+35,yPos-dia,10,10);
}

if (key == '3') {
noStroke();

fill(247,180,219);
ellipse(xPos, yPos, dia*5,dia*5);
triangle(xPos-dia*2.1, yPos-dia*2.4,xPos-dia*1.1, yPos-dia*2,xPos-dia*2.3, yPos );
 triangle(xPos+dia*2.1, yPos-dia*2.4,xPos+dia*1.1, yPos-dia*2,xPos+dia*2.3, yPos );
fill(232,117,184);
ellipse(xPos,yPos+10,dia*1.7,dia*1.5);
fill(255);
ellipse(xPos+10,yPos+20,10,10);
ellipse(xPos-10,yPos+20,10,10);
fill(0);
ellipse(xPos-35,yPos-dia,10,10);
ellipse(xPos+35,yPos-dia,10,10);
}
if (key == '2') {
noStroke();
noStroke();
fill(90,55,11);   
ellipse(xPos-dia*1.5, yPos-dia*2, dia*1.5,dia*5);
ellipse(xPos+dia*1.5, yPos-dia*2, dia*1.5,dia*5);
fill(255);
ellipse(xPos-dia*1.5, yPos-dia*2, dia,dia*4.5);
ellipse(xPos+dia*1.5, yPos-dia*2, dia,dia*4.5);
 fill(90,55,11);
ellipse(xPos, yPos, dia*5,dia*5);
fill(255);
ellipse(xPos,yPos+10,dia,dia);
fill(0);
ellipse(xPos,yPos-10,10,10);
ellipse(xPos-35,yPos-dia,10,10);
ellipse(xPos+35,yPos-dia,10,10);
}

float blobMove = dist(xPos,yPos,xPosPrev,yPosPrev); //get distance between current position and prev position
   //if/else changes easing depending on how much the blob has moved
   if (blobMove < 400) {
     hEasing = .8;
     vEasing = .8;
   } else {
    hEasing = .2;
    vEasing = .2; 
   }
   xPos += dX * hEasing; 
   yPos += dY * vEasing; 
   xPosPrev = xPos;
   yPosPrev = yPos;
}

void play(){  
float dist_1 = dist(xPos, yPos, x+x/2, y+y/2 );
float dist_2 = dist(xPos, yPos, x-x/2, y-y/2 );
float dist_3 = dist(xPos, yPos, x+x/2, y-y/2 );
float dist_4 = dist(xPos, yPos, x-x/2, y+y/2 );

if(dist_1 < 60){
   image(poop, x+x/2,y+y/2,100,100);
    s4.play();   
} 
else if (dist_1>60){
   s4.pause();
   s4.rewind();
}
if(dist_2 < 60){
    image(love, x-x/2,y-y/1.2,100,100);
    s1.play();   
} 
else if (dist_2>60){
   s1.pause();
   s1.rewind();
}
if(dist_3 < 60){
    image(kiss, x+x/2,y-y/2,100,100);
    s2.play();   
} 
else if (dist_3>60){
   s2.pause();
   s2.rewind();
}
if(dist_4 < 60){
  textSize(70);  
  text("HA HA HA", x-x/1.8,y+y/3);
    s3.play();   
} 
else if (dist_4>60){
   s3.pause();
   s3.rewind();
}
}

//traverses the array & determines center point of color range
void traverseOne() {
  xTotal = 0;
  yTotal = 0;
  grabTotal = 0;
  for( int x =  1; x < v.width-1; x+=DS){
    for( int y = 1; y < v.height-1; y+=DS){
      int pos = x + y*v.width;
      vColor = v.pixels[pos]; //gets color at downsampled points
      r = red(vColor);
      g = green(vColor);
      b = blue(vColor);
      float diff = dist(r,g,b,rT,gT,bT); //distance btwn each pixel and target color
      if (diff < THRESH) {
        
        
        xTotal+=x; //total x equals cumulative total of x positions within range of the target color
        yTotal+=y; //ditto for y
        grabTotal++; //grabtotal is the total number of pixels that match
      }
      //this next bit says that if any pixels match, we find the average x and average y values
      //otherwise nothing happens and xTarget and yTarget stay the same as in the prev frame
      //this cuts down on jitter
      if (grabTotal > 0) {
        xTarget = xTotal / grabTotal;
        yTarget = yTotal / grabTotal;
      }
    }
  } 
}


void trackArray() {
    dxa[0] = xPos;
    dya[0] = yPos;
    float trackTail;
 for (int i = TQ -1; i>0; i--) {
    
    dxa[i] = dxa[i-1];
    dya[i] = dya[i-1];
    
 }

 for (int i = 0; i < TQ-1; i++) {
    fill(map(i,0,TQ,0,255),50);
    trackTail = map(i,0,TQ,dia,1);
    rect( dxa[i],dya[i],trackTail,trackTail);   
 }

}
//grabs target color and toggles whether bg image shows
void mousePressed(  )
{  
   if (clickCount % 2 == 0) {
   int index = mouseX + mouseY*v.width;
   target = v.pixels[index];
   rT = red(target);
   gT = green(target);
   bT = blue(target);
   //println(target); 
   showImg = false;
   } else {
    showImg = true;
   } 
   clickCount++;
   
}







