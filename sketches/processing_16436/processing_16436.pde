
PImage img1;
PImage img2;
PFont f;
PFont ff;

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

    star(220,20,0.2);
    textFont(ff);
    textSize(24);
    fill(0);
    text("I'm very excited!",130,90);
    text("I want to see SOMETHING AMAZING.",180,120);

    textSize(48);
    text("oh, what's it?", 150,400);



    star(-70,320,0.5);
    fox(540,280,0.5);

    fill(0);
    text("Next",480, 600);
    fill(255, 0, 0);
    rect(xx, yy, ww, hh);
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
  fill(255, 0, 0);
  rect(xx, yy, ww, hh);
} 

}
void mousePressed() {  

  if (card == 0) {  

    if((mouseX > xx) && (mouseX < xx + ww) && (mouseY > yy) && (mouseY < yy+ hh)) {
      card = 1;
    } 
    else card = 0;
  }
  else if (card == 1) {  

    if((mouseX > xx) && (mouseX < xx + ww) && (mouseY > yy) && (mouseY < yy+ hh)) {
      card = 2;
    }
    else card = 1;
  }   
  else if (card == 2) {

    if((mouseX > xx) && (mouseX < xx + ww) && (mouseY > yy) && (mouseY < yy+ hh)) {
      card = 3;
    }
    else card = 2;
  }
  else if (card == 3) {

    if((mouseX > xx) && (mouseX < xx + ww) && (mouseY > yy) && (mouseY < yy+ hh)) {
      card = 4;
    }
    else card = 3;
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


