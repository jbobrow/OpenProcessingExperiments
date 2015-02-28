
import ddf.minim.*;
Minim minim;
AudioPlayer audio1,audio2;

PShape bird1, bird1_2;
PImage sky;
PShape [] jungleTrees =new PShape [9];
PImage [] pics = new PImage [5];
PFont baskerville;
String t="Tweet";
int eyeX, eyeY;
int time0=1500;
int time1=2000;
int time2=2500;
int time3=3000;
int time4=3500;
int time5=4000;
int time6=4500;
int time7=5000;
int time8=5500;
int time9=6000;
int xspeed=15;
int xpos,ypos;



void setup(){
  background(120,150,100);
  size(800,800);
  smooth();
  minim= new Minim(this);
  audio1 = minim.loadFile("bird1.wav");
  bird1=loadShape("bird1.svg");
  bird1_2=loadShape("bird1_2.svg");
  sky = loadImage("sky.jpg");
  jungleTrees [0] = loadShape("tree1.svg");
  jungleTrees [1] = loadShape("tree2.svg");
  pics [0] = loadImage("frog-1.png");
  pics [1] = loadImage("tree3.png");
  pics [2] = loadImage("bird.png");
  shape(bird1,width/2-bird1.width/2,height/2-bird1.height/2);
  fill(255);
  ellipse(450,330,40,40);
  xpos=width;ypos=0;
  frameRate(15);

}

void stop(){
  minim.stop();
  super.stop();
}

void draw(){
  //eyeball
  float eyeX=constrain(mouseX,440,460);
  float eyeY=constrain(mouseY,320,340);
  fill(0);
  ellipse(eyeX,eyeY,10,10);
  //Tweets
  textSize(random(30,100));
  textAlign(CENTER);
  baskerville = loadFont("Baskerville-SemiBold-48.vlw");
  textFont(baskerville,random(30,100));

  //To make bird sing
  if (key=='s'){
    int currentTime=millis();
    background(sky);
        //jungle
    if (currentTime>time0){
      shape(jungleTrees[1],300,height-jungleTrees[1].height);
    }if(currentTime>time2){
      shape(jungleTrees[0],0,height-jungleTrees[0].height);
    }if (currentTime>time3){
      image(pics[0],0,height-pics[0].height);
      pushMatrix();
      translate(250,675);
      fill(230,255,240);
      textSize(random(10,50));
      text("riBBet",0,0);
      popMatrix();
    }if (currentTime>time4){
      image(pics[1],width-pics[1].width,height-pics[1].height);
    }if (currentTime>time5){
      xpos-=xspeed;
      if (xpos<0-pics[2].width){
        xpos=width;
      }
      image(pics[2],xpos,ypos);
    }
      
      //main bird
    shape(bird1_2,width/2-bird1.width/2,height/2-bird1.height/2);
    fill(255);
    ellipse(450,330,40,40);
    fill(0);
    ellipse(eyeX,eyeY,10,10);
    audio1.play();
    pushMatrix();
    translate(600,200);
    rotate(radians(315));
    fill(255,65,56);
    textSize(random(30,100));
    text(t,0,0);
    popMatrix();
  }
}

void mouseMoved() {
  redraw();
}



