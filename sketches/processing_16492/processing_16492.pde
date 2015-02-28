
int card = 0;
PFont f;
PImage c01,c02,c03,c04,c05,c06,c062,tt1,tt2,ca2,ca3,teeth;
int x = 550;
int y = 400;
int w = 30;
int h = 30;


void setup() {
  size(600,450);
  f = loadFont("KristenITC-Regular-32.vlw");
  c01 = loadImage("c01.png");
  c02 = loadImage("c02.png");
  c03 = loadImage("c03.png");
  c04 = loadImage("c04.png");
  c05 = loadImage("c05.png");
  c06 = loadImage("c06.png");
  c062 = loadImage("c062.png");
  ca2 = loadImage("ca2.png");
  ca3 = loadImage("ca3.png");
  tt1 = loadImage("teeth1.png");
  tt2 = loadImage("teeth2.png");
  teeth = loadImage("teeth.png");
  textFont(f);
  smooth();
}


void draw() {
  noStroke();
  if (card == 0) {
    background(255);
    //first image
    image(c01,150,0,450,450);
    fill(0);
    text("Hi~ i'm a candy",190, 425);
    fill(255,0,0);
    rect (x,y,w,h);
     candy ( 270, 310, int(random(80,100)), int(random(210,230)), int(random(80,100)), int(random(370,390)),
          int(random(500,520)), int(random(210,230)), int(random(500,520)), int(random(370,390)), 0.4, 247,177,198);

 
  }
  else if (card == 1) {
    background(255);
    //second image
    image(c02,0,0);
     fill(0);
    text("I'm stronger than you! HAHA",70,425);
    fill(255,0,0);
    rect (x,y,w,h);
  
    candy ( 15,-95, int(random(80,100)), int(random(210,230)), int(random(80,100)), int(random(370,390)),
    int(random(500,520)), int(random(210,230)), int(random(500,520)), int(random(370,390)), 0.95, 247,177,198);

  
  }
  else if (card  == 2) {
    background(255);
    //third image
    image(c03,150,0,450,450);
     fill(0);
    text("Is it time to fight with you?!",90,425);
   fill(255,0,0);
    rect (x,y,w,h);
  
    candy ( 270, 390, int(random(80,100)), int(random(210,230)), int(random(80,100)), int(random(370,390)),
          int(random(500,520)), int(random(210,230)), int(random(500,520)), int(random(370,390)), 0.4, 247,177,198);

 
  }
  else if (card  == 3) {
    background(255);
    //4th image
    image(c04,125,20,350,350);
    fill(0);
    text("what a idiotic teeth?",150,425);
   fill(255,0,0);
    rect (x,y,w,h);
   image(ca2,157,149, 184.32, 116.64 );
  }
  else if (card  == 4) {
    background(255);
    //5th image
    image(c05,125,20,350,350);
    fill(0);
    text("choose a tooth to fight ! ",100,425);
    fill(255);
    ellipse(x, y, 40, 40);
//rect(265,107,39,37);    첫번째 이빨 위치
//rect(312,110,35,35);    두번째 ''
    //green teeth
    if((mouseX > 265) && (mouseX < 304) && (mouseY > 107) && (mouseY < 144)) {
    image(tt1,125,20,350,350);
      //fill(255);
  }
  else {
     //fill(180,84,116);
  }
    //yellow teeth
    if((mouseX > 312) && (mouseX < 339) && (mouseY > 110) && (mouseY < 145)) {
    image(tt2,125,20,350,350);
      //fill(255);
  }
  else {
  
    //fill(180,84,116);
  }
 
 image(ca2, 210,142, 184.32, 116.64 );
}
  
  

  else if (card  == 5) {
    background(255);
    //6 image
    image(c06,150,0,450,450);
     fill(0);
     image(ca3, 180,92, 184.32, 116.64 );
    text("delicious ^^! ",100,425);
     fill(255,0,0);
    rect (x,y,w,h);
  }
 
  else if (card  == 6) {
    background(255);
    //7th image
    image(c062,150,0,450,450);
     fill(0);
    text("OMG my teeth are all gone..",70,425);
    image(teeth,210,60,156.8,174.4);
    fill(255,0,0);
    rect (x,y,w,h);
  }
 
  else if (card == 7){
    background (10);
    fill(255);
    text("Bitter life",235,200);
  }
   
    else if (card == 8){
    background (10);
    fill(255);
    text("HA HA HA I'm win",150,200);
  }
 
  /*    else if (card  == 4) {
   pFour();
   }
   else if (card  == 5) {
   pFive();
   }
   else if (card  == 6) {
   pSix();
   }
   else if (card == 7) {
   pSeven();
   }*/
}


void mousePressed() {

  if (card == 0) {

    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 1;
    }
    else card = 0;
  }
  else if (card == 1) {

    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 2;
    }
    else card = 1;
  } 
  else if (card == 2) {

    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 3;
    }
    else card = 2;
  }
  else if (card == 3) {

    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 4;
    }
    else card = 3;
  }
 

  else if (card == 4) {
    /*if((mouseX > 265) && (mouseX < 304) && (mouseY > 107) && (mouseY < 144)) {
    card = 5;
    }*/
  
   if((mouseX > 312) && (mouseX < 339) && (mouseY > 110) && (mouseY < 145)) {
      card = 6;
    }  
    else card = 4;
  }
    
else if (card == 5) {
 if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 7;
    }
    else card = 5;
  }
 
  else if (card == 6) {
 if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 8;
    }
    else card = 5;
  }
}


 
 

 

void candy(int x, int y, int a, int b, int c, int d, int e , int f, int g, int h, float s,int i, int j , int k){
    scale(s);
    translate(x,y);
    stroke(0);
    strokeWeight(2);
  
//body
  //noStroke();
  fill(i,j,k);
  ellipse(300,300,300,300);
  triangle(a, b,150,300,c,d);
  triangle(e,f,450,300,g, h );
  fill(255);
  arc(225,280,95,100,0,3.14);
  arc(375,280,95,100,0,3.14);
 
//eyes
  float mx = constrain(mouseX,203,248);
  float my = constrain(mouseY,280,280);
  fill(0,138,255);
  arc(mx,my,50,50,0,3.14);
 
 
 
  float mp = constrain(mouseX,353,397);
  float mo = constrain(mouseY,280,280);
  arc(mp,mo,50,50,0,3.14);
 fill(0);
  line(330,280,422,280);
  line(178,280,272,280);
//mouse
stroke(147,82,82);
strokeWeight(5);
strokeCap(ROUND);
line(270,370,300,340);
line(300,340,330,370);
}



