
///final project putting all 
///coursera by Mohamed D. Tarek 



//imports for minim
import ddf.minim.*;

//Declare globals -Background image- snow - gift- variables for snow and santa x and y 
int cX;
int cY;
int rX=0;
int rY=0;
int life=10;
int pre=0;

int r2;
int rx2;
int r3;
int rx3;
int r4;
int rx4;
int r5;
int rx5;
String gamestat="";
PImage bg;
PImage santa;
PImage snow;
PImage p1;
PImage p2;
PImage p3;
PImage p4;
PImage p5;
Minim minim;
Minim minim1;
Minim minim2;
AudioPlayer bgplayer;
AudioSample hit;
AudioSample gift;

void setup() {
  size(800, 600);
  cX=width/2;//santa start x
  cY=height-120;//santa start y above trees
  bg=loadImage("bg.jpg");//loading the background
  snow=loadImage("snow.png");//snow
  santa=loadImage("santa.png");//snta image
  p1=loadImage("p1.png");//presents images 
  p2=loadImage("p2.png");
  p3=loadImage("p3.png");
  p4=loadImage("p4.png");
  p5=loadImage("p5.png");
  //load minim and files and play the background song with loop and fire the events sounds 
  minim = new Minim(this);
  minim1 = new Minim(this);
  minim2 = new Minim(this);
  bgplayer=minim.loadFile("bgmusic.mp3");
  hit=minim1.loadSample("hit.mp3");
  gift=minim2.loadSample("gift.mp3");
  bgplayer.play();
  bgplayer.loop();
}


void draw() {
  textSize(60);
  fill(0);
  
   //always palay when lifes is more than or = to 0 
    if (life>0)
    {
      //redraw snow when reach eadgeand give x new value and the same for the gifts 
      if (rY>=height) {
        rY=0;
        rX = (int)random(width/5)*5;
      }
     
      if (r2>=height) {
        r2=0;
        rx2 = (int)random(width/5)*5;
      }
      if (r3>=height) {
        r3=0;
        rx3 = (int)random(width/5)*5;
      }
      if (r4>=height) {
        r4=0;
        rx4 = (int)random(width/5)*5;
      }

      if (r5>=height) {
        r5=0;
        rx5 = (int)random(width/5)*5;
      }
      //draw back ground evry loop to cover the old snow ,santa and gifts  with the new x-y
      background(bg);
      image(santa, cX, cY);
      image(snow, rX, rY);

      image(p2, rx2, r2);
      image(p3, rx3, r3);
      image(p4, rx4, r4);
      image(p5, rx5, r5);
      text("Life: "+life, 200, 50);
      text("Gifts: "+pre, 500, 50);
      if (((rX-65<=cX)&&(cX<=rX+30))&&(rY==height-160)) {
        hit.trigger();
        rX=0;
        life--;
      }
      
      if (((rx2-65<=cX)&&(cX<=rx2+30))&&(r2==height-160)) {
        gift.trigger();
        r2=0;
        pre++;
      }
      if (((rx3-65<=cX)&&(cX<=rx3+30))&&(r3==height-160)) {
        gift.trigger();
        r3=0;
        pre++;
      }
      if (((rx4-65<=cX)&&(cX<=rx4+30))&&(r4==height-160)) {
        gift.trigger();
        r4=0;
        pre++;
      }
      if (((rx5-65<=cX)&&(cX<=rx5+30))&&(r5==height-160)) {
        gift.trigger();
        r5=0;
        pre++;
      }
//defrant speed for opjects 
      rY+=5;
      r2+=4;
      r3+=2;
      r4+=1;
      r5+=2;
    }
    else text("Game over press n",150,300);
}



//when right or left pressed xand y of sanra change 
//n is new game

void keyPressed() {
  if (key == 'n' || key == 'N') {
    life=10;
    pre=0;
    println("n");
    draw();
    }
  if (keyCode == RIGHT) {
    if (cX<width-75) {
      cX=cX+5;
      image(santa, cX, cY);
    }
  }
  else if (keyCode == LEFT) {
    if (cX>0) {
      cX=cX-5;
      image(santa, cX, cY);
    }
   
  }
}


