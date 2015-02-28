
PImage img1, img2, img3, img4, img5, img6, img7;

int card = 0; 
int textX = 310;
int textY = 500;
PFont f; 

void setup() {
  size(700, 600);
  f = loadFont("HelveticaNeue-Light-20.vlw");
  textFont(f);
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
  img7 = loadImage("7.png");
}

void draw() {

  smooth();


  if (card == 0) {
    background(0);
    lego(150,0);
    fill(255);
    text("START!",textX, textY);
  }  
  else if (card == 1) {
    background(210);
    image(img1,0,0,700,600);
    text("", textX, textY);
    lego(350,100);
  } 
  else if (card  == 2) { 
    image(img2,0,0,700,600);
    text("", textX, textY);
    lego(200,100);
  }
  else if (card  == 3) {  
    background(40);
    image(img3,0,0,700,600);
    text("",textX, textY);
    lego2(420,420,1);
  }
  else if (card  == 4) { 
    image(img4,0,0,700,600);
    text("", textX, textY);
    lego2(350,100,2);
  }
  else if (card  == 5) {  
    image(img5,0,0,700,600);
    text("", textX, textY);
    lego3(-200,100);
  } 
  else if (card  == 6) {  
    image(img6,0,0,700,600);
    text("", textX, textY);
    lego(50,100);
  } 
  else if (card == 7) {  
    image(img7,0,0,700,600);
    text("", textX, textY);
  }
}

void lego(int x, int y) {
  pushMatrix();
  translate(x,y);
  smooth();
  strokeWeight(2);
  strokeJoin(BEVEL);

  fill(255,242,0);
  beginShape();
  vertex(140,220);
  vertex(120,220);
  vertex(93,320);
  vertex(93,345);
  vertex(120,345);
  endShape();

  beginShape();
  vertex(240,220);
  vertex(260,220);
  vertex(285,320);
  vertex(285,345);
  vertex(260,345);
  endShape();

  ellipse(105,360,25,25);
  ellipse(275,360,25,25);
  fill(255,242,0);
  rect(140,140,100,70);
  quad(140,220,120,320,260,320,240,220);
  quad(120,320,120,360,260,360,260,320);
  rect(160,210,60,10);
  rect(135,360,45,100);
  rect(200,360,45,100);
  rect(160,120,60,20);
  rect(130,440,54,25);
  rect(195,440,55,25);
  fill(0);
  ellipse(170,170,10,10);
  ellipse(210,170,10,10);
  strokeWeight(7);
  line(180,190,200,190);
  popMatrix();
}

void lego2(int x, int y, float c) {
  pushMatrix();
  translate(x,y);
  scale(c);
  smooth();
  strokeWeight(2);
  strokeJoin(BEVEL);

  fill(255,242,0);
  beginShape();
  vertex(140,220);
  vertex(120,220);
  vertex(93,320);
  vertex(93,345);
  vertex(120,345);
  endShape();
  ellipse(105,360,25,25);
  ellipse(275,360,25,25);
  beginShape();
  vertex(240,220);
  vertex(260,220);
  vertex(285,320);
  vertex(285,345);
  vertex(260,345);
  endShape();
  fill(255,242,0);
  rect(140,140,100,70);
  quad(140,220,120,320,260,320,240,220);
  quad(120,320,120,360,260,360,260,320);
  rect(160,210,60,10);
  rect(135,360,45,100);
  rect(200,360,45,100);
  rect(160,120,60,20);
  rect(130,440,54,25);
  rect(195,440,55,25);
  fill(0);
  popMatrix();
}

void lego3(int x, int y) {
  pushMatrix();
  translate(x,y);

  smooth();
  strokeWeight(2);
  strokeJoin(BEVEL);

  fill(255,242,0);
  rect(455,120,30,30);
  rect(440,140,60,60);
  rect(455,200,30,30);
  rect(450,360,40,80);
  /*rect(440,440,60,20);*/
  beginShape();
  vertex(440,220);
  vertex(420,320);
  vertex(420,360);
  vertex(520,360);
  vertex(520,320);
  vertex(500,220);
  vertex(440,220);
  endShape();
  ellipse(470,240,30,30);

  beginShape();
  vertex(455,240);
  vertex(440,300);
  vertex(480,340);
  vertex(500,320);
  vertex(470,290);
  vertex(485,240);
  endShape();

  beginShape();
  vertex(450,360);
  vertex(410,420);
  vertex(450,440);
  vertex(450,430);
  endShape();

  ellipse(500,340,25,25);
  popMatrix();
}


void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 4) {
    card = 5;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 7;
  }
  else if (card == 7) {
    card = 0;
  }
}


