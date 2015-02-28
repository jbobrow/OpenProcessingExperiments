
import processing.pdf.*;

int x = 0;
int hatA = -80;
int hatB = -110;
int hatC = -90;
int mouthw = 30;
int mouthx = -15;
int mouthh = 5;
int soulpatch = 53;
float nose1 = -7;
float nose2 = 7;
float nose3 = 10;
float nose4 = 25;
float earheight = 0;
float earing = 21;
float eyesize = 30;
float pupilsize = 12;
float bowtiecolorR = 100;
float bowtiecolorG = 16; 
float eyebrow = -45;
float earingcolor = 240;
float righteye = 15;
float lefteye = -15;
float facewidth = 100;


void setup (){
  size(3525,5325);
  beginRecord(PDF, "olsenO040314greenman.pdf");
  background(217,237,250);
  translate(146.875,146.875);
  noStroke();
  repeatShape();
  endRecord();
}
void draw(){
}

void makeShape(){
 //ears
    fill(127,227,159);
    ellipse(-50,earheight,40,50);
    ellipse(50,earheight,40,50);
    fill(90,173,115);
    ellipse(-45,earheight,30,40);
    ellipse(45,earheight,30,40);
    fill(127,227,159);
    ellipse(-40,earheight,25,40);
    ellipse(40,earheight,25,40);
       
    //earing
    fill(earingcolor,earingcolor,earingcolor);
    ellipse(-55,earing,10,10);
       
    //shirt
    fill(250,250,250);
    ellipse(0,160,200,130);
       
    //face
    fill(127,227,159);
    ellipse(0,0,facewidth,200);
       
    //eyes
    fill(255,255,255);
    ellipse(20,-20,eyesize,eyesize);
    ellipse(-20,-20,eyesize,eyesize);
       
    //pupil
    fill(0,0,0);
    ellipse(righteye,-20,pupilsize,pupilsize);
    ellipse(lefteye,-20,pupilsize,pupilsize);
       
    //eyebrows
    fill(0,77,23);
    rect(5,eyebrow,30,10,10);
    rect(-35,eyebrow,30,10,10);
       
    //soulpatch
    rect(-6,soulpatch,13,10,10);
       
    //nose
    fill(90,173,115);
    triangle(0,-10,nose1,30,nose2,30);
    ellipse(nose1,nose4,nose3,nose3);
    ellipse(nose2,nose4,nose3,nose3);
       
    //mouth
    fill(69,138,90);
    rect(mouthx,45,mouthw,mouthh,10);
       
    //hat
    fill(hatcolorR,hatcolorG,hatcolorB);
    rect(-50,hatA,100,10,10);
    rect(-35,hatB,70,40,20);
    fill(bowtiecolorR,bowtiecolorG,bowtiecolorB);
    rect(-35,hatC,70,10);
       
    //bowtie
    fill(bowtiecolorR,bowtiecolorG,bowtiecolorB);
    rect(-10,95,20,20,10);
    triangle(-20,90,0,105,-20,120);
    triangle(20,90,0,105,20,120);

}

void repeatShape(){
  for(int i=0; i < 216; i++){
    println("MEH" + i);
    makeShape();
    translate(293.75,0);
    x++;
    if (x == 12){
      x = 0;
      translate(-3525,293.75);
    }
     earheight = random(-10,10);
    earing = random(20,21);
    eyesize = random(25,39);
    pupilsize = random(5,17);
    bowtiecolorR = random(0,250);
    bowtiecolorG = random(0,250);
    bowtiecolorB = random(0,250);
    hatcolorR = random (10,100);
    hatcolorG = random(100,200);
    hatcolorB = random(10,200);
    eyebrow = random(-68,-38);
    earingcolor = random(0,250);
    righteye = random(15,27);
    lefteye = random(-27,-15);
    nose1 = random(-7,-9);
    nose2 = random(7,9);
    nose3= random(10,12); 
    nose4 = random(24,25);
    facewidth = random(90,110);
  
  }
}

  





