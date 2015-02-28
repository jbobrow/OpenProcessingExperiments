
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
AudioPlayer song;
AudioInput input;

void setup() {
size(1024,768);
background(0);
noStroke();

}


  int tax = 15;
  int tbx = 25;
  int tcx = 35;
  int tdx = 45;
  int tex = 55;
  int tay = 1000;
  int tby = 1000;
  int tcy = 1000;
  int tdy = 1000;
  int tey = 1000;
  
    float shipy = 100;
  float shipx = 100;
  float shipz = 5;
  float basZ = random (100);
  float basX = random (1024);
  float basY = random (768);
  int kills = 0;
  int enemysize = 20;
  boolean gameover = false;
  boolean started = false;
void draw() {
  


if (started == false)
{
  PImage b;
b = loadImage("sb23.gif");
image(b, 250, 200);
if (keyPressed == true){
  started = true;
  background (0);
  minim = new Minim(this);
  song = minim.loadFile("song.mp3");
  song.play();
}
}
  if (started == true){
  loop();
 
  float bga = random(255);
  float bgb = random(255);
  float bgc = random(255);

  String sga = str(bga);
  String sgb = str(bgb);
  String sgc = str(bgc);
  String mx = str(mouseX);
  String my = str(mouseY);

  //background (0,0,0);
  PFont font;
font = loadFont ("Umpush-48.vlw");  
fill(bga,bgb,bgc);
  textFont(font,10);
  text (sga, tay, tax);
  text (sgb, tby, tbx);
  text (sgc, tcy, tcx);
  text (mx, tdy, tdx);
  text (my, tey, tex);
  
if((tex<760)&& (tey>=1000)){
  tax++;
  tbx++;
  tcx++;
  tdx++;
  tex++;
}
//tex will be 760, tey will be 1000

if((tex>=760) && (tey>=2)){
  tay--;
  tby--;
  tcy--;
  tdy--;
  tey--;
}
//tex will be 760, tey will be 1...
if((tex>=55) && (tey<=2)){
  //ghettojediswag
  tax--;
  tbx--;
  tcx--;
  tdx--;
  tex--;
}
//tex will be 1, tey will be 1
if((tex==55) && (tey<1000)){
  //More ghetto jedi code.
  tay++;
  tby++;
  tcy++;
  tdy++;
  tey++;
}

if (gameover){ 
  noLoop();
  text ("YOU SUCK GAME OVER", 400, 400, 50);
}
  

    if (keyCode == UP) {
      shipx--;
    }
    if (keyCode == DOWN) {
      shipx++;
    } 
    if (keyCode == LEFT) {
      shipy--;
    }
    if (keyCode == RIGHT) {
      shipy++;
   
  } 
    if (keyCode == SHIFT){
      shipz++;
    }
    if (keyCode == CONTROL){
      shipz--;
    }
  String bx = str(basX);
  String by = str(basY);
  String sx = str(shipy);
  String sy = str(shipx);

   if ((shipy>basX-20)&&(shipy<basX+20)&&(shipx>basY-20)&&(shipx<basY+20)&&(shipz>basZ-10)&&(shipz<basZ+10)&&(kills==0)){
     
     text("Looks like you're a shit in my wound, mortal", basX, basY);
     basX = random(1024);
     basY = random (768);
     basZ = random (100);
     kills++;
     enemysize = 15;
   }
   
      if ((shipy>basX-15)&&(shipy<basX+15)&&(shipx>basY-15)&&(shipx<basY+15)&&(shipz>basZ-10)&&(shipz<basZ+10)&&(kills==1)){
     
     text("THIS QUADRENT IS BEING SURROUNDED BY THE TEVATRON YOU WILL NOT SURVIVE", basX, basY);
     basX = random(1024);
     basY = random (768);
     basZ = random (100);
     kills++;
     enemysize = 10;
   }

      if ((shipy>basX-10)&&(shipy<basX+10)&&(shipx>basY-10)&&(shipx<basY+10)&&(shipz>basZ-10)&&(shipz<basZ+10)&&(kills==2)){
     
     text("YOU ARE A SPACE BASTARD AND WILL NEVER AGAIN DEFEAT MY TELEPORTER ARRAY", basX, basY);
     basX = random(1024);
     basY = random (768);
     basZ = random (100);
     kills++;
     enemysize = 5;
   }
   
         if ((shipy>basX-10)&&(shipy<basX+10)&&(shipx>basY-10)&&(shipx<basY+10)&&(shipz>basZ-10)&&(shipz<basZ+10)&&(kills==3)){
     
     text("I WILL PISS ON YOUR GRAVE", basX, basY);
     basX = random(1024);
     basY = random (768);
     basZ = random (100);
     kills++;
     enemysize--;
   }
         if ((shipy>basX-5)&&(shipy<basX+5)&&(shipx>basY-5)&&(shipx<basY+5)&&(shipz>basZ-10)&&(shipz<basZ+10)&&(kills==4)){
     
     text("Seriously bro lets talk about this for just a second.", basX, basY);
     basX = random(1024);
     basY = random (768);
     basZ = random (100);
     kills++;
     enemysize--;

         }
               if ((shipy>basX-10)&&(shipy<basX+10)&&(shipx>basY-10)&&(shipx<basY+10)&&(shipz>basZ-10)&&(shipz<basZ+10)&&(kills==5)){
     
     text("LUKE I AM YOUR FATHER", basX, basY);
     basX = random(1024);
     basY = random (768);
     basZ = random (100);
     kills++;
     enemysize--;
   }
         if ((shipy>basX-10)&&(shipy<basX+10)&&(shipx>basY-10)&&(shipx<basY+10)&&(shipz>basZ-10)&&(shipz<basZ+10)&&(kills==6)){
     
     text("THAT WOULD BE TRUE IF SPACE BASTARDS HAD FATHERS", basX, basY);
     basY=basY-4;
     text("THAT WOULD BE TRUE IF SPACE BASTARDS HAD FATHERS", basX, basY);
     basY=basY-4;
     text("THAT WOULD BE TRUE IF SPACE BASTARDS HAD FATHERS", basX, basY);
     basY=basY-4;
     text("THAT WOULD BE TRUE IF SPACE BASTARDS HAD FATHERS", basX, basY);
     basY=basY-4;
     text("THAT WOULD BE TRUE IF SPACE BASTARDS HAD FATHERS", basX, basY);
    basY=basY-4;
     text("THAT WOULD BE TRUE IF SPACE BASTARDS HAD FATHERS", basX, basY);
    basY=basY-4;
     text("THAT WOULD BE TRUE IF SPACE BASTARDS HAD FATHERS", basX, basY);
    basY=basY-4;
     text("THAT WOULD BE TRUE IF SPACE BASTARDS HAD FATHERS", basX, basY);
     basY=basY-4;
     text("THAT WOULD BE TRUE IF SPACE BASTARDS HAD FATHERS", basX, basY);
    basY=basY-4;
     text("THAT WOULD BE TRUE IF SPACE BASTARDS HAD FATHERS", basX, basY);
    basY=basY-4;
     text("THAT WOULD BE TRUE IF SPACE BASTARDS HAD FATHERS", basX, basY);
   basY=basY-4;
     text("THAT WOULD BE TRUE IF SPACE BASTARDS HAD FATHERS", basX, basY);
  basY=basY-4;
     
     
     
     basX = random(1024);
     basY = random (768);
     kills++;
     enemysize--;
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     background(bga,bgb,bgc);
     gameover = true;
   }
   float aurasize = random(shipz*2);
   
   float rca = random(255);
   float rcb = random(255);
   float rcc = random(255);
   float rcd = random(255);
   
ellipse(shipy,shipx,shipz,shipz);

fill(rca,rcb,rcc,10);
ellipse(shipy,shipx,aurasize,aurasize);
blend(1000, 1000, 33, 100, 67, 0, 33, 100, DIFFERENCE);

//handles the enemy ship and its movement.

float movrand = random (100);
if ((movrand>0)&&(movrand<25)){
  basX++;
}
if ((movrand>25)&&(movrand<50)){
  basX--;
}
if ((movrand>50)&&(movrand<75)){
  basY++;
}
if (movrand>75){
  basY--;
}
if (basX>1000){
  basX = random(1000);
}
if (basX<20){
  basX = random(1000);
}
if (basY>750){
  basY = random(750);
}
if (basY<20){
  basY = random(750);
}
ellipse (basX,basY, basZ, basZ);
text (bx, basX,basY);
text (by, basX,basY-10);


  }
  
}
  void stop()
{
// the AudioPlayer you got from Minim.loadFile()
player.close();
// the AudioInput you got from Minim.getLineIn()
input.close();
minim.stop();

// this calls the stop method that
// you are overriding by defining your own
// it must be called so that your application
// can do all the cleanup it would normally do
super.stop();
}




//size(100, 100, P3D);
//PFont font;
//font = loadFont("FFScala-32.vlw"); 
//textFont(font); 
//text("word", 15, 60, -30); 
//fill(0, 102, 153);
//text("word", 15, 60);

//(Code that is cool and I want to use)
//fill(255,0,0,63);
//rect(mouseX,150,200,40);

