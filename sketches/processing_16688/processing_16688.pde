
PImage img1;
PImage img2;
PFont f;
PFont ff;
PFont t;
PFont e;
float speed = 100;
int diameter = 20;
float M;
float L;
float angle = 0.0;
float oo = 1;
float oa = 1;

int card = 0; 

int xx = 570;
int yy = 570;
int ww = 30;
int hh = 30;


void setup() {
  size(600,600);
  background(0);
  f = loadFont("SnapITC-Regular-48.vlw");
  ff = loadFont("RixGrimmM-48.vlw");
  e = loadFont("28DaysLater-90.vlw");
  L = width/2;
  M = height/2;
}
void startwo(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  beginShape();  
  smooth();  
  noStroke();  


  fill(200,230,30);  
  vertex(200,315);  
  vertex(300,300);  
  vertex(350,200);  
  vertex(398,300);  
  vertex(500,315);  
  vertex(420,380);  
  vertex(430,480);  
  vertex(352,425);  
  vertex(270,480);  
  vertex(282,380);  
  vertex(200,315);  
  endShape();  

  fill(0);  
  //ellipse(320,320,20,20);  
  //ellipse(382,320,20,20);  
  ellipse(320,320,30,5);
  ellipse(382,320,30,5);

  fill(250,0,0);
  //ellipse(350,370,20,20);
  ellipse(350,370,60,10);


  fill(255);
  // ellipse(325,315,7,7);
  // ellipse(387,315,7,7);
  popMatrix();
}
void treesil(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  fill(0);
  smooth();
  noStroke();
  ellipse(125,220,70,70);
  ellipse(75,190,90,95);
  ellipse(191,190,130,120);
  ellipse(150,120,150,90);
  ellipse(160,150,190,50);
  ellipse(121,100,110,90);
  ellipse(90,130,90,50);
  ellipse(115,190,90,90);


  beginShape();
  smooth();
  noStroke();
  fill(0);
  vertex(100,350);
  vertex(110,320);
  vertex(111,250);
  vertex(115,245);
  vertex(120,180);
  vertex(127,220);
  vertex(131,270);
  vertex(138,300);
  vertex(143,350);
  vertex(100,350);
  endShape();


  popMatrix();
}
void foxil(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  beginShape();
  smooth();
  noStroke();
  fill(0);
  vertex(100,100);
  vertex(120,140);
  vertex(140,140);
  vertex(160,100);
  vertex(200,180);
  vertex(130,250);
  vertex(60,180);
  vertex(100,100);

  vertex(130,250);
  vertex(185,450);
  vertex(190,350);
  vertex(200,300);
  vertex(220,350);
  vertex(185,450);
  vertex(85,450);
  vertex(130,250);



  endShape();

  beginShape();
  fill(0);
  noStroke();
  smooth();
  vertex(100,110);
  vertex(100,140);
  vertex(80,140);
  vertex(100,110);

  vertex(160,110);
  vertex(160,140);
  vertex(180,140);
  vertex(160,110);
  endShape();

  fill(0);
  smooth();
  noStroke();
  ellipse(110,170,5,5);
  ellipse(150,170,5,5);

  fill(0);
  smooth();
  noStroke();
  ellipse(80,180,30,10);
  ellipse(180,180,30,10);
  popMatrix();
} 

void Oopstar(int gg, int transX, int transY, float s ) {  
  pushMatrix();  
  translate(transX,transY);  
  scale(s);
  beginShape();  
  smooth();  
  noStroke();  
  fill(250,230,0);  
  vertex(200,315);  
  vertex(300,300);  
  vertex(350,200);  
  vertex(398,300);  
  vertex(500,315);  
  vertex(420,380);  
  vertex(430,480);  
  vertex(352,425);  
  vertex(270,480);  
  vertex(282,380);  
  vertex(200,315);  
  endShape();  

  fill(255);  
  ellipse(320,320,20,20);  
  ellipse(382,320,20,20);  
  fill(250,0,0);
  ellipse(352,380,20,50);  

  fill(0);  
  noStroke();  
  ellipse(gg,320,7,7);  
  ellipse(gg,320,7,7);  
  popMatrix();
} 
void fox(int x, int y, float s) {  
  pushMatrix();
  translate(x,y);
  scale(s);
  beginShape();
  smooth();
  noStroke();
  fill(255,200,80);
  vertex(100,100);
  vertex(120,140);
  vertex(140,140);
  vertex(160,100);
  vertex(200,180);
  vertex(130,250);
  vertex(60,180);
  vertex(100,100);

  vertex(130,250);
  vertex(185,450);
  vertex(190,350);
  vertex(200,300);
  vertex(220,350);
  vertex(185,450);
  vertex(85,450);
  vertex(130,250);



  endShape();

  beginShape();
  fill(255);
  noStroke();
  smooth();
  vertex(100,110);
  vertex(100,140);
  vertex(80,140);
  vertex(100,110);

  vertex(160,110);
  vertex(160,140);
  vertex(180,140);
  vertex(160,110);
  endShape();

  fill(0);
  smooth();
  noStroke();
  ellipse(110,170,5,5);
  ellipse(150,170,5,5);

  fill(248,160,20);
  smooth();
  noStroke();
  ellipse(80,180,30,10);
  ellipse(180,180,30,10);
  popMatrix();
} 
void tree(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  fill(20,180,150);
  smooth();
  noStroke();
  ellipse(125,220,70,70);
  ellipse(75,190,90,95);
  ellipse(191,190,130,120);
  ellipse(150,120,150,90);
  ellipse(160,150,190,50);
  ellipse(121,100,110,90);
  ellipse(90,130,90,50);
  ellipse(115,190,90,90);


  beginShape();
  smooth();
  noStroke();
  fill(127,90,0);
  vertex(100,350);
  vertex(110,320);
  vertex(111,250);
  vertex(115,245);
  vertex(120,180);
  vertex(127,220);
  vertex(131,270);
  vertex(138,300);
  vertex(143,350);
  vertex(100,350);
  endShape();


  popMatrix();
}
void star(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  beginShape();  
  smooth();  
  noStroke();  


  fill(250,230,0);  
  vertex(200,315);  
  vertex(300,300);  
  vertex(350,200);  
  vertex(398,300);  
  vertex(500,315);  
  vertex(420,380);  
  vertex(430,480);  
  vertex(352,425);  
  vertex(270,480);  
  vertex(282,380);  
  vertex(200,315);  
  endShape();  

  fill(0);  
  ellipse(320,320,20,20);  
  ellipse(382,320,20,20);  



  fill(250,0,0);
  ellipse(350,370,20,20);


  fill(255);
  ellipse(325,315,7,7);
  ellipse(387,315,7,7);
  popMatrix();
} 
void draw() {
  background(0);
  smooth();
  noStroke();

  if (card == 0) {

    fill(255,0,0);
    rect (xx,yy,ww,hh);
    fill(255);
    textFont(ff);
    textSize(48);
    text("start",480, 600);
    smooth();  

    textFont(f);
    textSize(48);

    fill(255);
    text("Oops    tar",142,300);

    textFont(ff);
    textSize(24);
    fill(255);
    text("Hello! I am Oopstar.",215,400);
    text("I love SOMETHING AMAZING!",165,425);
    text("Let's get started.", 226,450);

    textSize(48);
    fill(250,250,0);
    text("Oopstar's trip had BEGUN!",85,490);

    star(207,180,0.3);
  }



  else if (card == 1) {  
    background(255);
    img1 = loadImage("back.png");
    img2 = loadImage("Oopsback.png");


    smooth();
    image(img1,0,0);


    textFont(ff);
    textSize(24);
    fill(0);
    text("I'm very excited!",130,390);
    text("I want to see ",180,420);


    if((mouseX > 285) && (mouseX < 400) && (mouseY > 400) && (mouseY < 430)) {
      fill(255,0,0);
    }
    else {
      fill(24,20,250);
    }
    text("SOMETHING",295,420);

    if((mouseX > 400) && (mouseX < 515) && (mouseY > 400) && (mouseY < 430)) {
      fill(0,255,30);
    }
    else {
      fill(230,10,100);
    }
    text("AMAZING.", 410,420);



    textSize(20);
    fill(150);
    text("Select What you want",380, 400);


    star(-70,320,0.5);
  } 

  else if (card ==10) {

    smooth();
    startwo(150,150,0.8);

    textFont(ff);
    textSize(48);
    fill(255);
    text("S..OMETHING?",60,360);
    textSize(24);
    fill(200,230,30);
    text("I don't wanna see just something.",60,380);

    fill(0);
    rect(60,430,270,20);
    rect(60,460,270,20);

    if ((mouseX > 60) && (mouseX < 320) && (mouseY > 430) && (mouseY < 450)) {
      fill(255);
    }
    else {
      fill(240,200,0);
    }
    text("Sorry, I'll select again.", 60,450);

    if ((mouseX > 60)&& (mouseX < 320) && (mouseY > 460) && (mouseY < 480)) {
      fill(255);
    }
    else 
    {
      fill(250,0,0);
    }
    text("WHY?! What's wrong with that?", 60,480);
  }


  else if (card == 11) {
    // fill(255);
    // rect(160,520,100,30);
    // rect(350,520,100,30);
    background(255);
    foxil(160,30,1);
    textFont(ff);
    textSize(24);
    fill(150);
    text("Please select the answer.", 195,70);
    fill(0);
    textSize(48);
    text("What's it?", 215,105);


    if((mouseX > 160) && (mouseX < 260) && (mouseY > 520) && (mouseY < 550)) {
      fill(255,0,0);
    }
    else {
      fill(0);
    }
    text("Fox", 175,555);

    if ((mouseX > 350) && (mouseX < 450) && (mouseY > 520) && (mouseY < 550)) {
      fill(255,0,0);
    }
    else {
      fill(0);
    }
    text("Cat", 370,555);
  }
  else if (card == 12) {
    background(255);
    treesil(160,130,1);
    textFont(ff);
    textSize(24);
    fill(150);
    text("Please select the answer.", 200,70);
    fill(0);
    textSize(48);
    text("What's it?", 215,105);

    if ((mouseX > 160) && (mouseX < 260) && (mouseY > 520) && (mouseY < 550)) {
      fill(255,0,0);
    }
    else {
      fill(0);
    }
    text("Tree", 170,555);


    if ((mouseX > 330) && (mouseX < 560) && (mouseY > 520) && (mouseY < 550)) {
      fill(255,0,0);
    }
    else {
      fill(0);
    }
    text("Flower", 340,555);
  }

  else if (card == 13) {

    float sinval = sin(angle);

    float gray = map(sinval, -1, 1, 0, 255);

    background(gray);
    angle += 0.1;

    frameRate(100);

    startwo(-45,-35,oo);
    startwo(300,600,-oa);
    oo = oo + 0.01;
    oa = oa - 0.01;
    if(oo > 1) {
      oo = 0.1;
    }
    if(oa < -1) {
      oa = 0.1;
    }


    t = loadFont("28DaysLater-90.vlw");
    textFont (t);
    textSize(90);
    fill(255,0,0);
    text("YOU ",0,300);
    text("MAKE ", 0,400);
    text(" ME", 0, 500);
    text("CRAZY", 0, 600);
    textSize(48);
    text("restart",400, 600);
    fill(255);
    rect(xx, yy, ww, hh);
  }

  else if (card == 14) {

    smooth();
    startwo(35,150,0.8);
    textFont(e);
    textSize(36);
    text("You are WRONG.", 200,300);
    if ((mouseX > 0) && (mouseX < 80) && (mouseY > 560) && (mouseY < 600)) {
      fill(255,0,0);
    }
    else {
      fill(255);
    }
    text("BACK",0,600);
  }


  else if (card  == 2) {  
    background(0);
    smooth();
    image(img1,0,0);

    star(120,420,0.2);
    fox(280,-160,1.6);  

    textFont(ff);
    textSize(24);
    fill(0);
    text("Get closer, closer...",110,120);
    text("closer...",80,140);
    text("closer...WOW!",180,220);
    textSize(48);
    text("oh, my GOD!", 150,400);
    text("Extra Large FOX!", 100,440);
    fill(0);
    text("Next",480, 600);
    fill(255, 0, 0);
    rect(xx, yy, ww, hh);
  }

  else if (card ==15) {
    L += random(-speed, speed);
    M += random(-speed, speed);
    ellipse(L,M, diameter, diameter);
    smooth();
    startwo(35,150,0.8);
    textFont(e);
    textSize(36);
    text("You are WRONG, AGAIN", 200,300);


    if ((mouseX > 0) && (mouseX < 80) && (mouseY > 560) && (mouseY < 600)) {
      fill(255,0,0);
    }
    else {
      fill(255);
    }
    text("BACK",0,600);
  }




  else if (card  == 3) { 
    background(0);

    smooth();




    image(img1,0,0);

    Oopstar(int(random(310,390)),-40,-50,0.3);

    star(0,320,0.5);

    tree(500,350,0.5);
    textFont(ff);
    textSize(48);
    fill(0);

    text("Oh, A tree over there.",100,420);
    textSize(24);
    text("Tip Tap...Tip Tap...",120,140);
    text("Tip Tap...Tip Tap...",280,300);
    text("Extra Large FOX!", 120,50);
    text("It was FANTASTIC.", 90,70);

    textSize(48);
    fill(0);
    text("Next",480, 600);
    fill(255, 0, 0);
    rect(xx, yy, ww, hh);
  }

  else if (card  == 4) {  
    smooth();

    image(img1,0,0);

    star(260,90,0.1);
    star(420,250,0.1);
    star(0,480,0.2);


    tree(500,550,0.3);
    tree(400,550,0.3);
    tree(300,550,0.3);    
    tree(200,550,0.3);
    tree(100,550,0.3);

    tree(150,500,0.3);
    tree(250,500,0.3);
    tree(350,500,0.3);
    tree(450,500,0.3);
    tree(550,500,0.3);
    tree(500,450,0.3);
    tree(400,450,0.3);
    tree(300,450,0.3);    
    tree(200,450,0.3);
    tree(100,450,0.3);
    tree(0,450,0.3);

    tree(150,400,0.3);
    tree(250,400,0.3);
    tree(350,400,0.3);
    tree(450,400,0.3);
    tree(550,400,0.3);
    textFont(ff);
    textSize(48);
    fill(0);

    text("Oh! So many trees here,",100,420);
    text("Not 'A tree'.",100,460);
    textSize(24);
    text("Tip Tap...Tip Tap...",120,140);
    text("Tip Tap...Tip Tap...",280,300);
    textSize(48);
    fill(0);
    text("Next",480, 600);
    fill(255, 0, 0);
    rect(xx, yy, ww, hh);
  } 
  else if (card  == 5) {  
    smooth();
    image(img1,0,0);
    star(0,280,0.5);
    fox(0,-30,0.4);  
    tree(420,200,0.3);

    textFont(ff);
    textSize(48);
    fill(0);
    text("Oh! it's time to go.",100,420);
    textSize(24);
    text("I met an Extra Large Fox...",60,140);
    text("and saw Many Trees...",260,300);

    textSize(48);
    fill(0);
    text("Next",480, 600);
    fill(255, 0, 0);
    rect(xx, yy, ww, hh);
  } 
  else if (card  == 6) {  
    smooth();  
    background(0,150,160);
    image(img2,0,0);
    Oopstar(int(random(310,390)),-45,-50,1);

    textFont(f);
    textSize(72);

    fill(0);
    text("Oops!",50,450);

    textFont(ff);

    textSize(48);
    fill(0);
    text("I LOVE SOMETHING AMAZING!",32,500);
    fill(255);
    text("restart>>",400, 600);
    fill(255);
    rect(xx, yy, ww, hh);
  }
}
void mousePressed() {  

  if (card == 0) {  //title>>>choice
    if((mouseX > xx) && (mouseX < xx + ww) && (mouseY > yy) && (mouseY < yy+ hh)) {
      card = 1;
    } 
    else card = 0;
  }
  else if (card == 1) {  
    if((mouseX > 400) && (mouseX < 515) && (mouseY > 400) && (mouseY < 430)) {
      card = 11; //TO selecting
    }
    else if ((mouseX > 285) && (mouseX < 400) && (mouseY > 400) && (mouseY < 430)) {
      card = 10; //TO something
    }
    else card =1;
  }

  else if (card == 10) {
    if ((mouseX > 60) && (mouseX < 320) && (mouseY > 430) && (mouseY < 450)) {
      card = 1;
    }
    else if ((mouseX > 60)&& (mouseX < 320) && (mouseY > 460) && (mouseY < 480)) {
      card = 13;
    }
    else card = 10;
  }   

  else if (card == 13) {
    if((mouseX > xx) && (mouseX < xx + ww) && (mouseY > yy) && (mouseY < yy+ hh)) {
      card = 0;
    }
    else card = 13;
  }
  else if (card == 11) {
    if((mouseX > 160) && (mouseX < 260) && (mouseY > 520) && (mouseY < 550)) {
      card = 2;
    }
    else if ((mouseX > 350) && (mouseX < 450) && (mouseY > 520) && (mouseY < 550)) {
      card = 14;
    }
    else card = 11;
  }

  else if(card == 14) {
    if((mouseX > 0) && (mouseX < 80) && (mouseY > 560) && (mouseY < 600)) {
      card = 11;
    }
    else card = 14;
  }

  else if (card == 2) {

    if((mouseX > xx) && (mouseX < xx + ww) && (mouseY > yy) && (mouseY < yy+ hh)) {
      card = 12;
    }
    else card = 2;
  }
  else if (card == 3) {
    if((mouseX > xx) && (mouseX < xx + ww) && (mouseY > yy) && (mouseY < yy+ hh)) {
      card = 4;
    }
    else card = 3;
  }  

  else if (card == 12) {
    if((mouseX > 160) && (mouseX < 260) && (mouseY > 520) && (mouseY < 550)) {
      card = 3;
    }
    else if ((mouseX > 330) && (mouseX < 560) && (mouseY > 520) && (mouseY < 550)) {
      card = 15;
    }
    else card = 12;
  }

  else if (card == 15) {
    if((mouseX > 0) && (mouseX < 80) && (mouseY > 560) && (mouseY < 600)) {
      card = 12;
    }
    else card = 15;
  }

  else if (card == 4) {
    if((mouseX > xx) && (mouseX < xx + ww) && (mouseY > yy) && (mouseY < yy+ hh)) {
      card = 5;
    }
    else card = 4;
  }  

  else if (card == 5) {
    if((mouseX > xx) && (mouseX < xx + ww) && (mouseY > yy) && (mouseY < yy+ hh)) {
      card = 6;
    }
    else card = 5;
  } 
  else if (card == 6) {
    if((mouseX > xx) && (mouseX < xx + ww) && (mouseY > yy) && (mouseY < yy+ hh)) {
      card = 0;
    }
    else card = 6;
  }
}


