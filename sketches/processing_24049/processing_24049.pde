
//zeewan lee
//March 17, 2011
//final project draft 2

import seltar.motion.*;


Motion m;
float Angle = random(TWO_PI);
ArrayList babybaby;
PImage fetus;
PImage fetus2;
PImage fetus3;
PImage fetus4;
PImage fetus5;
PImage fetus6;
PImage fetus7;
PImage fetus8;
PImage fetus9;
PImage fetus10;
PImage fetus11;
PImage fetus12;
PImage fetus13;
PImage fetus14;
PImage baby1;
PImage baby2;
float speed = 0.5;
int diameter=20;
float x;
float y;
float birth;
particle small; 
particle big;
int numFrames = 8;
int currentFrame = 0;
PImage [] images= new PImage [numFrames];
int time1=1000;
int time2=2000;
int time3=3000;
int time4=4000;
int time5=5000;
int time6=6000;
int time7=7000;
int time8=8000;
int time9=9000;
int time10=10000;
int time11=11000;


void setup() {
  size(600,459);
  smooth();  
  frameRate(8);
  
  //make more frames
  images[0]= loadImage ("universe1.jpg");
  images[1]= loadImage ("universe2.jpg");
  images[2]= loadImage ("universe3.jpg");
  images[3]= loadImage ("universe4.jpg");
  images[4]= loadImage ("universe5.jpg");
  images[5]= loadImage ("universe6.jpg");
  images[6]= loadImage ("universe7.jpg");
  images[7]= loadImage ("universe8.jpg");
  
  m = new Motion(width/2,height/2);
  fetus=loadImage("fetus.png");
  fetus2=loadImage("fetus2.png");
  fetus3=loadImage("fetus3.png");
  fetus4=loadImage("fetus4.png");
  fetus5=loadImage("fetus5.png");
  fetus6=loadImage("fetus6.png");
  fetus7=loadImage("fetus7.png");
  fetus8=loadImage("fetus8.png");
  fetus9=loadImage("fetus9.png");
  fetus10=loadImage("fetus10.png");
  fetus11=loadImage("fetus11.png");
  fetus12=loadImage("fetus12.png");
  fetus13=loadImage("fetus13.png");
  fetus14=loadImage("fetus14.png");
  baby1=loadImage("baby1.png");
  baby2=loadImage("baby2.png");
  x=width/2;
  y=height/2;
  small=new particle (width*0.33, height/2,50);
  big= new particle (width*0.66, height/2,10);
  
  
   }


void draw () {
 //background(universe);
 //changing background
 
 image(images[currentFrame],0,0);
 currentFrame++; //next frame
   if (currentFrame >=images.length) {
   currentFrame =1; //return to first frame
   }


//floating fetus (motion)
  Angle += radians(random(-20,20));
  m.moveDir(Angle,random(1,5));
  m.wrap(-200,-200,width,height);
  m.move();
  //end of motion 
 
 image (baby2,0,200);
 image(fetus,m.getX(),m.getY());
 image(fetus2, 600-m.getX(),m.getY()*2);
 
 //evolving fetus (timed events)
int currentTime=millis();
if (currentTime< time1) {
  image(fetus3, m.getX()*3,m.getY()*-0.7);
} else if (currentTime <time2){
  image(fetus4, m.getX()*3,m.getY()*-0.7);
} else if (currentTime <time3){
  image(fetus5, m.getX()*3,m.getY()*-0.7);
  } else if (currentTime <time4){
    image(fetus6, m.getX()*3,m.getY()*-0.7);
    } else if (currentTime <time5){
      image(fetus7, m.getX()*3,m.getY()*-0.7);
      } else if (currentTime <time6){
        image(fetus8, m.getX()*3,m.getY()*-0.7);
        } else if (currentTime <time7){
          image(fetus9, m.getX()*3,m.getY()*-0.7);
          } else if (currentTime <time8){
            image(fetus10, m.getX()*3,m.getY()*-0.7);
            } else if (currentTime <time9){
              image(fetus11, m.getX()*3,m.getY()*-0.7);
            } else if (currentTime <time10){
              image(fetus12, m.getX()*3,m.getY()*-0.7);
            } else if (currentTime >time11){
              image(fetus13, m.getX()*3,m.getY()*-0.7);
                  }
              
 
 small.move();
 small.display();
 big.move();
 big.display();
 
  if (mousePressed){
  if(mouseButton==LEFT){
  image(baby1,random(mouseX-10,mouseX+10),random(mouseY-10,mouseY+10));
     }  
    }
 
}


class particle {
float x;
float y; 
int diameter;
float speed=3.5;

particle (float tempX, float tempY, int tempDiameter){
  x=tempX;
  y=tempY;
  diameter=tempDiameter;
}

void move() {
  x +=random(-speed, speed);
  y +=random(-speed, speed);
}

void display () {
  ellipse (x,y,diameter,diameter);
  noStroke();
  fill(random(200),random(0,150),random(200),random(80,300));
}
}
 


