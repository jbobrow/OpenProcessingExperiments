
boolean pig = false;

float pigX = 100;
float pigY = 200;
float pigXspeed = 1;
float pigYspeed = 1;
float state = 0;

int darkpinkR = 252;
int darkpinkG = 197;
int darkpinkB = 216;

int pinkR = 252;
int pinkG = 227;
int pinkB = 245;

int black = 0;
int white = 255;
int lightR = 99;
int lightG = 228;
int lightB = 252;

int noseR = 224;
int noseG = 197;
int noseB = 216;

int blushR = 219;
int blushG = 87;
int blushB = 87;

int bodyWidth = 170;
int bodyHeight = 185;

int earsDiam = 20;
int backheadDiam = 130;
int faceDiam = 100;
int noseDiam = 30;
int noseholesWidth = 3;
int noseholesHeight = 6;

int eyesDiam = 6;
int pupilsDiam = 14;
int handsWidth = 30;
int handsHeight = 55;
int mouthDiam = 10;
int bowtieDiam = 10;
int cheekDiam = 15;

void setup() {
  size (200,200);
  smooth();
}

void draw() {
      if (state == 0) {
    pigY = pigY + pigYspeed;
    if (pigY > height) {
    pigYspeed = pigYspeed * -1;
    state = 1;
    }
  } else if (state == 1) {
      pigY = pigY + pigYspeed;
      if (pigY == 100) {
      pigYspeed = pigYspeed * 1;
      state = 2;
      }
  }
  else if (state == 2) {
    pigY = pigY-pigYspeed;
    if (pigY < height);
    pigYspeed = pigYspeed * -1;
    state = 3;
  }
    if (mouseX > pigX && mouseX < pigX+width && mouseY > pigY && mouseY< pigY+height && mousePressed) {
    pig = true;
  } else {
    pig = false;
  }
   if(pig) {
    background(lightR,lightG,lightB);
//body
noStroke();
fill(darkpinkR,darkpinkG,darkpinkB);
ellipse(pigX,pigY+70,bodyWidth,bodyHeight);

//ears
noStroke();
fill(pinkR,pinkG,pinkB);
ellipse(pigX-25,pigY-70,earsDiam,earsDiam);
ellipse(pigX+25,pigY-70,earsDiam,earsDiam);

//back head
stroke(noseR,noseG,noseB);
fill(darkpinkR,darkpinkG,darkpinkB);
ellipse(pigX,pigY-10,backheadDiam,backheadDiam);

//inner head circle
noStroke();
fill(pinkR,pinkG,pinkB);
ellipse(pigX,pigY,faceDiam,faceDiam);

//nose
noStroke();
fill(noseR,noseG,noseB);
ellipse(pigX,pigY,noseDiam,noseDiam);

//nouse holes
fill(black);
ellipse(pigX-4,pigY,noseholesWidth,noseholesHeight);
ellipse(pigX+4,pigY,noseholesWidth,noseholesHeight);

//pupils
fill(white);
ellipse(pigX-19,pigY-52,pupilsDiam,pupilsDiam);
ellipse(pigX+19,pigY-52,pupilsDiam,pupilsDiam);

//eyes
fill(black);
ellipse(pigX-19,pigY-51,eyesDiam,eyesDiam);
ellipse(pigX+19,pigY-51,eyesDiam,eyesDiam);

//hands
noStroke();
fill(pinkR,pinkG,pinkB);
ellipse(pigX-55,pigY+40,handsWidth,handsHeight);
ellipse(pigX+55,pigY+40,handsWidth,handsHeight);

//mouth
noStroke();
fill(black);
ellipse(pigX,pigY+40,mouthDiam,mouthDiam);

//bowtie
noStroke();
fill(black);
triangle(pigX+20,pigY+50,pigX+20,pigY+70,pigX-8,pigY+60);
triangle(pigX-20,pigY+50,pigX-20,pigY+70,pigX+8,pigY+60);
ellipse(pigX,pigY+60,bowtieDiam,bowtieDiam);

//blushing cheeks
fill(blushR,blushG,blushB);
ellipse(pigX+30,pigY,cheekDiam,cheekDiam);
ellipse(pigX-30,pigY,cheekDiam,cheekDiam);
  } else{
    background(0);
    noStroke();
//body
noStroke();
fill(darkpinkR,darkpinkG,darkpinkB);
ellipse(pigX,pigY+70,bodyWidth,bodyHeight);

//ears
noStroke();
fill(pinkR,pinkG,pinkB);
ellipse(pigX-25,pigY-70,earsDiam,earsDiam);
ellipse(pigX+25,pigY-70,earsDiam,earsDiam);

//back head
stroke(noseR,noseG,noseB);
fill(darkpinkR,darkpinkG,darkpinkB);
ellipse(pigX,pigY-10,backheadDiam,backheadDiam);

//inner head circle
noStroke();
fill(pinkR,pinkG,pinkB);
ellipse(pigX,pigY,faceDiam,faceDiam);

//nose
noStroke();
fill(noseR,noseG,noseB);
ellipse(pigX,pigY,noseDiam,noseDiam);

//nouse holes
fill(black);
ellipse(pigX-4,pigY,noseholesWidth,noseholesHeight);
ellipse(pigX+4,pigY,noseholesWidth,noseholesHeight);

//eyes
fill(black);
ellipse(pigX-19,pigY-50,eyesDiam,eyesDiam);
ellipse(pigX+19,pigY-50,eyesDiam,eyesDiam);

//hands
noStroke();
fill(pinkR,pinkG,pinkB);
ellipse(pigX-55,pigY+60,handsWidth,handsHeight);
ellipse(pigX+55,pigY+60,handsWidth,handsHeight);

//mouth
noStroke();
fill(black);
ellipse(pigX,pigY+40,mouthDiam,mouthDiam);

//bowtie
noStroke();
fill(black);
triangle(pigX+20,pigY+50,pigX+20,pigY+70,pigX-8,pigY+60);
triangle(pigX-20,pigY+50,pigX-20,pigY+70,pigX+8,pigY+60);
ellipse(pigX,pigY+60,bowtieDiam,bowtieDiam);


}}


