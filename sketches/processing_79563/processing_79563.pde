
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/79563*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/78599*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

PFont f;
String message = "YOU";
String messad = "WIN";
PImage[] animation;
Gif loopingGif;
Gif nonLoopingGif;
float x1=216;
float x2=183;
int numFrames = 8;
int frame=0;
int value=0;
PImage[] images = new PImage[numFrames];
PImage[] imagess = new PImage[numFrames];
PImage[] imagesss = new PImage[numFrames];
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage mon;
int b=0;
import ddf.minim.*;
AudioPlayer music; 
Minim minim;
float body=10;
float head=20;
float eye1=26;
float eye2=38;
float ant=30;
float ball=32;
float mouth=24;
float leg1=20;
float leg2=39;
float wing1=17;
float wing2=53;
////////////////////
float bodyY=800;
float headY=775;
float antY=763;
float eyeY=784;
float eye2Y=784;
float ballY=761;
float mouthY=790;
float legY=850;
float wingY=810;
////////////////////

float rocketX=25;
float rocketY=875;
float rocket2X=44;
float rocket2Y=875;
float a=-120;
float monrun=60;
boolean bg1=true;
float transparent=0;
PImage cyberr;
PImage cyberr2;
PImage cyberr3;
PImage cyberr4;
PImage ciber2;
PImage ciber3;
PImage ciber4;
PImage ciber5;
PImage ceber;
PImage ceber2;
PImage ceber3;
PImage ceber4;

void setup() {
  loopingGif = new Gif(this, "space.gif");
  loopingGif.loop();
  f = createFont("Arial",20,true);
  size(500, 1000);
  img=loadImage("cyber.png");
  img2=loadImage("cyber2.png");
  img3=loadImage("cyber3.png");
  img4=loadImage("cyber4.png");
  //////////////////////////////////////
  images[0]  = loadImage("cyberr.png");
  images[1]  = loadImage("cyberr2.png");
  images[2]  = loadImage("cyberr3.png");
  images[3]  = loadImage("cyberr4.png");
  imagess[0] = loadImage("ciber2.png");
  imagess[1] = loadImage("ciber3.png");
  imagess[2] = loadImage("ciber4.png");
  imagess[3] = loadImage("ciber5.png");
  imagesss[0] = loadImage("ceber.png");
  imagesss[1] = loadImage("ceber2.png");
  imagesss[2] = loadImage("ceber3.png");
  imagesss[3] = loadImage("ceber4.png");
  
  
  mon=loadImage("mon.png");
  animation = Gif.getPImages(this, "space.gif");
}
void draw() {

  monrun=monrun-2;




  background(255); 


  if (b==0) {
    
    smooth();
    strokeWeight(0);
    fill(193, 193, 193);
ellipse(wing1, wingY, 40, 10);
ellipse(wing2, wingY, 40, 10);

rect(body, bodyY, 50, 50); //body
fill(193, 193, 193);
rect(head, headY, 25, 25); //head
rect(ant, antY, 5, 12);  //antenna
fill(random(255), 0, 0);
ellipse(eye1, eyeY, 7, 7); //left eye
ellipse(eye2, eye2Y, 7, 7);  //right eye
fill(0, 36, 255);
ellipse(ball, ballY, 12, 12); //ball
fill(random(239), 0, 0);
rect(mouth, mouthY, 17, 6); //mouth
fill(193, 193, 193);
rect(leg1, legY, 10, 25); //leg one
rect(leg2, legY, 10, 25); //leg two
    
    image(mon, 183, monrun);
  }

  if (b==1) {
    image(img, 0, 0);
    wing1=10000;
    wing2=100000;
  }

  if (b==2) {
    image(img2, 0, 0);
    mouth=10000;
  }

  if (b==3) {
    image(img3, 0, 0);
    eye1=1000000;
  }

  if (b==4) {
    mousePressed = false;
    image(img4, 0, 0);
    leg1=100000;
    rocketX=10000;
    body=body+3;
    bodyY=bodyY-.5;
    headY=headY-2;
    antY=antY-2;
    eyeY=eyeY-2;
    eye2Y=eye2Y-2;
    ballY=ballY-2;
    mouthY=mouthY-1;
    leg1=leg1-3;
    leg2=leg2-3;
    legY=legY-.4;
    wingY=wingY-1;
    rocketX=rocketX+.3;
    rocket2X=rocket2X-3;
    rocketY=rocketY-.5;
    rocket2Y=rocket2Y-.5;
  }

  //////ANIMATED BACKGROUND/////////////
  if (b==5) {
    frame=frame+1;
        if (frame>=4) {
      frame=0;
    }
     image(images[frame], 0, 0);
  frameRate(8);

mousePressed=false;
 leg1=100000;
    rocketX=10000;
    body=body+10;
    bodyY=bodyY-.5;
    headY=headY-20;
    antY=antY-20;
    eyeY=eyeY-100000007;
    eye2Y=eye2Y-10000017;
    ballY=ballY-20;
    mouthY=mouthY-17;
    leg1=leg1-3;
    leg2=leg2-3;
    legY=legY-.4;
    wingY=wingY-1;
    rocketX=rocketX+.3;
    rocket2X=rocket2X-3;
    rocketY=rocketY-.5;
    rocket2Y=rocket2Y-.5;

  } 


 if (b==6) {
    frame=frame+1;
        if (frame>=4) {
      frame=0;
    }
     image(imagess[frame], 0, 0);
  frameRate(30);

mousePressed=false;
leg1=100000;
    rocketX=10000;
    body=body+3;
    bodyY=bodyY-.5;
    headY=headY-200000000;
    antY=antY-5;
    eyeY=eyeY-2000000000;
    eye2Y=eye2Y-20000000;
    ballY=ballY-5;
    mouthY=mouthY-1;
    leg1=leg1-3;
    leg2=leg2-3;
    legY=legY-.4;
    wingY=wingY-1;
    rocketX=rocketX+.3;
    rocket2X=rocket2X-3;
    rocketY=rocketY-.5;
    rocket2Y=rocket2Y-.5;



 }



if (b==7) {
    frame=frame+1;
        if (frame>=4) {
      frame=0;
    }
     image(imagesss[frame], 0, 0);
  frameRate(13);


leg1=100000;
    rocketX=10000;
    body=body+3;
    bodyY=bodyY-.5;
    headY=headY-14000000;
    antY=antY-14900000;
    eyeY=eyeY-1400000;
    eye2Y=eye2Y-1400000;
    ballY=ballY-14;
    mouthY=mouthY-1;
    leg1=leg1-3;
    leg2=leg2-3;
    legY=legY-.4;
    wingY=wingY-1;
    rocketX=rocketX+.3;
    rocket2X=rocket2X-3;
    rocketY=rocketY-.5;
    rocket2Y=rocket2Y-.5;
}


if (ball<0) {
  background(255,0,0);
}

if (ball>500) {
  background(255,0,0);
}



if (b==8) {
    mousePressed=false;
    if (transparent>200) {
      transparent=40;
    }
    
    if (ballY<-20) {
      b=0;
    }
    
    
    if (ballY<360) {
     x1=x1+100000;
     x2=x2+100000;
     ballY=ballY+.00001;
     frameRate(7);
     image(loopingGif,0,0);
     text(message,100,100);
     fill(255,0,0);
     text(messad,130,100);
    }
    
    fill(255,255,0,transparent);
    ellipse(x1,195,300,300);
    fill(255,0,0,transparent);
    ellipse(x1,195,250,250);
    transparent=transparent+2;
    smooth();
    strokeWeight(0);
    fill(50,300,213,transparent);
    ellipse(x1,195,200,200);  
    
    image(mon, x2, 120);

    leg1=100000;
    rocketX=10000;
    body=body+3;
    bodyY=bodyY-.5;
    headY=headY-14000000;
    antY=antY-1900000;
    eyeY=eyeY-1700000;
    eye2Y=eye2Y-1900000;
    ballY=ballY-3;
    mouthY=mouthY-1;
    leg1=leg1-3;
    leg2=leg2-3;
    legY=legY-.4;
    wingY=wingY-1;
    rocketX=rocketX+.3;
    rocket2X=rocket2X-3;
    rocketY=rocketY-.5;
    rocket2Y=rocket2Y-.5;
    headY=773335;
    antY=7333363;
    eyeY=733384;
    eye2Y=733384;
   }



 


if (ballY<-121) {
  bodyY=800;
  headY=775;
  antY=763;
  eyeY=784;
  eye2Y=784;
  ballY=761;
  mouthY=790;
  legY=850;
  wingY=810;
  rocketY=875;
  rocket2Y=875;
  
  b=b+1;
}  


if (bg1=true) {  
  if (mousePressed == true) {
    fill(234, random(224), 9);  
    ellipse(rocketX, rocketY, 10, 30);
    ellipse(rocket2X, rocket2Y, 10, 30);
    bodyY=bodyY-7;
    headY=headY-7;
    antY=antY-7;
    eyeY=eyeY-7;
    eye2Y=eye2Y-7;
    ballY=ballY-7;
    mouthY=mouthY-7;
    legY=legY-7;
    wingY=wingY-7;
    rocketY=rocketY-7;
    rocket2Y=rocket2Y-7;
    //minim = new Minim(this);
    // music = minim.loadFile("U.mp3", 1024); 
    //music.play();
  }
}






fill(193, 193, 193);
ellipse(wing1, wingY, 40, 10);
ellipse(wing2, wingY, 40, 10);

rect(body, bodyY, 50, 50); //body
fill(193, 193, 193);
rect(head, headY, 25, 25); //head
rect(ant, antY, 5, 12);  //antenna
fill(random(255), 0, 0);
ellipse(eye1, eyeY, 7, 7); //left eye
ellipse(eye2, eye2Y, 7, 7);  //right eye
fill(0, 36, 255);
ellipse(ball, ballY, 12, 12); //ball
fill(random(239), 0, 0);
rect(mouth, mouthY, 17, 6); //mouth
fill(193, 193, 193);
rect(leg1, legY, 10, 25); //leg one
rect(leg2, legY, 10, 25); //leg two







} // end of void draw






void keyPressed(KeyEvent evt) {


  int key = evt.getKeyCode();  // Keyboard code for the pressed key.

  if (key == KeyEvent.VK_LEFT) {  // left-arrow key; move square up
    body=body-30;
    head=head-30;
    eye1=eye1-30;
    eye2=eye2-30;
    ant=ant-30;
    ball=ball-30;
    mouth=mouth-30;
    leg1=leg1-30;
    leg2=leg2-30;
    wing1=wing1-30;
    wing2=wing2-30;
    rocketX=rocketX-30;
    rocket2X=rocket2X-30;
  }
  else if (key == KeyEvent.VK_RIGHT) {  // right-arrow key; move right
    body=body+30;
    head=head+30;
    eye1=eye1+30;
    eye2=eye2+30;
    ant=ant+30;
    ball=ball+30;
    mouth=mouth+30;
    leg1=leg1+30;
    leg2=leg2+30;
    wing1=wing1+30;
    wing2=wing2+30;
    rocketX=rocketX+30;
    rocket2X=rocket2X+30;
  }
  else if (key == KeyEvent.VK_UP) {  // ROCKET BOOSTERS
  }
  else if (key == KeyEvent.VK_DOWN) {  // down-arrow key; move down
    fill(234, random(224), 9);  
    ellipse(rocketX, rocketY, 10, 30);
    ellipse(rocket2X, rocket2Y, 10, 30);
    bodyY=bodyY+3;
    headY=headY+3;
    antY=antY+3;
    eyeY=eyeY+3;
    eye2Y=eye2Y+3;
    ballY=ballY+3;
    mouthY=mouthY+3;
    legY=legY+3;
    wingY=wingY+3;
    rocketY=rocketY+3;
    rocket2Y=rocket2Y+3;

    //music = minim.loadFile("U.mp3", 1024);
    //music.play();
  }
}



void mouseReleased() {
  //music.pause();
}


