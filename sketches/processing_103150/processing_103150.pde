
ArrayList lineArrayOne;
ArrayList lineArrayTwo;
ArrayList lineArrayThree;
ArrayList lineArrayFour;
ArrayList lineArrayFive;
ArrayList starGenX;
ArrayList starGenY;
color act1 = color(255, 150, 0);
color act2 = color(255, 0, 150);
color act3 = color(150, 255, 0);
color act4 = color(150, 0, 250);
color act5 = color(0, 150, 255);
color blackout = color(0, 0, 0);
float fr=1;
float adr=1;
float rate=120;
int speed = 4;
int program;
int rampFlash;
int rampAlpha;
void setup() {
  lineArrayOne= new ArrayList();
  lineArrayTwo= new ArrayList();
  lineArrayThree= new ArrayList();
  lineArrayFour= new ArrayList();
  lineArrayFive= new ArrayList();
  starGenX = new ArrayList();
  starGenY = new ArrayList();
  size(800, 600);
  background(0);
  frameRate(120);
  noStroke();
}

void draw() {
  background(0);
  rate = 120*fr*adr;
  frameRate(rate);
  println(rate);
  if (rampFlash==1) {
    rampFlash();
  }
  debugger();
  switch(program) {
  case 0:
    drawRectOne();
    drawRectTwo();
    drawRectThree();
    drawRectFour();
    drawRectFive();
    break;

  case 1:
    starGen();
    break;
  }
}

void keyReleased() {
  if (program==0) {
    if (key=='a') {
      lineArrayOne.add(0);
    }
    if (key=='s') {
      lineArrayTwo.add(0);
    }
    if (key=='d') {
      lineArrayThree.add(0);
    }
    if (key=='f') {
      lineArrayFour.add(0);
    }
    if (key=='g') {
      lineArrayFive.add(0);
    }
    if (key=='q') {
      fr*=2;
    }
    if (key=='w') {
      fr*=.5;
    }
    if (key=='e') {
      background(0);
      lineArrayOne.clear();
      lineArrayTwo.clear();
      lineArrayThree.clear();
      lineArrayFour.clear();
      lineArrayFive.clear();
    }
  }
  if (key=='r') {
    rampAlpha=255;
    rampFlash=1;
  }
  if (key=='1') {
    program=0;
  }
  if (key=='2') {
    program=1;
  }
}
void keyPressed() {
  if (program==0) {
    if (key=='o') {
      adr=42;
    } 
    else if (key=='p') {
      adr=.25;
    }  
    else {
      adr=1;
    }
  }
}

void rampFlash(){

 fill(0,0,0,rampAlpha);
 rect(0,0,width,height); 
 if(rampAlpha>0){
  rampAlpha-=5;
 } else{
  rampFlash=0; 
 }
 
}
void starGen(){
fill(255);
 starGenX.add(random(800));
  starGenY.add(random(600));    
  if (starGenX.size()>60) {
    starGenX.remove(0);
  }
  if (starGenY.size()>60) {
    starGenY.remove(0);
  }
  for (int starIter =0; starIter<starGenX.size();starIter++) {
    rect((Float)starGenX.get(starIter), (Float)starGenY.get(starIter), 4, 4) ;
  }
}
void debugger(){

}
void drawRectFive() {
  for (int dr5=0; dr5<lineArrayFive.size();dr5++) {
    if (dr5%2==0 ) {
      fill(act5);
    }
    else {
      fill(blackout);
    }
    rect(4*width/5, 0, width/5, (Integer)lineArrayFive.get(dr5));
    if ((Integer)lineArrayFive.get(dr5)<=height) {
      lineArrayFive.set(dr5, (Integer)lineArrayFive.get(dr5)+speed);
    } 
  }
}
void drawRectFour() {
  for (int dr4=0; dr4<lineArrayFour.size();dr4++) {
    if (dr4%2==0 ) {
      fill(act4);
    }
    else {
      fill(blackout);
    }
    rect(3*width/5, 0, width/5, (Integer)lineArrayFour.get(dr4));
    if ((Integer)lineArrayFour.get(dr4)<=height) {
      lineArrayFour.set(dr4, (Integer)lineArrayFour.get(dr4)+speed);
    } 
  }
}
void drawRectOne(){
  for (int dr1=0; dr1<lineArrayOne.size();dr1++) {
    if (dr1%2==0 ) {
      fill(act1);
    }
    else {
      fill(blackout);
    }
    rect(0, 0, width/5, (Integer)lineArrayOne.get(dr1));
    if ((Integer)lineArrayOne.get(dr1)<=height) {
      lineArrayOne.set(dr1, (Integer)lineArrayOne.get(dr1)+speed);
    } 
  }
}
void drawRectThree() {
  for (int dr3=0; dr3<lineArrayThree.size();dr3++) {
    if (dr3%2==0 ) {
      fill(act3);
    }
    else {
      fill(blackout);
    }
    rect(2*width/5, 0, width/5, (Integer)lineArrayThree.get(dr3));
    if ((Integer)lineArrayThree.get(dr3)<=height) {
      lineArrayThree.set(dr3, (Integer)lineArrayThree.get(dr3)+speed);
    } 
  }
}
void drawRectTwo() {
  for (int dr2=0; dr2<lineArrayTwo.size();dr2++) {
    if (dr2%2==0 ) {
      fill(act2);
    }
    else {
      fill(blackout);
    }
    rect(width/5, 0, width/5, (Integer)lineArrayTwo.get(dr2));
    if ((Integer)lineArrayTwo.get(dr2)<=height) {
      lineArrayTwo.set(dr2, (Integer)lineArrayTwo.get(dr2)+speed);
    } 
  }
}


