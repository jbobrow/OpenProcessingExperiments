
PFont cursive;
PFont cracked;
PImage myImage;
float x;
float xspeed=+1;
float y = 0;
float yspeed=+1;

void setup() {
    background(0,150,200);
   size(600,600);
     cursive= loadFont("cursiveyfont-72.vlw");
     cracked=loadFont("Cracked-48.vlw");
     myImage=loadImage("IM-SO-JELLY.jpg");
     x= random(600);
     y= random(600);
     xspeed= 8;
     yspeed= 8;
   }
   
void draw(){
  background(0,150,200);
  tint(255,255,255,100);
  image(myImage,x,y,300,300);
  
    if ( x>= 600-100){
xspeed=xspeed*-1;
  }
  
if (x<=0+100){
xspeed=xspeed*-1;
  } 
if ( y>= 600-100){
yspeed=yspeed*-1;
  }
if (y<=0+100){
yspeed=yspeed*-1;
  }
  
  x=x+xspeed;
  y=y+yspeed;
  
  fill(0,255,0);
  textFont(cursive);
  text("You Jealous?",200,250);
  
  fill(255);
  textFont(cracked);
  text("NO!", mouseX, mouseY);
}



