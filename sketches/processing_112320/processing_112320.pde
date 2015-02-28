
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

int x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6;

float xspeed, yspeed, x1speed, y1speed, x2speed, y2speed, x3speed, y3speed, x4speed, y4speed, x5speed, y5speed, x6speed, y6speed ;

int padx, padwidth;

boolean dead, play;

PImage img0;

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;

int score;

int scoreup;

PFont font;


import ddf.minim.*;

Minim minim;

AudioSample bounce;

AudioSample bounce1;

AudioSample bounce2;

AudioSample bounce3;

AudioPlayer bgsound1;




void setup() {
  size(1000, 700);
  stroke(255);
  img0=loadImage("bubble background0.jpg");
  img1=loadImage("bubble background1.jpg");

  img2=loadImage("bubble background2.jpg");
  img3=loadImage("bubble background3.jpg");
  img4=loadImage("bubble background4.jpg");
  img5=loadImage("bubble background5.jpg");
  img6=loadImage("bubble background6.jpg");
  img7=loadImage("bubble background7.jpg");

  font=loadFont("CurlzMT-48.vlw");




  newGame();
  minim = new Minim(this);

  bounce = minim.loadSample("do.mp3");

  bounce1 = minim.loadSample("re.mp3");

  bounce2 = minim.loadSample("me.mp3");

  bounce3 = minim.loadSample("fa.mp3");
  
  bgsound1 = minim.loadFile("bubble.mp3");
  
 bgsound1.loop();
}






void draw() {

  background(0, 0, 0);

image(img3,0,0);

if(score>=1){image(img1, 0, 0);}      
if(score>1){image(img2,0,0);}
if(score>2){image(img6,0,0);}
if(score>3){image(img1,0,0);}
if(score>4){image(img5,0,0);}
if(score>5){image(img1,0,0);}
if(score>6){image(img5,0,0);}
if(score>7){image(img4,0,0);}


  if (dead) {

  
    
    fill(100);

    strokeWeight(2);

    stroke(255);

    if (true) {
      image(img0, 0, 0);
    }

    
    if (mousePressed==true) {
      newGame();
    }





    textFont(font);
    textSize(42);
    fill(0);
    text("DEAD!! IF U WANNA TRY AGAIN, CLICK YOUR MOUSE", 10, height/2);

    textSize(52);
    fill(0);
    text(score, 20, 70);
  }










  if (play) {
   
    textFont(font);
    textSize(52);

    fill(100);

    strokeWeight(2);

    stroke(255);
    fill(0);
    text(score, 20, 70);

    noStroke();
    //pink

    fill(20, 124, 190, random(90, 200));

    ellipse(x, y, 20, 20);

    x+=xspeed;

    y+=yspeed;

    noStroke();
    //yellow
    fill(237, 245, 30, random(90, 200));

    ellipse(x1, y1, 20, 20);

    x1+=x1speed;

    y1+=y1speed;

    noStroke();
    //mint
    fill(91, 245, 159, random(90, 200));

    ellipse(x2, y2, 20, 20);

    x2+=x2speed;

    y2+=y2speed;

    y3+=y3speed;

    noStroke();
    //purple

      fill(111, 91, 245, random(90, 200));

    ellipse(x4, y4, 20, 20);

    x4+=x4speed;

    y4+=y4speed;

    noStroke();

    colorMode(HSB, 200, 200, 10);

    fill(40, 37, 46, random(90, 300));

    padx=mouseX;

    rectMode(CENTER);

    rect(mouseX, 630, random(120, 160), 8);




    if (x<10||x>width-10)xspeed=-1*xspeed;

    if (x1<10||x1>width-10)x1speed=-1*x1speed;

    if (x2<10||x2>width-10)x2speed=-1*x2speed;

    if (x4<10||x4>width-10)x4speed=-1*x4speed;
    if (x5<10||x5>width-10)x5speed=-1*x5speed;
    if (x6<10||x6>width-10)x6speed=-1*x6speed;

    if (y<10)yspeed=-1*yspeed; 

    if (y1<10)y1speed=-1*y1speed;

    if (y2<10)y2speed=-1*y2speed;

    if (y4<10)y4speed=-1*y4speed;
    if (y5<10)y5speed=-1*y5speed;
    if (y6<10)y6speed=-1*y6speed;

    if (mouseX-80<=x&&mouseX+80>=x&&y<=height-80&&y>=height-90) {
      yspeed=-1*yspeed;
      score+=scoreup;
      bounce.trigger();
    }



    if (mouseX-80<=x1&&mouseX+80>=x1&&y1<=height-90&&y1>=height-90) {
      y1speed=-1*y1speed;
      score+=scoreup;
      bounce1.trigger();
    }

    if (mouseX-80<=x2&&mouseX+80>=x2&&y2<=height-90&&y2>=height-90) {
      y2speed=-1*y2speed;
      score+=scoreup;
      bounce2.trigger();
    }

    if (mouseX-80<=x4&&mouseX+80>=x4&&y4<=height-90&&y4>=height-90) {
      y4speed=-1*y4speed;
      score+=scoreup;
      bounce3.trigger();
    }


    if (mouseX-80<=x5&&mouseX+80>=x5&&y5<=height-90&&y5>=height-90) {
      y5speed=-1*y5speed;
      score+=scoreup;
    }


    if (mouseX-80<=x6&&mouseX+80>=x6&&y6<=height-90&&y6>=height-90) {
      y6speed=-1*y6speed;
      score+=scoreup;
    }

    if (score>=2) {                
      fill(55, 230, 20, random(90, 200));
      ellipse(x5, y5, 20, 20); 
      x5+=x5speed ; 
      y5+=y5speed;
    }

    if (score>=4) {                
      fill(245, 94, 139, random(90, 200));
      ellipse(x6, y6, 20, 20); 
      x6+=x6speed ; 
      y6+=y6speed;
    }




    if (y>620) {
      dead=true;
      play=false;
    }

    if (y1>620) {
      dead=true;
      play=false;
    }

    if (y2>620) {
      dead=true;
      play=false;
    }

    if (y4>620) {
      dead=true;
      play=false;
    }

    if (y5>620) {
      dead=true;
      play=false;
    }

    if (y6>620) {
      dead=true;
      play=false;
    }
  }
}




void newGame() {

  x=10;

  x1=100;

  x2=500;

  x4=800;

  x5=200;
  x6=500;

  y=10;

  y1=60;

  y2=20;

  y4=30;

  y5=50;
  y6=30;

  xspeed=3;

  x1speed=-1;

  x2speed=3;

  x4speed=2;

  x5speed=2;
  x6speed=-1;

  yspeed=-4;

  y1speed=2;

  y2speed=-1;

  y4speed=-2;

  y5speed=-1;
  y6speed=-1;








  score=0;

  scoreup=1;




  dead=false;

  play=true;

  fill(100);

  strokeWeight(2);



  stroke(255);
 
}


