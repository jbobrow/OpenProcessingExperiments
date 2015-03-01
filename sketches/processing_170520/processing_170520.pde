
PFont font;
PImage milk;
PImage sidious;
PImage head;
int alpha = 255;
int timer = 0;
int phase = 0;
float w = 1;
int temp = 0;
int x = 300;

void setup(){
  size(600,600);
  font = loadFont("28DaysLater-48.vlw");
  milk = loadImage("melch.png");
  head = loadImage("head.png");
  sidious = loadImage("sidious.png");
  textFont(font);
  textAlign(CENTER);
  imageMode(CENTER);
}


void draw(){
  fill(255);
  rect(0,0,600,600);
  timer++;
  if(phase==0){
    if(timer>50&&timer<80){
      fill(0);
      textSize(150);
      text("they",300,120);
    }
    if(timer>80&&timer<120){
      fill(0);
      textSize(150);
      text("think",300,220);
    }
    if(timer>120&&timer<140){
      fill(0);
      textSize(150);
      text("they",300,320);
    }
    if(timer>140&&timer<160){
      fill(0);
      textSize(150);
      text("know",300,420);
    }
    if(timer>160&&timer<200){
      fill(0);
      textSize(150);
      text("me",300,520);
    }
    if(timer > 200&& timer <250){
      image(milk, 300,300);
    }
    if(timer>250){
      phase = 1;
      timer = 0;
    }
  }
  if(phase == 1){
    if(w < 400){
      image(head,300,300,w,w++);
    }
    else {
      image(head,300,300,w,w);
      phase = 3;
      timer = 0;
      temp = 300;
    }
    if(timer>80){
      fill(0,200);
      textSize(200);
      text("loner",230,520);
    }
    if(timer>120){
      pushMatrix();
      translate(150,-200);
      rotate(PI/5);
      shearX(PI/3);
      fill(0,170);
      textSize(200);
      text("dark",300,200);
      popMatrix();
    }
    if(timer > 160){
      pushMatrix();
      translate(-100,200);
      rotate(-PI/10);
      fill(0,100);
      textSize(120);
      text("dead inside",300,300);
      popMatrix();
    }
    if(timer > 200){
      fill(0,50);
      textSize(250);
      text("no \n vision",250,200);
    }
    if(timer >230){
      pushMatrix();
      rotate(-PI/30);
      fill(0,100);
      textSize(80);
      text("who's he?",200,300);
      popMatrix();
    }
    if(timer > 260){
      pushMatrix();
      translate(-100,200);
      rotate(PI/2);
      shearY(-PI/8);
      fill(0,170);
      textSize(200);
      text("wierd",100,-100);
      popMatrix();
    }
    if(timer > 280){
      fill(0);
      textSize(100);
      text("STOP",150,100);
    }
    if(timer > 290){
      fill(0);
      textSize(100);
      text("GROWING",300,200);
    }
    if(timer > 300){
      fill(0);
      textSize(100);
      text("FACIAL",300,300);
    }
    if(timer > 310){
      fill(0);
      textSize(100);
      text("HAIR",400,400);
    }
  }
  if(phase == 3){
    if(temp< 600){
      image(head,300,temp++,w,w);
      temp++;
    }
    else {
      image(head,300,temp,w,w);
    }
    if(timer>50){
      fill(#3D38F0);
      textSize(100);
      text("But",70,80);
    }
    if(timer>60){
      fill(0);
      textSize(200);
      text("they",220,240);
    }
    if(timer>90&&timer< 180){
      fill(#3D38F0);
      textSize(100);
      text("don't",250,370);
    }
    if(timer>100&&timer< 180){
      fill(#3D38F0);
      textSize(100);
      text("look",350,460);
    }
    if(timer>110&&timer< 180){
      fill(#3D38F0);
      textSize(100);
      text("inside",450,550);
    }
    if(timer>200){
      fill(#3D38F0);
      textSize(100);
      text("never",250,370);
    }
    if(timer>230){
      fill(#3D38F0);
      textSize(100);
      text("ask",350,460);
    }
    if(timer>280){
      fill(255);
      rect(0,0,600,600);
      if(x >=160){
        image(head,x--,600,w,w);
      }
      else {
        image(head,150,600,w,w);
      }
    }
    if(timer>320&&timer<440){
      fill(#3D38F0);
      textSize(100);
      text("what",450,550);
    }
    if(timer > 350&& timer < 440){
      fill(#3D38F0);
      textSize(100);
      text("I",450,350);
    }
    if(timer>380&&timer<440){
      fill(#3D38F0);
      textSize(100);
      text("think",450,150);
    }
    if(timer > 440&&timer < 700){
      fill(#3D38F0);
      textSize(100);
      text("I am",150,350);
    }
    if(timer>480&&timer<600){
      pushMatrix();
      translate(450,200);
      rotate(PI/5);
      shearX(PI/3);
      fill(#3D38F0,170);
      textSize(100);
      text("creative",0,0);
      if(timer > 520){
        text("friendly",-20,100);
      }
      if(timer > 560){
        text("bright",-40,200);
      }
      popMatrix();
    }
    if(timer>620&&timer<700){
      pushMatrix();
      translate(450,200);
      rotate(PI/5);
      shearX(-PI/3);
      fill(#3D38F0,170);
      textSize(100);
      text("living",0,0);
      text("in my own",-20,100);
      text("world",-40,200);
      popMatrix();
    }
    if(timer>700){
      image(sidious,450,450);
      fill(0);
      text("I HAVE\nCOOKIES",300,150);
    }
  }
  
}


