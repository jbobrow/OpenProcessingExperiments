



/* this is my hamster Bagel! give her a treat by pressing the box marked treats and bringing it to her mouth. 
 Click and hold the dot on her tummy to watch her dance & click on the stick and watch her nibble it!
 :3
 
 */


boolean nibbling=false;
boolean cheaks=false;
boolean treats=false;
boolean nibbled=false;
color eyeColor=0;
int xpos=90;
int ypos=440;
int x2=12;
int y2=50;
int x3=24;
int ty1=0;
int ty2=0;
int shake=0;
int sxpos=450;
int sypos=300;
color BGC=255;
color dishcolor= color (63, 111, 250);
color hammycolor= color (126, 83, 66);
color stickcolor= color (160, 124, 108);

int R;
int G;
int B;

Litter [] litter= new Litter[500];
Litter [] litter2= new Litter[500];
Litter [] litter3= new Litter[500];
Litter [] litter4= new Litter[500];
Litter [] litter5= new Litter[500];
Litter [] litter6= new Litter[500];
Litter [] litter7= new Litter[800];
Litter [] litter8= new Litter[600];
Litter [] litter9= new Litter[500];
Litter [] litter10= new Litter[500];
Litter [] litter11= new Litter[500];
Litter [] litter12= new Litter[500];
Litter [] litter13= new Litter[500];
Litter [] litter14= new Litter[500];
Litter [] litter15= new Litter[500];
Litter [] litter16= new Litter[500];
Litter [] litter17= new Litter[500];
Litter [] litter18= new Litter[500];
Litter [] litter19= new Litter[500];
Litter [] litter20= new Litter[500];
Litter [] litter21= new Litter[500];
Litter [] litter22= new Litter[500];





Hammy myHammy;


void setup() {
  size(500, 500);
  myHammy= new Hammy();
}

void draw() {

  background(255);


  drawbackground();





  eyeColor=0;




  for (int i=0; i<width/25; i++) {
    fill(0);
    stroke(0);
    strokeWeight(2);
    line(i*30, 0, i*30, 300);
  }

  stroke(0);
  fill(dishcolor);
  noStroke();
  rect(24, 455, 135, 30);
  stroke(0);

  arc(92, 480, 135, 30, 0, PI, OPEN);
  line(24, 455, 24, 480);
  line(159, 455, 159, 480);

  stroke(0);
  fill(dishcolor);
  noStroke();
  rect(15, 440, 150, 20);
  stroke(0);
  ellipse(90, 440, 150, 20);
  arc(90, 460, 150, 20, 0, PI, OPEN);
  line(15, 440, 15, 460);
  line(165, 440, 165, 460);






  myHammy.drawhamster();


  if (treats==true) {
    myHammy.drawtreats(xpos, ypos);
    myHammy.move();


    if (treats==true && nibbled==false && mouseX > 190 && mouseX < 265 && mouseY > 190 && mouseY<250) {
      cheaks=true;
      nibbled=true;
      myHammy.eat();
    }
  }


  if (cheaks==true) {

    fill(126, 83, 66);
    stroke(0);
    arc(200, 200, 60, 60, PI/6, 2*PI-2*QUARTER_PI, OPEN);
    arc(300, 200, 60, 60, PI/6-3*QUARTER_PI, 3*PI-9*QUARTER_PI, OPEN);
  }

  if (mousePressed && mouseX > 240 && mouseX <260  && mouseY > 320 && mouseY<340) {

    textSize(20);
    fill(0);
    text("Merhhh", 400, 70);
    eyeColor=color (126, 83, 66);
    fill(126, 83, 66);
    arc(270, 175, 20, 30, PI, 2*PI, OPEN);
    arc(230, 175, 20, 30, PI, 2*PI, OPEN);

    if (frameCount%6==0) {
      shake=5;

      if (frameCount%5==0) {
        shake=-5;
      }

      myHammy.update();
    }
  }


  myHammy.drawstick(sxpos, sypos);

  if (nibbling==true) {
    myHammy.movestick();
    if (sxpos==270) {
      myHammy.holdstick();
      myHammy.chewstick();
    }
  }
  if (nibbling==false) {
    sxpos=450;
    sypos=300;
  }
}

class Hammy {




  void drawhamster() {



    //feet
    stroke(0);
    strokeWeight(2);
    fill(126, 83, 66);
    ellipse(300, 400, 30, 25); //foot
    ellipse(200, 400, 30, 25); //foot

    //body
    stroke(0);
    fill(126, 83, 66);
    ellipse(250+shake, 300, 190, 220); 


    //tummy
    fill(255);
    line(155+shake, 300, 345+shake, 300);
    line(170+shake, 360, 330+shake, 360);
    curve(300, 300, 345+shake, 300, 330+shake, 360, 300, 300);
    curve(200, 350, 155+shake, 300, 170+shake, 360, 200, 350);
    noStroke();
    quad(155+shake, 301, 345+shake, 301, 330+shake, 360, 170+shake, 360);
    fill(126, 83, 66);
    ellipse(250+shake, 330, 20, 20);


    //ears
    stroke(0);
    fill(226, 188, 181);
    ellipse(195, 135, 35, 35); 
    ellipse(305, 135, 35, 35); 

    //head
    fill(126, 83, 66);
    ellipse(250, 175, 120, 110); 


    //nose
    fill(126, 83, 66);
    curve(250, 100, 220, 200, 250, 200, 250, 100);
    curve(250, 100, 250, 200, 280, 200, 250, 100);

    //pinknose
    noStroke();
    fill(250, 232, 232);
    triangle(245, 200, 250, 190, 255, 200);


    //eyes

    fill(eyeColor);
    ellipse (230, 165, 10, 10);
    ellipse (270, 165, 10, 10);

    //arms
    stroke(0);
    line(195, 250, 197, 290);
    line(220, 250, 217, 290);

    fill(250, 232, 232);
    stroke(0);
    arc(207, 290, 20, 30, 0, PI, OPEN);

    line (210, 305, 210, 297);
    line (205, 305, 205, 297);

    line(275, 250, 277, 290);
    line(300, 250, 297, 290);

    stroke(0);
    arc(287, 290, 20, 30, 0, PI, OPEN);

    //finger lines
    line (290, 305, 290, 297);
    line (285, 305, 285, 297);
    //toe lines
    line(300, 412, 300, 405);
    line(307, 411, 307, 405);

    line(195, 411, 195, 405);
    line(202, 411, 202, 405);

    //fur
    line(260, 130, 270, 145);
    line(270, 145, 250, 130);
    line(240, 135, 255, 145);
    line(255, 145, 250, 130);


    //wiskers 
    fill(0);
    ellipse(230, 200, 1, 1);
    ellipse(240, 196, 1, 1);
    ellipse(238, 205, 1, 1);

    ellipse(260, 200, 1, 1);
    ellipse(270, 196, 1, 1);
    ellipse(268, 205, 1, 1);

    // ear details 

    stroke(0);
    noFill();
    arc(194, 135, 18, 25, PI-2*QUARTER_PI, PI/3+7*QUARTER_PI, OPEN);
    arc(305, 135, 18, 25, PI, PI+6*QUARTER_PI, OPEN);
  }




  void drawtreats(int xpos, int ypos) {

    fill(247, 146, 12);
    triangle(xpos, ypos, xpos+x2, ypos+y2, xpos+x3, ypos);
  }


  void eat() {

    if (nibbled==true) {
      x2=0;
      x3=0;
      y2=0;
      treats=false;
    }
  }

  void movestick() {

    sxpos=270;
    sypos=210;
  }

  void holdstick() {

    fill(250, 232, 232);
    stroke(0);
    pushMatrix();
    translate(205, 295);
    rotate(PI+2*PI/3);
    arc(0, 0, 15, 20, 0, PI, OPEN);
    popMatrix();
    stroke(0);
    fill(250, 232, 232);
    pushMatrix();
    translate(219, 296);
    rotate(PI-PI/3);
    arc(0, 0, 10, 10, 0, PI, OPEN);

    popMatrix();
  }
  void move() {

    xpos=mouseX;
    ypos=mouseY;
  }




  void update() {
    treats=false;   
    nibbled=false;
    cheaks=false;
  }

  void chewstick() {

    if (frameCount%5==0) {
      ty1=3;
      ty2=3;
    }
    if (frameCount%10==0) {
      ty1=0;
      ty2=0;
    }

    strokeWeight(.5);
    fill(255);
    rect(245, 205, 6, 10+ty1);
    rect(251, 205, 6, 10+ty2);


    strokeWeight(2);
    fill(126, 83, 66);
    curve(250, 100, 220, 200, 250, 200, 250, 100);
    curve(250, 100, 250, 200, 280, 200, 250, 100);

    fill(0);
    ellipse(230, 200, 1, 1);
    ellipse(240, 196, 1, 1);
    ellipse(238, 205, 1, 1);

    ellipse(260, 200, 1, 1);
    ellipse(270, 196, 1, 1);
    ellipse(268, 205, 1, 1);
  }
  void drawstick(int sxpos, int sypos) {
    pushMatrix();
    noStroke();
    fill(stickcolor); 
    translate(sxpos, sypos);
    rotate(2*PI/3.0);
    rect(0, 0, 140, 15);
    popMatrix();
  }
}
class Litter {

  color c;
  float Lxpos;
  float Lypos;

  Litter(color c_, float Lxpos_, float Lypos_) {

    c=c;
    Lxpos=Lxpos_;
    Lypos=Lypos_;
  }

  void display(int R, int G, int B ) {

    noStroke();
    fill(R, G, B);
    rectMode(CORNER);
    rect(Lxpos, Lypos, 25, 25);
  }
}

void drawbackground() {


  fill(179, 209, 226);
  noStroke();
  rectMode(CORNER);
  rect(0, 300, 500, 200);




  for ( int i=0; i<litter.length; i++) {
    litter[i] = new Litter (color(R, G, B), (0+i*48), (300+66*i));
  }

  for ( int i=0; i<litter2.length; i++) {
    litter2[i] = new Litter (color(R, G, B), (0+i*53), (300+41*i));
  }
  for ( int i=0; i<litter3.length; i++) {
    litter3[i] = new Litter (color(R, G, B), (0+i*35), (300+75*i));
  }

  for ( int i=0; i<litter4.length; i++) {
    litter4[i] = new Litter (color(R, G, B), (0+i*45), (300+51*i));
  }

  for ( int i=0; i<litter5.length; i++) {
    litter5[i] = new Litter (color(R, G, B), (0+i*31), (300+49*i));
  }
  for ( int i=0; i<litter6.length; i++) {
    litter6[i] = new Litter (color(R, G, B), (0+i*48), (300+47*i));
  }

  for ( int i=0; i<litter7.length; i++) {
    litter7[i] = new Litter (color(R, G, B), (500-i*38), (300+18*i));
  }

  for ( int i=0; i<litter8.length; i++) {
    litter8[i] = new Litter (color(R, G, B), (500-i*29), (300+37*i));
  }
  for ( int i=0; i<litter9.length; i++) {
    litter9[i] = new Litter (color(R, G, B), (500-i*47), (300+i*5));
  }

  for ( int i=0; i<litter10.length; i++) {
    litter10[i] = new Litter (color(R, G, B), (500-i*43), (350+i*3));
  }

  for ( int i=0; i<litter11.length; i++) {
    litter11[i] = new Litter (color(R, G, B), (500-i*39), (400+i*3));
  }
  for ( int i=0; i<litter12.length; i++) {
    litter12[i] = new Litter (color(R, G, B), (500-i*50), (450+i*2));
  }
  for ( int i=0; i<litter13.length; i++) {
    litter13[i] = new Litter (color(R, G, B), (250-i*33), (300+i*12));
  }

  for ( int i=0; i<litter14.length; i++) {
    litter14[i] = new Litter (color(R, G, B), (250-i*39), (300+i*3));
  }
  for ( int i=0; i<litter15.length; i++) {
    litter15[i] = new Litter (color(R, G, B), (275-i*50), (350+i*2));
  }
  for ( int i=0; i<litter16.length; i++) {
    litter16[i] = new Litter (color(R, G, B), (0+i*33), (350+i*12));
  }

  for ( int i=0; i<litter17.length; i++) {
    litter17[i] = new Litter (color(R, G, B), (250+i*39), (300+i*13));
  }
  for ( int i=0; i<litter18.length; i++) {
    litter18[i] = new Litter (color(R, G, B), (275+i*50), (350+i*9));
  }

  for ( int i=0; i<litter19.length; i++) {
    litter19[i] = new Litter (color(R, G, B), (300-i*29), (350+i*2));
  }
  for ( int i=0; i<litter20.length; i++) {
    litter20[i] = new Litter (color(R, G, B), (10), (350+i*30));
  }

  for ( int i=0; i<litter21.length; i++) {
    litter21[i] = new Litter (color(R, G, B), (0+i*39), (300+i*17));
  }
  for ( int i=0; i<litter22.length; i++) {
    litter22[i] = new Litter (color(R, G, B), (175+i*50), (350+i*19));
  }


  for ( int i=0; i<litter10.length; i++) {
    litter10[i].display(206, 206, 206);
  }


  for ( int i=0; i<litter11.length; i++) {
    litter11[i].display(242, 218, 236);
  }


  for ( int i=0; i<litter12.length; i++) {
    litter12[i].display(220, 236, 240);
  }

  for ( int i=0; i<litter.length; i++) {
    litter[i].display(206, 206, 206);
  }


  for ( int i=0; i<litter2.length; i++) {
    litter2[i].display(242, 218, 236);
  }


  for ( int i=0; i<litter3.length; i++) {
    litter3[i].display(220, 236, 240);
  }

  for ( int i=0; i<litter4.length; i++) {
    litter4[i].display(206, 206, 206);
  }


  for ( int i=0; i<litter5.length; i++) {
    litter5[i].display(242, 218, 236);
  }


  for ( int i=0; i<litter6.length; i++) {
    litter6[i].display(220, 236, 240);
  }

  for ( int i=0; i<litter7.length; i++) {
    litter7[i].display(206, 206, 206);
  }


  for ( int i=0; i<litter8.length; i++) {
    litter8[i].display(242, 218, 236);
  }


  for ( int i=0; i<litter9.length; i++) {
    litter9[i].display(220, 236, 240);
  }
  for ( int i=0; i<litter13.length; i++) {
    litter13[i].display(206, 206, 206);
  }


  for ( int i=0; i<litter14.length; i++) {
    litter14[i].display(242, 218, 236);
  }


  for ( int i=0; i<litter15.length; i++) {
    litter15[i].display(220, 236, 240);
  }


  for ( int i=0; i<litter16.length; i++) {
    litter16[i].display(242, 218, 236);
  }


  for ( int i=0; i<litter17.length; i++) {
    litter17[i].display(220, 236, 240);
  }
  for ( int i=0; i<litter18.length; i++) {
    litter18[i].display(206, 206, 206);
  }
  for ( int i=0; i<litter19.length; i++) {
    litter19[i].display(220, 236, 240);
  }


  for ( int i=0; i<litter20.length; i++) {
    litter20[i].display(242, 218, 236);
  }


  for ( int i=0; i<litter21.length; i++) {
    litter21[i].display(220, 236, 240);
  }
  for ( int i=0; i<litter22.length; i++) {
    litter22[i].display(206, 206, 206);
  }
}


void mousePressed() { 

  if ( treats==false && nibbled==false && cheaks==false && (get ( (int)mouseX, (int)mouseY) == dishcolor) ) {
    treats=true;
  }

  if (mousePressed && (get ( (int)mouseX, (int)mouseY) == stickcolor) ) {
    nibbling=!nibbling;
  }
}



