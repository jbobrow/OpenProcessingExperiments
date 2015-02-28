
float KittyA = 72-120;
float KittyB = 325-120;
float KittyC = 245-120;
float KittyD = 310-120;
float KittyE = 292-120;
float KittyF = 90-120;
float KittyG = 150-120;
float KittyH = 110-120;
float KittyI = 200-120;
float KittyJ = 150-120;
float KittyK = 270-120;
float KittyL = 250-120;

float KittyM = 230-120;
float KittyN = 340-120;
float KittyO = 295-120;
float KittyP = 200-120;
float KittyQ = 270-120;


void setup() {
size(400,400);
background(255,0,78);
}



void draw() { 
  
fill(0);
stroke(255);
strokeWeight(1.5);

line(KittyA,210,125,220);
line(KittyA,230,125,225);
line(KittyA,250,125,230);
 
line(KittyB,210,275,220);
line(KittyB,230,275,225);
line(KittyB,250,275,230); 

 
//ear
noStroke();
smooth();

fill(255);
beginShape();
vertex(KittyC,130);
vertex(KittyD,100);
vertex(KittyE,165);
endShape(CLOSE);
//ear

smooth();

fill(255);
beginShape();
vertex(KittyF,100);
vertex(KittyG,130);
vertex(KittyH,165);
endShape(CLOSE);
//face
//noStroke();
fill(255);
ellipse(KittyI,200,200,160);

//eyes
fill(0);
ellipse(KittyJ,215,20,25);
ellipse(KittyL,215,20,25);
  
//nose
fill(246,255,0);
ellipse(KittyI,230,20,15);


fill(random(234,255),random(255),0);
ellipse(KittyO+10,165,70,70);

fill(random(234,255),random(255),0);
ellipse(KittyK-30,130,70,70);


fill(random(234,255),random(255),0);
ellipse(KittyQ,150,30,30);

/*
//butterfly circle
noStroke();  
fill(255,0,random(120,255),15);
beginShape();
vertex(KittyN,160);
vertex(KittyO,215);
vertex(KittyK,150);
endShape(CLOSE);
 
fill(255,0,random(120,255),15);
beginShape();
vertex(KittyM,100);
vertex(KittyP,150);
vertex(KittyK,150);
endShape(CLOSE);

 
 
fill(random(234,255),random(255),0);
ellipse(KittyQ,150,30,30);


*/
//kitty MOVE

KittyA =  KittyA + (frameCount % 5);
KittyB =  KittyB + (frameCount % 5);
KittyC =  KittyC + (frameCount % 5);
KittyD =  KittyD + (frameCount % 5);
KittyE =  KittyE + (frameCount % 5);
KittyF =  KittyF + (frameCount % 5);
KittyG =  KittyG + (frameCount % 5);
KittyH =  KittyH + (frameCount % 5);
KittyI =  KittyI + (frameCount % 5);
KittyJ =  KittyJ + (frameCount % 5);
KittyK =  KittyK + (frameCount % 5);
KittyL =  KittyL + (frameCount % 5);
KittyM =  KittyM + (frameCount % 5);
KittyN =  KittyN + (frameCount % 5);
KittyO =  KittyO + (frameCount % 5);
KittyP =  KittyP + (frameCount % 5);
KittyQ =  KittyQ + (frameCount % 5);

//kitty LOOP
KittyA =  KittyA % (width+100);
KittyB =  KittyB % (width+100);
KittyC =  KittyC % (width+100);
KittyD =  KittyD % (width+100);
KittyE =  KittyE % (width+100);
KittyF =  KittyF % (width+100);
KittyG =  KittyG % (width+100);
KittyH =  KittyH % (width+100);
KittyI =  KittyI % (width+100);
KittyJ =  KittyJ % (width+100);
KittyL =  KittyL % (width+100);

//butterfly LOOP
KittyQ =  KittyQ % (width+100);
KittyM =  KittyM % (width+100);
KittyP =  KittyP % (width+100);
KittyO =  KittyO % (width+100);
KittyN =  KittyN % (width+100);
KittyK =  KittyK % (width+100);


}


