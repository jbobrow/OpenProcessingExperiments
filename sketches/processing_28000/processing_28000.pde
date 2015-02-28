
import processing.opengl.*;

/* below is the sound library import */
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

/* declaring variables */

Minim minim;
Minim minim2;
Minim minim3;
Minim minim4;
AudioPlayer playerRain;
AudioPlayer playerTorch;
AudioPlayer playerDrip;
AudioPlayer playerRow;
PImage a;

int q=0; //representing colour change
int e=0;  // timer/size variables for drip
int f=0;
int dripX=0;
int dripY=0;
int countsound=0;

float angle = PI;
float pos = 100;
float gap = 12.0; /* any lower and the screen jumps */


void setup() {

  size(500,500, P3D);
  textMode(SCREEN);
  lights();
  frameRate(50);

  a = loadImage("newboat.png");
  image(a, 50, 0);
  a.resize(500,150);
  


  minim = new Minim(this);
  playerRain = minim.loadFile("wetcavesoft.wav");
  playerRain.play();
  playerRain.setGain(-15);
  playerRain.loop();
  minim2 = new Minim(this);
  playerTorch = minim2.loadFile("torch.wav");
  minim3 = new Minim(this);
  playerDrip = minim3.loadFile("Drip.wav");
  playerDrip.setGain(1);
  minim4 = new Minim(this);
  playerRow = minim.loadFile("Row1.wav");
  playerRow.setGain(-20);
  

  
} 
void draw() {
  background(28,11,11, 60); /* dark brown background */

  image(a,0,400);
  if(mouseX>0 && mouseX<width && mouseY>0 && mouseY<200){
    tint(33,31,28,80);
    //playerTorch.play();
   // playerTorch.setGain(-20);
  }
   if(mouseX>0 && mouseX<width && mouseY>200 && mouseY<250){
  tint(224, 133, 14, 20);
   //  playerTorch.play();
  //  playerTorch.setGain(-18); 
  }
  else if(mouseX>0 && mouseX<width && mouseY>250 && mouseY<300){
  tint(224, 133, 14, 40); 
   //   playerTorch.play();
   // playerTorch.setGain(-15);
  }
  else if(mouseX>20 && mouseX<480 && mouseY>300 && mouseY<350){
  tint(224, 133, 14, 60); 
    //  playerTorch.play();
   // playerTorch.setGain(-12);
  }
  else if(mouseX>20 && mouseX<480 && mouseY>350 && mouseY<370){
  tint(224, 133, 14, 70); 
    //  playerTorch.play();
//playerTorch.setGain(-10);
  }
  else if(mouseX>20 && mouseX<480 && mouseY>370 && mouseY<390){
  tint(224, 133, 14, 80);
   //  playerTorch.play(1);
   // playerTorch.setGain(-8); 
  }
  else if(mouseX>20 && mouseX<480 && mouseY>390 && mouseY<410){
  tint(224, 133, 14, 90); 
      //playerTorch.play();
    //playerTorch.setGain(-6);
  }
  else if(mouseX>20 && mouseX<480 && mouseY>410 && mouseY<430){
  tint(224, 133, 14, 100); 
      //playerTorch.play();
    //playerTorch.setGain(-3);
  }
  else if(mouseX>20 && mouseX<480 && mouseY>430 && mouseY<450){
  tint(224, 133, 14, 110); 
//playerTorch.play();
    //playerTorch.setGain(1);
  }
  else if(mouseX>20 && mouseX<480 && mouseY>450 && mouseY<470){
  tint(224, 133, 14, 110); 
      //playerTorch.play();
   // playerTorch.setGain(3);
  }  

  if(mouseX>20 && mouseX<480 && mouseY>470 && mouseY<500 && countsound<=5){
  tint(224, 133, 14, 110); 
      playerTorch.play();
    countsound++;
  }
  

  cursor(CROSS);
  
  //flame @ mouseCurser
  noStroke();
  fill(232,212,140,random(0,3));
  ellipse(mouseX,mouseY, 200,200);
  fill(214,84,2,random(3,5));
  ellipse(mouseX,mouseY, 180,180);
  fill(227,130,2,random(5,10));
  ellipse(mouseX,mouseY, 150,150);
  fill(149,101,71,random(10,15));
  ellipse(mouseX,mouseY, 120,120);
  fill(162,69,11,random(15,50));
  ellipse(mouseX, mouseY, 100,100);
  ellipse(mouseX,mouseY,30,random(20,80));
    ellipse(mouseX-10,mouseY,10,random(0,70));
      ellipse(mouseX+10,mouseY,10,random(0,70));
      ellipse(mouseX,mouseY,10,random(20,120));
      ellipse(mouseX-5,mouseY,10,random(20,90));
      ellipse(mouseX-10,mouseY,10,random(0,70));
      ellipse(mouseX+10,mouseY,10,random(0,70));
      ellipse(mouseX+5,mouseY,10,random(20,90));
      ellipse(mouseX,mouseY,10,random(20,100));

//fire flies @ light
  fill(252,226,23);
  ellipse(mouseX+(random(10,40)),mouseY+(random(10,100)), 2,2);
  ellipse(mouseX+(random(40,100)),mouseY+(random(10,100)), 2,2);
  ellipse(mouseX+(random(40,100)),mouseY+(random(0,30)), 2,2);
  ellipse(mouseX+(random(40,100)),mouseY+(random(50,80)), 2,2);
  ellipse(mouseX-(random(10,40)),mouseY-(random(10,50)), 2,2);
  fill(187,250,101);
  ellipse(mouseX+(random(10,80)),mouseY-(random(10,50)), 3,3);
  ellipse(mouseX-(random(10,40)),mouseY+(random(10,70)), 3,3);
  ellipse(mouseX+(random(10,30)),mouseY+(random(10,100)), 5,5);
  ellipse(mouseX-(random(0,100)),mouseY-(random(0,120)), 2,2);
  fill(222,242,193);
  ellipse(mouseX-(random(10,40)),mouseY-(random(10,50)), 5,5);
  ellipse(mouseX+(random(10,80)),mouseY-(random(10,50)), 1,1);
  ellipse(mouseX-(random(10,40)),mouseY+(random(10,70)), 5,5);

  //handle cone
  stroke(85,21,21);
  for(int i=-20;i<20;i++)
    line(mouseX+i,mouseY, mouseX, mouseY+80);  

//water droplet ringlet
  if(f<150 && e<150) {
    stroke(0,random(100,255),random(0,100), 80-q);
    noFill();
    ellipse(dripX, dripY , 10+e, 5+(e*0.5));
    e+=10;
    f+=10;
  }

//variable below is used in future
  int cnt = 100; 
  // ceiling
  translate(width * 0.5, 1.8* height, height*3); /* this is where the image prints itself on the screen (how high) */
  rotateX(-.1); /* changes the angle the ceiling is moving at. lower number is better in my case */
  rotateY(angle); /* don't change this, as it keeps the camera facing forward rather than sideways. User can change this though */

  pos = pos + gap;
  noFill();
  for (float z = -cnt; z<cnt; z = z+1) {
    for (float x = -cnt; x<cnt; x = x+1) {
      float expX = x*gap;
      float expZ = z*gap;
      float expY = noise((expX+1000)*.01, (expZ-pos)*.01)*600;
      float sqY = expY*expY-(expX*expX+expZ*expZ)/gap;

      stroke(sqY*.002,sqY*.004,sqY*.001);
      point(expX,-expY,expZ);
    }
  }

  //reflection
  translate(width * 0.2, -1.2* height, -height*1); /* this is where the image prints itself on the screen (how high) */
  rotateX(-0.2); /* changes the angle the ceiling is moving at. lower number is better in my case */
  rotateY(angle); /* don't change this, as it keeps the camera facing forward rather than sideways. User can change this though */
  noFill();
  for (float zz = -cnt; zz<cnt; zz = zz+20)
    for (float xx = -cnt; xx<cnt; xx = xx+1) {

      float expXX = xx*gap;
      float expZZ = zz*gap;
      float expYY = noise((expXX+1000)*.01, (expZZ-pos)*.01)*600;
      float sqYY = expYY*expYY-(expXX*expXX+expZZ*expZZ)/gap;

      stroke(sqYY*.002,sqYY*.004,sqYY*.001);
      point(expXX,-expYY,expZZ);
    }
}


void mouseClicked() {

  if(mouseButton == RIGHT) {
    if(pmouseX >0 && pmouseX < width && pmouseY>=260) {
      playerDrip.loop(0);
      if(mouseY>260 && mouseY<320) {
        playerDrip.setGain(-6);
        q=60;
      }
      if(mouseY>320 && mouseY<400) {
        playerDrip.setGain(4);
        q=20;
      }
      if(mouseY>400 && mouseY<500) {
        playerDrip.setGain(18);
        q=0;
      }
      e=0;
      f=0;
      dripX = mouseX;  // copy values, not references
      dripY = mouseY;
    }
    else if(pmouseX >= 250 && pmouseY>=260) {
      playerDrip.loop(0);
      if(mouseY>260 && mouseY<320) {
        playerDrip.setGain(-6);
      }
      if(mouseY>320 && mouseY<400) {
        playerDrip.setGain(4);
      }
      if(mouseY>400 && mouseY<500) {
        playerDrip.setGain(18);
      }
    }
    }
  }


  void keyPressed() {
    if (key == 'a' || key == 'A') { 
      angle = angle - PI/100;
      playerRow.loop(0);
      /* QUARTER_PI stands for quarter circle rotation movement in this case */
    }
    if (key == 'd' || key == 'D') { 
      angle = angle + PI/100;
      playerRow.loop(0);
    }
  }
  








