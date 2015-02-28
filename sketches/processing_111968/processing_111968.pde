
import ddf.minim.*;

Minim minim;
AudioSample bounce;
AudioPlayer bgsound;

float x=100, y=100, e=100, f=100;
float xSpeed= random(2,5);
float ySpeed= random(2,5);
int q=5;
int w=0;
boolean flag = true;
boolean pt = true;
PImage img;
void setup(){

size(300,300);
noStroke();
noCursor();
img = loadImage("red_skull.jpg");
  minim = new Minim(this);
  bounce = minim.loadSample("don.wav");
  bgsound = minim.loadFile("bgm2.mp3");
  bgsound.loop();
}

void draw(){
  fill(0,40);  
  rect(0,0,width,height);
  for (int i = 0; i < 300; i++) {
  float r = random(300);
  float a = random(255);
  float b = random(255);
  float c = random(255);
  fill(a,b,c,150);
  ellipse(r,i, 10, 10);
}
  fill(255);
  ellipse(x,y,10,10);
textSize(12);  
  text("10 points for an extra life",50,20);
  x= x+xSpeed;
  y= y+ySpeed;
  
  
  if(w==10){
    w=w*0;
    q++;
  }  

 if (x>width-5||x<5){
    xSpeed = -xSpeed;
    bounce.trigger();
  }
  
  if(y>width-5||y<5){
    ySpeed = -ySpeed;
    bounce.trigger();
  }
  fill(255);
  rect(mouseX,270,40,5);
  if ((x <= mouseX+40 && x>= mouseX)&&(y>=270)){
    ySpeed = -ySpeed;
}
 if ((x <= mouseX+40 && x>= mouseX)&&(y>=270)){
    if(pt){
      w++;
      pt = false;
    }
 }
 else{
   pt = true;
 } 
  textSize(20);
  text("Points="+w,90,80);
  
  if ((y>275)&&(q>-1)){    
    if (flag){
      q--;
      flag = false;
    }
  }else {
    flag = true;
  }
  textSize(30);
  if(q<3){
    fill(255,0,0);
    text("life="+q,90,50);
    
  float k = random(300);
  float l = random(300);
  fill(255,0,0);
  textSize(20);
  text("Danger!",k,l);
  text("Danger!",l,k);
}
  else{
    fill(255);
    text("life="+q,90,50);
  }
   if (q ==0){
    image(img, 0,0,300,300);
  
  for (int u = 0; u < 300; u++) {
  float s = random(300);
  fill(255,0,0,80);
  ellipse(u,s, 10, 10);  
}
    fill(255);
    textSize(20);
    text("Game Over!",80,150);
minim.stop();
stop();  
}
}


