
int card = 0;
PFont font;
PImage card1;
PImage card2;
PImage carddie;
PImage cards;
PImage cards1;
PImage cards2;
PImage cards3;
PImage cards3a;
PImage carddieswan;
PImage carddiespill;
PImage cardo;
PImage carddieowl;
PImage cardo2;
PImage carddiecut;
PImage cardlove;
PImage cardrye;
PImage feath;
PImage carddeform;
boolean move=true;

void setup() {
  size(640, 480);
  smooth();
  font = loadFont("Modern-Regular-18.vlw");
  textFont(font);
  card1= loadImage("card1.jpg");
  card2= loadImage("card2.jpg");
  carddie= loadImage("carddie.jpg");
  cards= loadImage("cards.jpg");
  cards1= loadImage("cards1.jpg");
  cards2= loadImage("cards2.jpg");
  cards3= loadImage("cards3.jpg");
  cards3a= loadImage("cards3a.jpg");
  carddieswan= loadImage("carddieswan.jpg");
  carddiespill= loadImage("carddiespill.jpg");
  cardo=loadImage("cardo.jpg");
  carddieowl= loadImage("carddieowl.jpg");
  cardo2= loadImage("cardo2.jpg");
  carddiecut= loadImage("carddiecut.jpg");
  cardlove=loadImage("cardlove.jpg");
  cardrye=loadImage("cardrye.jpg");
  feath=loadImage("feath.png");
  carddeform=loadImage("carddeform.jpg");
}

void draw()
{
  println(card);
  if (card==0)
  {
    image(card1,0,0);
    if (mousePressed && move)
    {
//      float d=dist(mouseX,mouseY,142,210);
//      if(d<200) {
        card=1;
        move=false;
//      }
    }
  }

  else if (card==1) {
    image(card2,0,0);
    if (mousePressed && move)
    {
      float d=dist(mouseX,mouseY,72,283);
      if(d<50) {

        card=2;
        move=false;
      }
    }


    if (mousePressed && move) {
      float d=dist(mouseX,mouseY,186,283);
      if(d<50) {
        card=3;
        move=false;
      }
    }
  }
  else if (card==2) {
    image(cardo,0,0);

    if (mousePressed && move){
      float d=dist(mouseX,mouseY,459,311);
      if(d<50){
        card=22;
        move=false;
      }
    }

    if (mousePressed && move){
      float d=dist(mouseX,mouseY,547,359);
      if(d<50){
        card=21;
        move=false;
      }
    }
  }

  else if (card==21){
    image(carddieowl,0,0);
    
    if(mousePressed && move){
    card=0;
    move=false;
    }
  }

  else if (card==22){
    image(cardo2,0,0);

    if (mousePressed && move)
    {
      float d=dist(mouseX,mouseY,306,342);
      if (d<50){
        card=23;
        move=false;
      }
    }


    if (mousePressed && move){
      float d=dist(mouseX,mouseY,425,347);
      if(d<50){
        card=12;
        move=false;
      }
    }
  }

  else if(card==12){
    image(cardrye,0,0);
    
    if(mousePressed && move){
    card=0;
    move=false;
    }
  }

  else if (card==23){
    image(carddiecut,0,0);
    
    if(mousePressed && move){
    card=0;
    move=false;
    }
  }
  
  

  //  else if(card==

  else if (card==3) {
    image(cards,0,0);

    if (mousePressed && move) {
      float d=dist(mouseX,mouseY,95,250);
      if(d<50)
      {
        card=4;
        move=false;
      }
    }

    if (mousePressed && move) {
      float d=dist(mouseX,mouseY,278,296);
      if (d<50)
      {
        card=5;
        move=false;
      }
    }
    if (mousePressed && move) {
      float d= dist(mouseX,mouseY,156,383);
      if (d<50)
      {
        card=6;
        move=false;
      }
    }
  }

  else if (card==4) {
    image(cards1,0,0);
    

    if(mousePressed && move) {
      float d=dist(mouseX,mouseY,76,371);
      if (d<50) {
        card=5;
        move=false;
      }
    }

    if(mousePressed && move) {
      float d=dist(mouseX,mouseY,206,399);
      if(d<50) {
        card=10;
        move=false;
      }
    }

    if (mousePressed && move) {
      float d=dist(mouseX,mouseY,258,338);
      if(d<50) {
        card=6;
        move=false;
      }
    }
  }
  else if (card==10){
    image(cardlove,0,0);
    if(mousePressed && move){
    card=0;
    move=false;
    }
  }

  else if (card==5) {
    image(cards2,0,0);


    if (mousePressed && move) {
      float d=dist(mouseX,mouseY,71,286);
      if(d<50) {
        card=11;
        move=false;
      }
    }

    if (mousePressed && move) {
      float d=dist(mouseX,mouseY,148,342);
      if(d<50) {
        card=2;
        move=false;
      }
    }
    if (mousePressed &&move) {
      float d=dist(mouseX,mouseY,289,294);
      if(d<50) {
        card=14;
        move=false;
      }
    }
  }
  
  else if (card==14){
  image(carddeform,0,0);
  
  if(mousePressed && move){
  card=2;
  move=false;
  }
  }

  else if(card==11) {
    image(carddiespill,0,0);
    if(mousePressed && move){
    card=0;
    move=false;
    }
  }

  else if(card==6)
  {
    image(cards3,0,0);

    if (mousePressed && move) {
      float d=dist(mouseX,mouseY,129,342);
      if(d<50) {
        card=7;
        move=false;
      }
    }

    if (mousePressed && move) {
      float d=dist(mouseX,mouseY,505,297);
      if(d<50) {
        card=5;
        move=false;
      }
    }
  }

  else if(card==7)
  {
    image(cards3a,0,0);

    if(mousePressed && move){
      float d=dist(mouseX,mouseY, 122,221);
      if (d<50){
        card=8;
        move=false;
      }
    }
    if (mousePressed && move){
      float d=dist(mouseX, mouseY, 232,337);
      if (d<50){
        card=10;
        move=false;
      }
    }
  }

  else if(card==8) {
    image(carddieswan,0,0);
    if(mousePressed && move){
    card=0;
    move=false;
    }
  }

}


void mouseReleased()
{
  move=true;
}










