
PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12;
                                                                   
                                                                     
                                                                     
                                             

int card = 0; 
int textX = 400;
int textY = 430;
PFont f; 

void setup() {
  size(720, 480);
  f = createFont("Arial", 15);
  textFont(f);
  
  img1 = loadImage("01.png");
  img2 = loadImage("02.png");
  img3 = loadImage("03.png");
  img4 = loadImage("04.png");
  img5 = loadImage("05.png");
  img6 = loadImage("06.png");
  img7 = loadImage("07.png");
  img8 = loadImage("08.png");
  img9 = loadImage("09.png");
  img10 = loadImage("10.png");
  img11 = loadImage("11.png");
  img12 = loadImage("111.png");

}

void draw() {

  if (card == 0) {
    background(0);
    text("TSOII EP - HALF OF WEEK.", 400, 300);

  }    
  else if (card == 1) {  
    background(210);
    text("Confession of rain.", textX, textY);
    image(img1, 1,1);
  } 
  
  else if (card == 2) {  
    background(210);
    text("Under your delicate ankles.", textX, textY);
    image(img1, 1,1);
    image(img2, 1,1);
    cardTwo();
  } 
  else if (card  == 3) {  
    background(180);
    text("Getting wet in the rain, spring is filled.", textX, textY);
    image(img1, 1,1);
    image(img2, 1,1);
    image(img3, 1,1);
  }
  else if (card  == 4) { 
    background(150);
    text("Walking away gwaenchandeon today.", textX, textY);
    image(img1, 1,1);
    image(img2, 1,1);
    image(img3, 1,1);
    image(img4, 1,1);
  }
  else if (card  == 5) {  
    background(140);
    text("You go to bed early today.", textX, textY);
    image(img1, 1,1);
    image(img2, 1,1);
    image(img3, 1,1);
    image(img4, 1,1);
    image(img5, 1,1);

  } 
  else if (card  == 6) {  
    background(130);
    text("But I rebelled against me.", textX, textY);
    image(img1, 1,1);
    image(img2, 1,1);
    image(img3, 1,1);
    image(img4, 1,1);
    image(img5, 1,1);
    image(img6, 1,1);
    image(img7, 1,1);
  } 
  else if (card  == 7) {  
    background(120);
    text("That you do not want in the morning.", textX, textY);
    image(img1, 1,1);
    image(img2, 1,1);
    image(img3, 1,1);
    image(img4, 1,1);
    image(img5, 1,1);
    image(img6, 1,1);
    image(img7, 1,1);
    image(img8, 1,1);
  } 
  else if (card == 8) {  
    background(110);
    text("Remember me miss you Let's asleep.", textX, textY);
    image(img1, 1,1);
    image(img2, 1,1);
    image(img3, 1,1);
    image(img4, 1,1);
    image(img5, 1,1);
    image(img6, 1,1);
    image(img7, 1,1);
    image(img8, 1,1);
    image(img9, 1,1);
  }
  else if (card == 9) {  
    background(100);
    text("That alone can we reach.", textX, textY);
    image(img1, 1,1);
    image(img2, 1,1);
    image(img3, 1,1);
    image(img4, 1,1);
    image(img5, 1,1);
    image(img6, 1,1);
    image(img7, 1,1);
    image(img8, 1,1);
    image(img9, 1,1);
    image(img10, 1,1);
  }
  else if (card == 10) {  
    background(90);
    text("Without any representation as to say.", textX, textY);
    image(img1, 1,1);
    image(img2, 1,1);
    image(img3, 1,1);
    image(img4, 1,1);
    image(img5, 1,1);
    image(img6, 1,1);
    image(img7, 1,1);
    image(img8, 1,1);
    image(img9, 1,1);
    image(img10, 1,1);
    image(img11, 1,1);
  }
  else if (card == 11) {  
    background(90);
    text("For you.", textX, textY);
    image(img1, 1,1);
    image(img2, 1,1);
    image(img3, 1,1);
    image(img4, 1,1);
    image(img5, 1,1);
    image(img6, 1,1);
    image(img7, 1,1);
    image(img8, 1,1);
    image(img9, 1,1);
    image(img10, 1,1);
    image(img11, 1,1);
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
    card = 7;
  }
  else if (card == 7) {
    card = 8;
  }
  else if (card == 8) {
    card = 9;
  }
  else if (card == 9) {
    card = 10;
  }
  else if (card == 10) {
    card = 11;
  }
  else if (card == 11) {
    card = 0;
  }
}

void cardOne() {

}


void cardTwo() {

}



