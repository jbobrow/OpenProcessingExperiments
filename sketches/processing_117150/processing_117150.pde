
PImage img0, img1, img2, img3;

int card = 0; 
int textX = 580;
int textY = 430;
PFont f; 

void setup() {
  size(720, 480);
  f = createFont("Courier", 26);
  textFont(f);
  
  img0 = loadImage("0.jpg");
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
 
}

void draw() {

  if (card == 0) {
    background(255, 0, 0);
    image(img1,0,0);
    text("haha", textX, textY);
    /*   
     code here to draw something for the first page,     
     or create page funtions such as 
     cardOne();
     
     */
     
     
     
     
  }  
  else if (card == 1) {  
    background(210);
    text("hello", textX, textY);
    cardTwo();
  } 
  else if (card  == 2) {  
    background(180);
    text("everyone", textX, textY);
  }
  else if (card  == 3) { 
    background(150);
    text("my", textX, textY);
  }
  else if (card  == 4) {  
    background(120);
    text("name", textX, textY);
  } 
  else if (card  == 5) {  
    background(80);
    text("is", textX, textY);
  } 
  else if (card  == 6) {  
    background(40);
    text("kiyoung", textX, textY);
  } 
  else if (card == 7) {  
    background(0);
    text("peace", textX, textY);
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
    card = 0;
  }
}

void cardOne() {
  /*   
   code here to draw something for the first page,  
   */
}


void cardTwo() {
  /*   
   code here to draw something for the first page,  
   */
}



