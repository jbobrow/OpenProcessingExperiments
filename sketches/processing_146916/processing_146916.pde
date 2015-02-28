
//Musica per JAVASCRIPT
var audioElement = document.createElement("audio");


//Cara Homer
float x;
float y;
float v= random(-8, 6);
float vy= random(-8, 4);
int mida= 20;

PImage img;


//Com posar musica per JAVA

/*import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;

float eRadius;
*/


//Rosquilla gran
float x1;
float y1;
float v1= random(-8, 6);
float vy1= random(-8, 6);
float color1= random (255);
float color2= random (255);
float color3= random (255);


int Homers = 6;
int a;
int b;
int c;
int d;
int i;
int HomerControlat;

//creem una matriu de posicionsX con "Homers" elements:
float[] posX = new float[Homers];

float[] posY = new float[Homers];

float[] velX = new float[Homers];

float[] velY = new float[Homers];



void setup() {
  size(700, 700);
  rectMode(CENTER);
  
  //Musica per JAVA
  /*
  minim = new Minim (this);
  song = minim.loadFile("The Simpsons theme song ( full song!).mp3",2048);
  song.play();
  beat = new BeatDetect();

  eRadius = 20;  
   
  */
  
  
 // i dibuixem el cotxe
   

  noCursor(); 
  img = loadImage("ngbbs50a2fdb012334.jpg");
  
  a=10;
  b=10;
  c=10;
  d=10;
  i=0;

  //inicialitzem posicions i:
  for (int i = 0; i<Homers; i++) {
    posX[i] = width/2;
    posY[i] = height/2;
    velX[i]= random(-a, b);
    velY[i]= random(-c, d);
  }
}


void draw() {
  fons();
     scale(2);
     image(img,0,0);
     scale(0.5);
     
     //Musica per JAVA
     /*
     beat.detect(song.mix);
     */
     
     //Musica per JAVASCRIPT
     audioElement.setAttribute("src", "The Simpsons theme song ( full song!).mp3");
     audioElement.play();

  //iniciem un bucle perque faci les mateixes accions
  //a tots els valors de les matrius
  for (i = 0; i<Homers; i++) {

    posX[i] += velX[i];
    posY[i] += velY[i];


  //comprobem limits X
  if(((posX[i]-55)<=0)||((posX[i]+55)>=width)) {
    velX[i]= -velX[i];
  }
  else {
    velX[i]= random(-a, b);
  }

  //comprobem limits Y

  if (((posY[i]-50)<=0)||((posY[i]+50)>=height)) {
    velY[i] = -velY[i];
  }
  else {
    velY[i]= random(-c, d);
  }

  dibuix2();
  baba();
  dibuix3();
  velocitat();
  movement();
  limits();
  

  }
}

void fons() {
  background((50), (178), (168));
  fill(0, 10);
  noStroke();
  rect(width/2, height/2, width, height);
  fill(random(255), random(0), 0);  
  strokeWeight(22);
  textSize(54);
  textAlign(CENTER);
  text("The Simpsons", width/2-160, height/2+330);
  textSize(44);
  fill(color1, color2, color3);
  strokeWeight(42);
  text("Homer", width/2+260, height/2+330);


  //rosquilles
  fill(232, 124, 221);
  stroke(232, 124, 221);
  ellipse(150, 100, 100, 100);
  ellipse(350, 100, 100, 100);
  ellipse(550, 100, 100, 100);

  ellipse(150, 550, 100, 100);
  ellipse(350, 550, 100, 100);
  ellipse(550, 550, 100, 100);

  fill(50, 178, 168);
  noStroke();
  ellipse(150, 100, 40, 40);
  ellipse(350, 100, 40, 40);
  ellipse(550, 100, 40, 40);

  ellipse(150, 550, 40, 40);
  ellipse(350, 550, 40, 40);
  ellipse(550, 550, 40, 40);

  //sucre
  stroke(252, 241, 15);
  strokeWeight(5);
  line(120, 80, 123, 83);
  line(320, 120, 323, 123);
  line(523, 110, 520, 113);

  line(130, 530, 133, 533);
  line(323, 530, 320, 533);
  line(540, 583, 543, 580);
  //
  stroke(42, 252, 15);
  line(113, 115, 110, 118);
  line(343, 70, 340, 73);
  line(550, 130, 553, 133);

  line(163, 580, 160, 583);
  line(355, 580, 358, 583);
  line(550, 520, 553, 523);
  //
  stroke(255, 255, 255);
  line(173, 125, 170, 128);
  line(380, 100, 383, 103);
  line(580, 100, 583, 103);

  line(180, 550, 183, 553);
  line(385, 550, 388, 553);
  line(588, 565, 585, 568);
  //
  stroke(255, 0, 4);
  line(185, 100, 188, 103);
  line(363, 135, 360, 138);
  line(550, 65, 553, 68);

  line(163, 515, 160, 518);
  line(323, 565, 326, 568);
  line(518, 550, 521, 553);
  //
  stroke(110, 141, 252);
  line(163, 70, 160, 73);
  line(372, 65, 375, 68);
  line(523, 76, 520, 79);

  line(133, 570, 130, 573);
  line(370, 520, 373, 523);
  line(585, 532, 588, 535);
  //
  stroke(255, 167, 3);
  line(140, 135, 143, 138);
  line(315, 90, 318, 93);
  line(581, 73, 578, 76);

  line(113, 550, 110, 553);
  line(348, 510, 345, 513);
  line(523, 520, 520, 523);
  //

  fill(random(255), random(0), 0);  
  strokeWeight(22);
  textSize(45);
  textAlign(CENTER);
  text("The Simpsons", width/2, height/2);
  textSize(30);
  fill(color1, color2, color3);
  strokeWeight(32);
  text("Homer", width/2+100, height/2+30);
}

void mousePressed() {
posX[HomerControlat]=(mouseX);//en funcio de la posició X on cliques, el cotxe canvia a una posició X o una altra
posY[HomerControlat]=(mouseY);//en funcio de la posició Y on cliques, el cotxe canvia a una posició Y o una altra
 
 if(mouseX<55){
  posX[HomerControlat]=mouseX+55;
 }
 
 if(mouseY<50){
  posY[HomerControlat]=mouseY+50;
 }
 
 if(mouseX>width-55){
  posX[HomerControlat]=mouseX-55;
 }
 
 if(mouseY>height-50){
  posY[HomerControlat]=mouseY-55;
 }

 /* x=mouseX;
  y=mouseY;

  v=random(-5, 5);
  vy=random(-5, 5);

  v1=random(-8, 8);
  vy1=random(-8, 8);*/

  color1=random (255);
  color2= random (255);
  color3= random (255);
}



//Homer
void dibuix2 () {
  noFill();
  stroke(0);
  strokeWeight(1.5);
  ellipse(posX[i], posY[i]-70, 75, 75);
  ellipse(posX[i], posY[i]-70, 60, 60);

  //front
  stroke(247, 225, 20);
  strokeWeight(2);
  fill(247, 225, 20);
  ellipse(posX[i], posY[i]-10, 180, 160);

  //cara
  rect(posX[i], posY[i]+50, 180, 130);

  //parpelles
  ellipse(posX[i]-72, posY[i]+39, 50, 50);
  ellipse(posX[i]+72, posY[i]+39, 50, 50);

  //orelles
  stroke(247, 225, 20);
  ellipse(posX[i]-80, posY[i]+130, 50, 40);
  ellipse(posX[i]+80, posY[i]+130, 50, 40);
  rect(posX[i], posY[i]+120, 180, 130);

  //ulls
  fill(255, 255, 255);
  stroke(0, 0, 0);
  strokeWeight(1.6);
  ellipse(posX[i]-50, posY[i]+75, 90, 90);
  ellipse(posX[i]+50, posY[i]+75, 90, 90);

  //pupil·les
  noStroke();
  fill(color1, color2, color3);
  ellipse(posX[i]-58, posY[i]+75, 15, 15);
  ellipse(posX[i]-46, posY[i]+75, 15, 15);
  ellipse(posX[i]+58, posY[i]+75, 15, 15);
  ellipse(posX[i]+46, posY[i]+75, 15, 15);

  triangle(posX[i]-63, posY[i]+80, posX[i]-41, posY[i]+80, posX[i]-52, posY[i]+86);
  triangle(posX[i]+63, posY[i]+80, posX[i]+41, posY[i]+80, posX[i]+52, posY[i]+86);


  //barba
  stroke(134, 90, 7);
  strokeWeight(2.5);
  fill(178, 138, 63);
  ellipse(posX[i], posY[i]+185, 180, 130);

  //nas
  stroke(0, 0, 0);
  strokeWeight(1.5);
  fill(247, 225, 20);
  ellipse(posX[i], posY[i]+110, 40, 40);
  stroke(247, 225, 20);
  rect(posX[i], posY[i]+90, 10, 6);

  //boca
  fill(255, 255, 255);
  stroke(255, 255, 255);
  stroke(134, 90, 7);
  ellipse(posX[i], posY[i]+192, 130, 70);



  fill(178, 138, 63);
  stroke(178, 138, 63);
  ellipse(posX[i], posY[i]+165, 160, 57);

  rect(posX[i]-62, posY[i]+200, 16, 40);
  rect(posX[i]+62, posY[i]+200, 20, 40);



  stroke(0, 0, 0);
  fill(255, 255, 255);
  stroke(255, 255, 255);



  fill(178, 138, 63);
  stroke(178, 138, 63);
  ellipse(posX[i]-64, posY[i]+188, 40, 5);
  ellipse(posX[i]+64, posY[i]+188, 40, 5);


  ellipse(posX[i]-60, posY[i]+180, 15, 18);
  ellipse(posX[i]+60, posY[i]+180, 15, 18);


  fill(255, 255, 255);
  stroke(255, 255, 255);
  ellipse(posX[i]-46, posY[i]+202, 22, 22);
  ellipse(posX[i]+44, posY[i]+203, 22, 22);

  fill(178, 138, 63);
  stroke(178, 138, 63);
  ellipse(posX[i]-53.3, posY[i]+184, 15, 15);
  ellipse(posX[i]+53.3, posY[i]+185.2, 15, 15);


  ellipse(posX[i]+43, posY[i]+182.8, 15, 15);

  //dents
  stroke(0, 0, 0);
  strokeWeight(1.5);
  line(posX[i]-44, posY[i]+190, posX[i]-44, posY[i]+217.5);
  line(posX[i]+42, posY[i]+191, posX[i]+42, posY[i]+217);
  line(posX[i]+16, posY[i]+193, posX[i]+16, posY[i]+225);
  line(posX[i]-16, posY[i]+193, posX[i]-16, posY[i]+225);

  //orelles per dins
  stroke(0, 0, 0);
  noFill();
  ellipse(posX[i]+90, posY[i]+130, 20, 20);
  ellipse(posX[i]-90, posY[i]+130, 20, 20);

  fill(247, 225, 20);
  stroke(247, 225, 20);
  rect(posX[i]-85, posY[i]+130, 12, 22);
  rect(posX[i]+85, posY[i]+130, 12, 22);
  rect(posX[i]+96, posY[i]+137, 12, 6);
  rect(posX[i]-96, posY[i]+137, 12, 6);

  stroke(0, 0, 0);
  noFill();
  line(posX[i]-97, posY[i]+125, posX[i]-90, posY[i]+130);
  line(posX[i]+97, posY[i]+125, posX[i]+90, posY[i]+130);

  fill(255, 5, 5);
}


//baba
void baba() {
  if (posX[i]>=width/2-250 && velX[i] >0) {
    fill(255, 255, 255);
    noStroke();
    ellipse(posX[i]+58, posY[i]+210, 14, 24);
    ellipse(posX[i]+52, posY[i]+199, 22, 22);
    ellipse(posX[i]-52, posY[i]+198, 22, 22);

    ellipse(posX[i]+58, posY[i]+240, 14, 14);
    triangle(posX[i]+50, posY[i]+240, posX[i]+66, posY[i]+240, posX[i]+58, posY[i]+224);

    stroke(0, 0, 0);
    strokeWeight(1.5);
    line(posX[i]-44, posY[i]+190, posX[i]-44, posY[i]+217.5);
    line(posX[i]+42, posY[i]+191, posX[i]+42, posY[i]+217);
    line(posX[i]+16, posY[i]+193, posX[i]+16, posY[i]+225);
    line(posX[i]-16, posY[i]+193, posX[i]-16, posY[i]+225);
  }

  if (posY[i]<=width/2+250 && velY[i]>0) {
    fill(255, 0, 0);
    noStroke();
    ellipse(posX[i]+60, posY[i]+130, 50, 20);
    ellipse(posX[i]-60, posY[i]+130, 50, 20);
  }

  if (posY[i]<=width+200 && velX[i]>0) {
    fill(247, 225, 20);
    stroke(0);
    arc(posX[i]-50, posY[i]+68, 90, 90, PI, TWO_PI);
    arc(posX[i]+50, posY[i]+68, 90, 90, PI, TWO_PI);
  }
}

//Cervesa
void dibuix3() {

  if (mouseX < width/3) {
    fill(90, 52, 13);
    noStroke();
    rect(mouseX, mouseY+40, 80, 140);
    fill(90, 52, 13);
    noStroke();
    rect(mouseX, mouseY-20, 30, 200);
    triangle(mouseX-40, mouseY-30, mouseX, mouseY-30, mouseX, mouseY-70);
    triangle(mouseX+40, mouseY-30, mouseX, mouseY-30, mouseX, mouseY-70);
    fill(255, 0, 0);
    noStroke();
    rect(mouseX, mouseY+40, 80, 100);
    rect(mouseX, mouseY-90, 30, 40);
    stroke(0, 0, 0);
    fill(255, 255, 255);
    rect(mouseX, mouseY+40, 70, 40);
    textSize(30);
    fill(0, 0, 0);
    strokeWeight(18);
    text("Duff", mouseX, mouseY+50);
    textSize(16);
    strokeWeight(10);
    text("B E E R", mouseX, mouseY+80);
    fill(255, 255, 255);
    strokeWeight(1);
    rect(mouseX, mouseY-90, 24, 16);
    fill(0, 0, 0);
    textSize(10);
    text("Duff", mouseX, mouseY-85);
    fill(144, 97, 7);
    noStroke();
    rect(mouseX, mouseY-122, 32, 6);
    fill(90, 52, 13);
    noStroke();
    ellipse(mouseX-9, mouseY-116, 11, 11);
    ellipse(mouseX, mouseY-116, 11, 11);
    ellipse(mouseX+9, mouseY-116, 11, 11);
    fill(color1, color2, color3);
    textSize(20);
    text("I am", mouseX, mouseY+13);
  } 
  else if (mouseX < (width/3)*2) {
    fill(90, 52, 13);
    noStroke();
    rect(mouseX, mouseY+40, 80, 140);
    fill(90, 52, 13);
    noStroke();
    rect(mouseX, mouseY-20, 30, 200);
    triangle(mouseX-40, mouseY-30, mouseX, mouseY-30, mouseX, mouseY-70);
    triangle(mouseX+40, mouseY-30, mouseX, mouseY-30, mouseX, mouseY-70);
    fill(255, 0, 0);
    noStroke();
    rect(mouseX, mouseY+40, 80, 100);
    rect(mouseX, mouseY-90, 30, 40);
    stroke(0, 0, 0);
    fill(255, 255, 255);
    rect(mouseX, mouseY+40, 70, 40);
    textSize(30);
    fill(0, 0, 0);
    strokeWeight(18);
    text("Duff", mouseX, mouseY+50);
    textSize(16);
    strokeWeight(10);
    text("B E E R", mouseX, mouseY+80);
    fill(255, 255, 255);
    strokeWeight(1);
    rect(mouseX, mouseY-90, 24, 16);
    fill(0, 0, 0);
    textSize(10);
    text("Duff", mouseX, mouseY-85);
    fill(144, 97, 7);
    noStroke();
    rect(mouseX, mouseY-122, 32, 6);
    fill(90, 52, 13);
    noStroke();
    ellipse(mouseX-9, mouseY-116, 11, 11);
    ellipse(mouseX, mouseY-116, 11, 11);
    ellipse(mouseX+9, mouseY-116, 11, 11);
    fill(255, 191, 72);
    textSize(20);
    text("Homer's", mouseX, mouseY+12);
  }
  else {
    fill(90, 52, 13);
    noStroke();
    rect(mouseX, mouseY+40, 80, 140);
    fill(90, 52, 13);
    noStroke();
    rect(mouseX, mouseY-20, 30, 200);
    triangle(mouseX-40, mouseY-30, mouseX, mouseY-30, mouseX, mouseY-70);
    triangle(mouseX+40, mouseY-30, mouseX, mouseY-30, mouseX, mouseY-70);
    fill(255, 0, 0);
    noStroke();
    rect(mouseX, mouseY+40, 80, 100);
    rect(mouseX, mouseY-90, 30, 40);
    stroke(0, 0, 0);
    fill(255, 255, 255);
    rect(mouseX, mouseY+40, 70, 40);
    textSize(30);
    fill(random(255), random(255), random(255));
    strokeWeight(18);
    text("Duff", mouseX, mouseY+50);
    textSize(16);
    strokeWeight(10);
    text("B E E R", mouseX, mouseY+80);
    fill(255, 255, 255);
    strokeWeight(1);
    rect(mouseX, mouseY-90, 24, 16);
    fill(0, 0, 0);
    textSize(10);
    text("Duff", mouseX, mouseY-85);
    fill(144, 97, 7);
    noStroke();
    rect(mouseX, mouseY-122, 32, 6);
    fill(90, 52, 13);
    noStroke();
    ellipse(mouseX-9, mouseY-116, 11, 11);
    ellipse(mouseX, mouseY-116, 11, 11);
    ellipse(mouseX+9, mouseY-116, 11, 11);
    fill(color1, color3, color2);
    textSize(20);
    text("DESIRE!", mouseX, mouseY+13);
  }
}

void velocitat() {
  //x=x+v;
  //y=y+vy;

  x1=x1+v1*2;
  y1=y1+vy1;
}

void movement() {
  //random walker
  float r = random (100);

  if (r<35) {
    x=x+v;
  }
  else if (r<50) {
    x=x-v;
  }
  else if (r<8) {
    y=y-vy;
  }
  else if (r<100) {
    y=y+vy;
  }
}


void limits() {
  if (x<-71) {
    x=width+75;
  }
  if (x>width+75) {
    x=-71;
  }


  if (y<-253) {
    y=height+55;
  }
  if (y>height+55) {
    y=-253;
  }
}




