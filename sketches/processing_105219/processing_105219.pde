
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer song;
AudioPlayer song2;*/
int x=0;
int y=0;
int speed=10;
float r=random(200);
float t=random(150);
float u=random(100);
void setup() {
size(1000, 1000);
//minim = new Minim(this);
//song=minim.loadFile("Evil_laugh_Male_9-Himan-1598312646.mp3");
//minim = new Minim(this);
//song2=minim.loadFile("Countdown-Me-728881159 3.mp3");
 // song2.play();
}
void draw(){
background(0, 255, 255);
textSize(30);
text("Press down or right to start but wait for the countdown to start",50,450);
fill(255, 0, 0);
    if (key==CODED) {
    if (keyCode==LEFT) {
      startpage();
      fill(t, r, u);
      rect(x=x-speed, y, 100, 100);
      fill(255, 0, 0);
      rect(x=x-speed, y,100, 100); 
      fill(0, 255, 0);
      rect(x=x-speed, y, 100, 100);
      fill(0, 0, 255);
      rect(x=x-speed, y, 100, 100);
      if (x<0) {
        x=0;
        deathpage();
      }
    }
    else if (keyCode==RIGHT) {
       startpage();
      fill(r, t, u);
      rect(x=x+speed, y, 100, 100);
      fill(0, 255, 0);
      rect(x=x+speed, y, 100, 100);
      fill(0, 0, 255);
      rect(x=x+speed, y, 100, 100);
      fill(255, 0, 0);
      rect(x=x+speed, y, 100, 100);
      if (x>960) {
        x=960;
        deathpage();
      }
    }
    else if (keyCode==UP) {
       startpage();
      fill(t, u, r);  
      rect(x, y=y-speed, 100, 100);
      fill(255, 0, 0);
      rect(x, y=y-speed, 100, 100);
      fill(0, 255, 0);
      rect(x, y=y-speed, 100, 100);
      fill(0, 0, 255);
      rect(x, y=y-speed, 100, 100);
      if (y<0) {  
        y=0;
        deathpage();
      }
    }
    else if (keyCode==DOWN) {
   startpage();
      fill(r, u, t);
      rect(x, y=y+speed, 100,100);
      fill(255, 0, 0);
      rect(x, y=y+speed, 100, 100);
      fill(0, 255, 0);
      rect(x, y=y+speed, 100, 100);
      fill(0, 0, 255);
      rect(x, y=y+speed, 100, 100);
      if (y>940) {
        y=940;
        deathpage();
      }
    }
  }
}
void deathpage() {
  background(255, 0, 0);
  fill(0, 0, 0);
  textSize(50);
  text("YOU FAILED", 350, 300);
  textSize(35);
  text("Refresh to restart", 300, 450);
 // song.play();
  noLoop();
}

void startpage() {
  background(0, 0, 0);
text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,300);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,350);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,400);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,450);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,500);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,550);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,600);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,650);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,700);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,750);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,800);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,850);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,900);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,950);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,1000);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,1050);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,1100);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,250);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,200);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,150);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,100);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,50);
  text("EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH EUUGHHHHHHH",0,0);
} 


