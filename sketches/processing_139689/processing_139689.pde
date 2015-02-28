
int hatA;
int hatB;
int hatC;
int mouthw; 
int mouthx; 
int mouthh;
int soulpatch;
int nose1; 
int nose2; 
int nose3;
int nose4; 
float earheight = 0;
float earing = 21; 
float eyesize = 30;
float pupilsize = 12;
float bowtiecolorR = 100;
float bowtiecolorG = 16;
float bowtiecolorB = 44;
float hatcolorR = 34; 
float hatcolorG = 107; 
float hatcolorB = 56;
float eyebrow = -45;
boolean clicked=false;

void setup(){
  size(300,300);
  background(217,237,250);
}

void keyPressed(){
  clicked=! clicked;
  earheight = random(-10,10);
  earing = random(20,22);
  eyesize = random(25,38);
  pupilsize = random(5,18);
  bowtiecolorR = random(10,200);
  bowtiecolorG = random(10,100);
  bowtiecolorB = random(10,200);
  hatcolorR = random (10,100);
  hatcolorG = random(100,200);
  hatcolorB = random(10,200);
  eyebrow = random(-68,-38);
}

void draw(){
  background(217,237,250);
 if (clicked == false){
    hatA = -80;
    hatB = -110;
    hatC = -90;
    mouthw = 30; 
    mouthx = -15;
    mouthh = 5;
    soulpatch = 53;
    nose1 = -7;
    nose2 = 7;
    nose3 = 10;
    nose4 = 25;
  }
  if (clicked == true){
    hatA = -100;
    hatB = -130;
    hatC = -110;
    mouthw = 15; 
    mouthx = -7;
    mouthh = 13;
    soulpatch = 60;
    nose1 = -10;
    nose2 = 10;
    nose3 = 13;
    nose4 = 23;
  }
    translate(150,150);
    noStroke();
 
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
    fill(240,240,240);
    ellipse(-55,earing,10,10);
     
    //shirt
    fill(250,250,250);
    ellipse(0,160,200,130);
     
    //face
    fill(127,227,159);
    ellipse(0,0,100,200);
     
    //eyes
    fill(255,255,255);
    ellipse(20,-20,eyesize,eyesize);
    ellipse(-20,-20,eyesize,eyesize);
     
    //pupil
    fill(0,0,0);
    ellipse(15,-20,pupilsize,pupilsize);
    ellipse(-15,-20,pupilsize,pupilsize);
     
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


 
    


