
PImage img0,img1,img2,img3,img4,img5,img6;

int card = 0; 
int textX = 50;
int textY = 380;
PFont f; 

void setup() {
  size(600, 450);
  f = createFont("DialogInput.plain", 15);
  textFont(f);
  img0 = loadImage("0.jpg");
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
  img5 = loadImage("5.jpg");
  img6 = loadImage("6.jpg");
}

void draw() {

  if (card == 0) {
    background(255);
    fill(0);
    image(img0,-20,0);

    text("staring girl", textX+100, textY+20);
  }  
  else if (card == 1) {  
    background(255);
    image(img1,130,50);
    text("I once knew a girl who would just stand there and stare.", textX, textY);
    text("At anyone or anything, she seemed not to care.", textX, textY+40);
    cardTwo();
  } 
  else if (card  == 2) {  
    background(255);
    image(img2,130,50);
    text("She'd stare at the ground,", textX, textY);
  }
  else if (card  == 3) { 
    background(255);
    image(img3,150,10);
    text("She'd stare at the sky.", textX, textY);
  }
  else if (card  == 4) {  
    background(255);
    image(img4,150,50);
    text("She'd stare at you for hours,and you d never know why.", textX, textY);
  } 
  else if (card  == 5) {  
    background(255);
    image(img5,150,10);
    text("but after winning the local staring contest,", textX, textY);
  } 
  else if (card  == 6) {  
    background(255);
    image(img6,150,10);
    text("She finally gave her eyes,a well deserved rest.", textX, textY+30);
  } 
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
    card = 0;
  }

}

void cardOne() {
}


void cardTwo() {
}



