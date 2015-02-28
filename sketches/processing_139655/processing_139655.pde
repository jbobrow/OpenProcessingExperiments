
int hatA;
int hatB;
int hatC;
int eyebrow;
int eye;
int mouthw; 
int mouthx; 
int mouthh;
int soulpatch;
int nose1; 
int nose2; 
int nose3;
int nose4; 
boolean clicked=false;

void setup(){
  size(300,300);
  background(217,237,250);
}

void keyPressed(){
  clicked=! clicked;
}

void draw(){
  background(217,237,250);
 if (clicked == false){
    hatA = -80;
    hatB = -110;
    hatC = -90;
    eyebrow = -45;
    eye = 5;
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
    eyebrow = -55;
    eye = 15;
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
    ellipse(-50,0,40,50);
    ellipse(50,0,40,50);
    fill(90,173,115);
    ellipse(-45,0,30,40);
    ellipse(45,0,30,40);
    fill(127,227,159);
    ellipse(-40,0,25,40);
    ellipse(40,0,25,40);
     
    //earing
    fill(240,240,240);
    ellipse(-55,18,10,10);
     
    //shirt
    fill(250,250,250);
    ellipse(0,160,200,130);
     
    //face
    fill(127,227,159);
    ellipse(0,0,100,200);
     
    //pupils
    fill(255,255,255);
    ellipse(20,-20,30,30);
    ellipse(-20,-20,30,30);
     
    //eyes
    fill(0,0,0);
    ellipse(15,-20,eye,eye);
    ellipse(-15,-20,eye,eye);
     
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
    fill(34,107,56);
    rect(-50,hatA,100,10,10);
    rect(-35,hatB,70,40,20);
    fill(56,16,44);
    rect(-35,hatC,70,10);
     
    //bowtie
    fill(56,16,44);
    rect(-10,95,20,20,10);
    triangle(-20,90,0,105,-20,120);
    triangle(20,90,0,105,20,120);
}


 
    


