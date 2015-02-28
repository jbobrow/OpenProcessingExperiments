
int card = 0; 
PFont f; 
//int x = 550;
//int y = 250;
//int w = 100;
//int h = 50;
int x = 0;
int y = 430;
int w = 800;
int h = 170;


void setup() {
  size (800,600);
  f = loadFont("OCRAStd-21.vlw");
  textFont(f);
  smooth();
}

void draw() {


  if (card == 0) {   
 //background
  noStroke();
  background(247,170,209);
  //rect(0,250,800,350);
  fill(255,232,243);
  rect(0,150,800,100);
  fill(171,199,245);
  rect(0,185,800,5);
  rect(0,160,0,15);
  rect(0,75,800,75);
  rect(0,35,800,15);
  rect(0,0,800,25);
  stroke(121,171,250);
  strokeWeight(4); 
  line(0,18,800,18);
  line(0,40,800,40);
  line(0,85,800,85);
  line(0,105,800,105);
  strokeWeight(2); 
  line(0,135,800,135);
  line(0,145,800,145);
  line(0,200,800,200);
  line(0,210,800,210);
  stroke(247,170,209);
  strokeWeight(10); 
  line(0,153,800,153);
  strokeWeight(3); 
  line(0,193,800,193);
  stroke(0);
  strokeWeight(2);   
  line(0,560,900,560);
pushMatrix();
  s(30,0,1,int(random(30,50))); //int(random(50,0)));
  s(550,0,1,int(random(550,50))); //int(random(500,0)));
  s(0,300,0.5,int(random(0,20))); //int(random(0,300)));
  popMatrix();
pushMatrix();
  myEEEE(170,0,2);
  popMatrix();
pushMatrix();
 her(280,200,0.8,int(random(190,200)), int(random(2830,200)));
  popMatrix();

//  text("l",330,80);
//text("Click the box to start",width/2, height/2);
    noFill();
    noStroke();
    rect (x,y,w,h);
    PFont f;
    fill(0);
    int p = second();
    int o = minute();
    int i = hour();
    String time = nf(i,2)+":"+nf(o,2)+":"+nf(p,2);
    fill(0);
    text(time,290,50);
      fill(245,74,16);
       text("I'm alone!!!!",600,530);
  }

  else if (card == 1) {  
    //background
  noStroke();
  background(247,170,209);
  //rect(0,250,800,350);
  fill(255,232,243);
  rect(0,150,800,100);
  fill(171,199,245);
  rect(0,185,800,5);
  rect(0,160,0,15);
  rect(0,75,800,75);
  rect(0,35,800,15);
  rect(0,0,800,25);
  stroke(121,171,250);
  strokeWeight(4); 
  line(0,18,800,18);
  line(0,40,800,40);
  line(0,85,800,85);
  line(0,105,800,105);
  strokeWeight(2); 
  line(0,135,800,135);
  line(0,145,800,145);
  line(0,200,800,200);
  line(0,210,800,210);
  stroke(247,170,209);
  strokeWeight(10); 
  line(0,153,800,153);
  strokeWeight(3); 
  line(0,193,800,193);
  stroke(0);
  strokeWeight(2);   
  line(0,560,900,560);
pushMatrix();
  s(450,30,1,int(random(450,455)));//, int(random(455,30)));
  s(170,150,0.8,int(random(170,175)));//, int(random(175,150)));
  popMatrix();
pushMatrix();
  myEEEE(0,0,2);
  popMatrix();
pushMatrix();
  //her(130,220,0.75);
  her(130,220,0.75,int(random(130,220)), int(random(200,220)));
  popMatrix();
pushMatrix();
  boy(380,130,0.85);
  popMatrix();
    //text("Next Page->",width/2, height/2+20);
    int p = second();
    int o = minute();
    int i = hour();
    String time = nf(i,2)+":"+nf(o,2)+":"+nf(p,2);
    fill(0);
    text(time,120,50);
    noFill();
    noStroke();
    rect (x,y,w,h);
    PShape mmm;
    mmm = loadShape("gs.svg");
    shape(mmm,400,260,150,200);
      fill(245,74,16);
       text("BBBoooBBBooooo!!!!",530,120);
       text("BBBoooBBBooooo!!!!",530,230);
       text("BBBoooBBBooooo!!!!",530,330);
       text("BBBoooBBBooooo!!!!",530,400);
       text("BBBoooBBBooooo!!!!",530,460);
       text("BBBoooBBBooooo!!!!",530,500);
       text("BBBoooBBBooooo!!!!",530,530);
       pushMatrix();
  noCursor();
  PShape n;
  n = loadShape("bg.svg");
  translate(mouseX, mouseY);
  shape(n,0,0,250,250);
  popMatrix();
       
  } 
  else if (card  == 2) { 
    //background
  noStroke();
  background(247,170,209);
  //rect(0,250,800,350);
  fill(255,232,243);
  rect(0,150,800,100);
  fill(171,199,245);
  rect(0,185,800,5);
  rect(0,160,0,15);
  rect(0,75,800,75);
  rect(0,35,800,15);
  rect(0,0,800,25);
  stroke(121,171,250);
  strokeWeight(4); 
  line(0,18,800,18);
  line(0,40,800,40);
  line(0,85,800,85);
  line(0,105,800,105);
  strokeWeight(2); 
  line(0,135,800,135);
  line(0,145,800,145);
  line(0,200,800,200);
  line(0,210,800,210);
  stroke(247,170,209);
  strokeWeight(10); 
  line(0,153,800,153);
  strokeWeight(3); 
  line(0,193,800,193);


  stroke(0);
  strokeWeight(2);   
  line(0,560,900,560);
    
pushMatrix();
  s(400,30,1,int(random(400,30)));//, int(random(200,220)));
  s(650,150,0.8,int(random(650,150)));//, int(random(200,220)));
  popMatrix();
pushMatrix();
  myEEEE(30,140,1.5);
  popMatrix();
pushMatrix();
  PShape mmm;
    mmm = loadShape("gs.svg");
    shape(mmm,-20,340,100,100);
  popMatrix();
pushMatrix();
  boy(160,320,0.4);
  popMatrix();
pushMatrix();
  //her(110,360,0.4);
  her(110,360,0.4,int(random(110,360)), int(random(110,400)));
  popMatrix();
   // text("Next Page->",width/2, height/2+20);
   int p = second();
    int o = minute();
  //  int i = hour();
    String time = nf(o,2)+":"+nf(p,2);
    fill(0);
    text(time,130,180);
 noFill();
    noStroke();
    rect (x,y,w,h);
    PFont f;
    fill(245,74,16);
       text("Oh,Nooooo!!!!",600,120);
       text("Oh,Nooooo!!!!",600,230);
       text("Oh,Nooooo!!!!",600,330);
       text("Oh,Nooooo!!!!",600,400);
       text("Oh,Nooooo!!!!",600,460);
       text("Oh,Nooooo!!!!",600,500);
       text("Oh,Nooooo!!!!",600,530);
  pushMatrix();
  PShape n;
  n = loadShape("bgg.svg");
  translate(mouseX, mouseY);
  shape(n,0,0,250,250);
    noCursor();
  popMatrix();
  }
  else if (card  == 3) { 
    cursor();
    //background
  noStroke();
  background(247,170,209);
  //rect(0,250,800,350);
  fill(255,232,243);
  rect(0,150,800,100);
  fill(171,199,245);
  rect(0,185,800,5);
  rect(0,160,0,15);
  rect(0,75,800,75);
  rect(0,35,800,15);
  rect(0,0,800,25);
  stroke(121,171,250);
  strokeWeight(4); 
  line(0,18,800,18);
  line(0,40,800,40);
  line(0,85,800,85);
  line(0,105,800,105);
  strokeWeight(2); 
  line(0,135,800,135);
  line(0,145,800,145);
  line(0,200,800,200);
  line(0,210,800,210);
  stroke(247,170,209);
  strokeWeight(10); 
  line(0,153,800,153);
  strokeWeight(3); 
  line(0,193,800,193);

/*pushMatrix();
  s(650,20,0.8,int(random(130,220)));//, int(random(200,220)));
  popMatrix();*/
pushMatrix();
  myEEEE(0,0,4);
  popMatrix();
pushMatrix();
  boy(350,290,1.2);
  popMatrix();
pushMatrix();
 // her(200,350,1.2);
 her(180,350,1.2,int(random(280,350)), int(random(280,200)));
  popMatrix();
   // text("Next Page->",width/2, height/2+20);
   int p = second();
    int o = minute();
    int i = hour();
    String time = nf(i,2)+":"+nf(o,2)+":"+nf(p,2);
    int f = day();
    int g = month();
    int h = year();
    String tim = nf(h,2)+"."+nf(g,2)+"."+nf(f,2);
    fill(0);
    text(tim,280,80);
    text(time,300,100);
   noFill();
    noStroke();
    rect (x,y,w,h);
  
     fill(13,39,255);
       text("So Cute!!",650,530);
  }

   else if (card  == 4) {  
     //background
  noStroke();
  background(247,170,209);
  //rect(0,250,800,350);
  fill(255,232,243);
  rect(0,150,800,100);
  fill(171,199,245);
  rect(0,185,800,5);
  rect(0,160,0,15);
  rect(0,75,800,75);
  rect(0,35,800,15);
  rect(0,0,800,25);
  stroke(121,171,250);
  strokeWeight(4); 
  line(0,18,800,18);
  line(0,40,800,40);
  line(0,85,800,85);
  line(0,105,800,105);
  strokeWeight(2); 
  line(0,135,800,135);
  line(0,145,800,145);
  line(0,200,800,200);
  line(0,210,800,210);
  stroke(247,170,209);
  strokeWeight(10); 
  line(0,153,800,153);
  strokeWeight(3); 
  line(0,193,800,193);

pushMatrix();
  myEEEE(-100,-200,5);
  popMatrix();
pushMatrix();
  boy(340,230,1.5);
  popMatrix();
pushMatrix();
  //her(150,290,1.5);
  her(150,290,1.5,int(random(290,290)), int(random(0,0)));
  popMatrix();
   // text("Next Page->",width/2, height/2+20);
 noFill();
    noStroke();
    rect (x,y,w,h);
    PFont f;
     fill(245,74,16);
       text("wow.....",600,530);
     fill(13,39,255);
       text("I'm BBBoooo-Man!!!!",200,40);
   } 
   else if (card  == 5) {  
      //background
  noStroke();
  background(247,170,209);
  //rect(0,250,800,350);
  fill(255,232,243);
  rect(0,150,800,100);
  fill(171,199,245);
  rect(0,185,800,5);
  rect(0,160,0,15);
  rect(0,75,800,75);
  rect(0,35,800,15);
  rect(0,0,800,25);
  stroke(121,171,250);
  strokeWeight(4); 
  line(0,18,800,18);
  line(0,40,800,40);
  line(0,85,800,85);
  line(0,105,800,105);
  strokeWeight(2); 
  line(0,135,800,135);
  line(0,145,800,145);
  line(0,200,800,200);
  line(0,210,800,210);
  stroke(247,170,209);
  strokeWeight(10); 
  line(0,153,800,153);
  strokeWeight(3); 
  line(0,193,800,193);


  stroke(0);
  strokeWeight(2);   
  line(0,593,800,593);
pushMatrix();
  s(450,30,1,int(random(450,455)));//, int(random(200,220)));
  s(170,150,0.8,int(random(170,175)));//, int(random(200,220)));
  popMatrix();
pushMatrix();
  myEEEE(0,-50,2.3);
  popMatrix();
  pushMatrix();
  PShape mmm;
    mmm = loadShape("gs.svg");
    shape(mmm,300,290,200,200);
  popMatrix();
pushMatrix();
  boy(190,130,0.8);
  popMatrix();
pushMatrix();
  //her(110,220,0.8);
  her(110,220,0.8,int(random(200,220)), int(random(280,200)));
  popMatrix();
    //text("Next Page->",width/2, height/2+20);
    int p = second();
    int o = minute();
    int i = hour();
    String time = nf(i,2)+":"+nf(o,2)+":"+nf(p,2);
    fill(0);
    text(time,150,10);
 noFill();
    noStroke();
    rect (x,y,w,h);
    PFont f;
    fill(245,74,16);
    text("Thanks~BBooo-Man...",510,580);
   } 
   else if (card  == 6) {  
     //background
  noStroke();
  background(247,170,209);
  //rect(0,250,800,350);
  fill(255,232,243);
  rect(0,150,800,100);
  fill(171,199,245);
  rect(0,185,800,5);
  rect(0,160,0,15);
  rect(0,75,800,75);
  rect(0,35,800,15);
  rect(0,0,800,25);
  stroke(121,171,250);
  strokeWeight(4); 
  line(0,18,800,18);
  line(0,40,800,40);
  line(0,85,800,85);
  line(0,105,800,105);
  strokeWeight(2); 
  line(0,135,800,135);
  line(0,145,800,145);
  line(0,200,800,200);
  line(0,210,800,210);
  stroke(247,170,209);
  strokeWeight(10); 
  line(0,153,800,153);
  strokeWeight(3); 
  line(0,193,800,193);


pushMatrix();
  s(50,0,1,int(random(50,55)));//, int(random(200,220)));
  s(500,0,1,int(random(500,505)));//, int(random(200,220)));
  s(300,0,0.5,int(random(0,5)));//, int(random(200,220)));
  popMatrix();
pushMatrix();
  boy(350,0,2.5);
  popMatrix();
pushMatrix();
  //her(0,100,2.5);
  her(0,100,2.5,int(random(100,100)), int(random(280,200)));
  popMatrix();
   // text("Next Page->",width/2, height/2+20);
 noFill();
    noStroke();
    rect (x,y,w,h);
    PFont f;
       fill(245,74,16);
       text("Fin.",700,530);
   } 
   else if (card == 7) {  
 noFill();
    noStroke();
    rect (x,y,w,h);
    PFont f;
   }
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
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 5;
    }
    else card = 4;
  }  
  else if (card == 5) {
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 6;
    }
    else card = 5;
  } 
  else if (card == 6) {
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 7;
    }
    else card = 6;
    //card = 0;
  }
}

void boy(int z, int x, float c) {
  translate(z,x);
  scale(c);
  PShape s;
  s = loadShape("boy.svg");
  shape(s,-5,0,170,525);
//eye
  fill(255);
  noStroke();
  quad(55,140,80,140,85,150,50,150);
  quad(50,150,85,150,80,158,55,158);
  quad(100,140,125,140,130,150,95,150);
  quad(95,150,130,150,125,158,100,158);
  //eye center
  fill(67,109,255);
  ellipse(70,148,18,18);
  ellipse(110,148,18,18);
  fill(0);
  ellipse(70,148,10,10);
  ellipse(110,148,10,10);
  fill(255);
  noStroke();
  ellipse(70,146,4,4);
  ellipse(110,146,4,4);
  stroke(0); 
  strokeWeight(1);
  strokeWeight(3); 
  line(56,140,79,140);
  line(56,158,79,158);
  line(101,140,124,140);
  line(101,158,124,158);
  strokeWeight(2);
  line(55,140,50,150);
  line(50,150,55,158);
  line(80,140,85,150);
  line(85,150,80,158);
  line(100,140,95,150);
  line(95,150,100,158);
  line(125,158,130,150);
  line(130,150,125,140);
//lip
  noStroke();
  fill(252,146,127);
  quad(75,190,85,185,87,190,75,190);
  quad(87,190,90,185,100,190,87,190);
  quad(75,190,100,190,95,195,80,195);
  stroke(0); 
  strokeWeight(1);  
  line(75,190,100,190);
  line(100,190,105,185);
  line(100,180,108,185);
  line(108,185,108,188);
  line(75,190,85,185);
  line(85,185,87,190);
  line(87,190,90,185);
  line(90,185,100,190);
  line(100,190,95,195);
  line(95,195,80,195);
  line(80,195,75,190);
}
void s(int a, int s, float d,int roo) {
  translate(roo,s);
  scale(d);  
  stroke(255);
  strokeWeight(9); 
  line(0,50,75,50);
  line(10,10,65,90);
  line(50,25,10,90);
  strokeWeight(5); 
  line(125,15,160,15);
  line(140,5,140,35);
  line(150,5,130,35);
  line(25,175,65,225);
  line(55,180,35,240);
  line(25,215,70,190);
  strokeWeight(3); 
  line(145,285,165,285);
  line(160,275,150,295);
  line(150,275,160,295);
  line(115,185,135,185);
  line(130,175,120,195);
  line(120,175,130,195);  
  line(115,135,135,135);
  line(130,125,120,145);
  line(120,125,130,145);
  }
void her(int q, int w, float e,int roof,int househeight) {
  translate(q,roof);
  scale(e);  
  //hair
  stroke(255,255,80);
  fill(255,255,80);
  quad(50,10,75,0,100,0,145,35);
  quad(50,10,145,35,155,100,30,40);
  quad(30,40,155,100,155,115,20,75);
  quad(20,75,155,115,165,135,20,100);
  quad(20,100,165,135,165,150,15,125);
  quad(15,125,165,150,155,170,5,150);
  quad(5,150,155,170,155,180,5,160);
  quad(5,160,155,180,165,200,15,175);
  quad(15,175,165,200,165,210,15,185);
  quad(15,185,165,210,155,235,3,200);
  quad(3,200,155,235,155,245,3,210);
  quad(3,210,155,245,160,260,10,235);
  quad(10,235,160,260,160,300,10,245);
  quad(10,245,145,290,145,295,3,260);
  quad(140,290,160,300,150,310,145,295);
  quad(3,260,145,295,130,330,3,270);
  quad(3,270,130,330,130,340,10,290);
  quad(10,290,25,285,20,320,10,305);
  quad(15,285,35,300,35,325,30,320);
//hairline
  stroke(0);
  line(50,10,75,0);
  line(75,0,100,0);
  line(100,0,145,35);
  line(145,35,155,100);
  line(155,100,155,115);
  line(155,115,165,135);
  line(165,135,165,150);
  line(165,150,155,170);
  line(155,170,155,180);
  line(155,180,165,200);
  line(165,200,165,210);
  line(165,210,155,235);
  line(155,235,155,245);
  line(155,245,160,260);
  line(160,260,160,300);
  line(160,300,150,310);
  line(150,310,145,300);
  line(145,300,130,340);
  line(130,340,40,310);
  line(40,310,40,320);
  line(40,320,30,320);
  line(30,320,25,300);
  line(25,300,20,320);
  line(20,320,10,305);
  line(10,305,10,295);
  line(10,295,0,270);
  line(0,270,0,260);
  line(0,260,10,245);
  line(10,245,10,235);
  line(10,235,0,210);
  line(0,210,0,200);
  line(0,200,15,185);
  line(15,185,15,175);
  line(15,175,5,160);
  line(5,160,5,150);
  line(5,150,15,125);
  line(15,125,15,110);
  line(15,110,20,100);
  line(20,100,20,75);
  line(20,75,30,40);
  line(30,40,50,10); 
    //body
  PShape s;
  s = loadShape("body.svg");
  shape(s,5,166,150,255);
  
//face
  stroke(255,233,224);
  fill(255,233,224);
  quad(70,45,75,60,75,65,65,65);
  quad(53,75,75,60,75,65,55,85);
  quad(55,85,50,80,115,60,75,60);
  quad(45,90,115,60,75,60,50,80);
  quad(45,90,45,100,125,80,115,60);
  quad(45,100,60,115,125,85,125,80);
  quad(60,115,60,125,135,95,125,85);
  quad(60,125,55,130,135,105,135,95);
  quad(55,130,55,140,125,115,135,105);
  quad(55,140,65,165,125,125,125,115);
  quad(65,165,85,181,130,135,125,125);
  quad(85,181,100,181,130,145,130,135);
//eye
  //L
  fill(255);
  stroke(255);
  quad(55,110,70,110,75,115,60,115);
  quad(60,115,75,115,75,120,60,125);
  quad(60,125,75,120,80,125,55,130);
  quad(80,125,75,130,55,130,60,125);
  stroke(0);  
  strokeWeight(1);  
  line(55,105,60,110);
  line(65,105,65,110);
  line(70,110,75,105);
  line(75,115,80,110); 
  //R
  fill(255);
  stroke(255);
  quad(95,120,105,110,95,125,90,130);
  quad(95,125,100,125,120,110,105,110);
  quad(100,125,120,110,125,115,105,130);
  quad(105,130,125,115,125,120,115,130);
  stroke(0);
  strokeWeight(1);  
  line(95,110,100,115);
  line(100,105,105,110);
  line(115,105,115,110);
  line(125,105,120,110);
  //eye center
  fill(114,240,207);
  ellipse(110,120,18,18);
  ellipse(60,120,18,18);
  fill(0);
  ellipse(110,120,8,8);
  ellipse(60,120,8,8);
  strokeWeight(1);
  line(110,120,105,110);
  line(110,120,115,110);
  line(110,120,118,120);
  line(110,120,102,120);
  line(110,120,105,128);
  line(110,120,115,128);
  line(60,120,55,110);
  line(60,120,65,110);
  line(60,120,68,120);
  line(60,120,52,120);
  line(60,120,55,128);
  line(60,120,65,128);  
  fill(255);
  ellipse(110,119,5,5);
  ellipse(60,119,5,5);
  //
  strokeWeight(4);  
  line(55,111,70,111);
  strokeWeight(3); 
  line(55,131,74,131);
  strokeWeight(2);
  line(75,131,79,125);
  line(75,115,70,111);
  strokeWeight(1);
  line(80,125,75,120);
  line(75,120,75,115); 
  strokeWeight(4);
  line(105,112,120,112);
  strokeWeight(3);
  line(106,131,115,131);
  strokeWeight(2);
  line(105,131,100,125);
  line(105,111,95,120);
  line(116,131,125,120);
  line(120,111,125,115);
  line(95,125,100,125);
  strokeWeight(1);
  line(94,120,90,130);
  line(90,130,95,125);
//cheek
  noStroke();
  fill(247,209,202);
  //r
  quad(105,140,110,135,110,150,105,145);
  quad(110,135,110,150,125,150,125,135);
  quad(125,135,130,140,130,145,125,150);
  //l
  quad(55,135,65,135,70,140,55,140);
  quad(55,140,70,140,70,145,60,150);
  quad(60,150,70,140,70,145,65,150);
//nose
  stroke(0);   
  strokeWeight(1); 
  line(75,95,80,110);
  line(80,110,80,150);
  line(80,150,95,150);
  line(95,150,90,135);
  line(90,135,90,110);
  line(90,110,95,95);
  line(86,150,86,158);
  line(89,150,89,158);
//brow
  fill(162,111,102);
  quad(60,95,75,95,77,100,50,100);
  quad(95,95,115,95,120,100,93,100);
//lip
  noStroke();
  fill(252,146,127);
  quad(75,161,100,161,89,170,85,170);
  quad(85,158,87,163,87,165,75,161);
  quad(87,163,90,158,100,161,87,165);
  stroke(0); 
  strokeWeight(1);  
  line(75,159,75,165);
  line(100,159,100,165);
  line(75,161,87,165);
  line(87,165,100,160);
//faceline
  line(70,45,75,60);
  line(75,60,115,60);
  line(115,60,125,80);
  line(125,73,125,85); 
  line(125,73,130,65);
  line(130,65,130,55);
  line(125,85,135,95);
  line(135,95,135,105);
  line(135,105,125,115);
  line(125,115,125,125);
  line(125,125,130,135);
  line(130,135,130,175);
  line(130,175,120,185);
  line(120,185,120,193);
  line(130,145,100,181);
  line(100,181,85,181);
  line(85,181,65,165);
  line(65,165,60,175);
  line(60,175,60,185);
  line(65,165,55,140);
  line(55,140,55,130);
  line(60,115,45,100);
  line(45,100,45,90);
  line(45,90,45,80);
  line(45,80,38,72);
  line(38,72,38,65);
  line(45,90,50,80);
  line(50,80,55,73);
  line(55,73,65,65);
  line(65,65,70,45);
}
void myEEEE(int x, int y, float s) {
  translate(x,y);
  scale(s);
  strokeWeight(1);
  stroke(0);
  //bottom line
  line(0,280,30,280);
  line(150,280,200,280);
  //basic line
  line(20,50,20,280);
  line(30,50,30,280);
  line(60,90,120,90);
  line(160,50,160,280);
  line(150,50,150,280);
  line(40,270,140,270);
  line(60,90,60,230);
  line(120,90,120,230);
  line(60,230,120,230);
  line(60,230,40,260);
  line(120,230,140,260);
  //ZangSic line
  line(80,90,80,230);
  line(100,90,100,230);
  line(65,50,80,90);
  line(115,50,100,90);
  line(60,225,120,225);
  line(40,60,140,60);
  line(35,57,145,57);
  line(53,80,127,80);
  fill(255);
  rect(60,10,60,20);
  rect(170,140,20,40);
  quad(110,160,110,170,130,180,130,170);
  quad(50,170,50,180,70,170,70,160);
  rect(40,170,10,10);
  rect(130,170,10,10);
  fill(0);
  ellipse(30,30,5,5);
  ellipse(50,30,5,5);
  ellipse(130,30,5,5);
  ellipse(150,30,5,5);
  rect(20,40,140,10);
  quad(30,53,40,65,40,270,30,280);
  quad(140,65,150,50,150,280,140,270);
  quad(40,170,50,170,70,160,60,160);
  quad(110,160,120,160,140,170,130,170);
  //button
  ellipse(180,150,8,8);
  ellipse(180,170,8,8);
  fill(255);
  ellipse(180,150,5,5);
  ellipse(180,170,5,5);
  //up
  fill(255,0,0);
  ellipse(180,60,14,14);
  ellipse(180,60,9,9);
  //down
  fill(0,255,0);
  ellipse(180,90,14,14);
  ellipse(180,90,9,9);
  strokeWeight(3);
  line(30,50,60,90);
  line(150,50,120,90);
}

