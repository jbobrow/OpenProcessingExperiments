
import ddf.minim.*;//import audio source from Minim
 
Minim minim;
AudioPlayer bgm;
AudioSample audio1;
AudioSample audio2;
AudioSample audio3;
AudioSample audio4;

PImage lcy, crash, bar, house, ele, locust, hktv;
boolean weapon = false;
boolean attack = false;
boolean whouse = false;
boolean welection = false;
boolean wlocust = false;
boolean whktv = false;

//for CY's movement
float lcyx = 2;
int xspeed = 20;
float lcyy = 2;
int yspeed = 20;

void setup(){
  size(600, 600);
  frameRate(10);
  
//load images
lcy = loadImage("image/lcy.png");
crash = loadImage("image/crash.png");
bar = loadImage("image/bar.png");
house = loadImage("image/house.png");
ele = loadImage("image/ele.png");
locust = loadImage("image/locust.png");
hktv = loadImage("image/hktv.png");

//audio setting
  minim = new Minim(this);
  audio1 = minim.loadSample("audio/1.mp3");
  audio2 = minim.loadSample("audio/2.mp3");
  audio3 = minim.loadSample("audio/3.mp3");
  audio4 = minim.loadSample("audio/4.mp3");
  bgm = minim.loadFile("audio/bgm.mp3");
  bgm.loop(); //loop the background music
}

//for key pressed
void keyPressed(){
  //change attack status
  if (key == ' '){
    attack = true;
  }
   //cursors
  if (key == '1'){
    cursor(house, 0, 0);
    weapon = true;
    whouse = true;
    welection = false;
    wlocust = false;
    whktv = false;
  }
  if (key == '2'){
    cursor(ele, 0, 0);
    weapon = true;
    welection = true;
    whouse = false;
    wlocust = false;
    whktv = false;
  }
  if (key == '3'){
    cursor(locust, 0, 0);
    weapon = true;
    wlocust = true;
    whouse = false;
    welection = false;
    whktv = false;
  }
  if (key == '4'){
    cursor(hktv, 0, 0);
    weapon = true;
    whktv = true;
    whouse = false;
    wlocust = false;
    welection = false;
  }
}

//for space released
void keyReleased(){
  //change attack status
  if (key == ' '){ 
  attack = false;
  }
}

void draw(){
  background(loadImage("image/bg.jpg"));
  
  //text instruction
  fill(255);
  textSize(24);
  text("1-4 - choose your weapon", 150, 150);
  text("Mouse - move to aim", 150, 180);
  text("Space - attack", 150, 210);
  
  //make CY moves
  lcyx = lcyx+xspeed;
  lcyy = lcyy+yspeed;
  
  image(lcy, lcyx, lcyy);
  
   //change x-coordinates' speed (direction) when image meets border
   if (lcyx>450) {
    xspeed = -20 ;
  }
   if (lcyx<0) {
    xspeed = 20;
  }
   
  //change y-coordinates' speed (direction) when image meets border
   if (lcyy>250) {
    yspeed = -20 ;
   }
   if (lcyy<0) {
    yspeed = 20;
   }
  
  //set the condition for a successful attack on CY
   if ((weapon) && (attack) && ((mouseX >= lcyx+20 && mouseX < lcyx+150) && (mouseY >= lcyy+20 && mouseY <= lcyy+200))) {
     image(crash, mouseX-50, mouseY-50);
   if ((whouse)) {
     audio1.trigger();
   }
   if (welection) {
     audio2.trigger();
   }
   if (whktv) {
     audio3.trigger();
   }
   if (wlocust) {
     audio4.trigger();
   }
   }
   
   //instruction bar
  image(bar, 85, 500);

}

/*sources:
lcy.png - http://www.nsi.hk/2012-ce-election/index.jsp
crash.png - www.i2clipart.com 
locust.jpg - www.enterpr1se.info
house.png - en.wikipedia.org
hktv.png - logos.wikia.com
ele.png - www.hkptu.org
bgm.mp3 - https://www.youtube.com/watch?v=J9KnCduw7xo

reference sites: 
http://www.openprocessing.org/sketch/14921*/

