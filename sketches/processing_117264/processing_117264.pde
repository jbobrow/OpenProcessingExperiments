
PFont font1;
PImage img1, img2, img3, img4, img5, img6, img7, img8;


String p1 = "Non  Linear  story  is  between  lover's  arguing";
String p2 = "Honey, do I look fat today?";
String p3 = "She is always worries about her looking, because she wants to get his love";
String p4 = "You've been changed. But I still love you";
String p5 = "You're My PRINCE, Honey. Do you love me too?" ;
String p6 = "Of course, sure. I love too" ;
String p7 = "No!!!!!! You don't love me anymore. you're answer is too short!!!" ;
String p8 = "wrong~i love you. Let's stop at this point, I'm tired!";
String p9 = "I don't believe you! You get tired of me now? you're lying!!!";
String p10 = "Oh my god! you make me CRAZY";

int page = 0;

void setup() {
 
 
 size(600,399);

 img1 = loadImage("01.jpg");
 img2 = loadImage("02.jpg");
 img3 = loadImage("03.jpg");
 img4 = loadImage("04.jpg");
 img5 = loadImage("05.jpg");
 img6 = loadImage("06.jpg");
 img7 = loadImage("07.jpg");
 img8 = loadImage("08.jpg"); 
  
  
 font1 = loadFont("BrainFlower-48.vlw");
  
  
}


void draw() {
  
  
  if (page ==0) {
   fill(0);
    textFont(font1,23);
    text(p1,50, height/2);
  }
  
  else if (page ==1) {
    image(img1, 0,0,600,399);
   
    fill(0);
    textFont(font1,30);
    text(p2,120,40); 
 
   textFont(font1,17);
 
    fill(255,3,83);
    text(p3, 10,370);
  }
  
  else if (page ==2) {
    image(img2,0,0,600,399);
    fill(0);
    textFont(font1,30);
    text(p4,30,40);
    
  }
  
  else if (page ==3) {
    image(img3, 0,0,600,399);
    fill(255);
    textFont(font1,20);
    text(p5,10,30);
  }
  
  else if (page ==4) {
    image(img4,0,0,600,399);
    fill(0);
    textFont(font1,30);
    text(p6,80,100);
    
  }
  
  
  else if (page ==5) {
    image(img5,0,0,600,399);
    fill(0);
    textFont(font1,17);
    text(p7,40,360);
    
  }
  
  else if (page ==6) {
    image(img6,0,0,600,399);
    fill(255);
    textFont(font1,22);
    text(p8,20,310);
    
  }
  
  
  else if (page ==7) {
    image(img7,0,0,600,399);
    fill(255);
    textFont(font1,20);
    text(p9,10,30);
    
  }
  
  else if (page ==8) {
    image(img8,0,0,600,399);
    fill(255);
    textFont(font1,30);
    text(p10,100,100);
    
  }
  
}


void mousePressed() {
  
  if ( page == 0) {
    page = 1;
  }
  
  else if ( page ==1) {
    page = int(random(2,8));
    
  }
  
  else if ( page ==2) {
    page = int(random(3,8));
    
  }
  
  else if ( page ==3 ){
    
    page = int(random(8));
    
  }
  
  else if( page == 4 ){
    
    page = int(random(1,3));
    
  }
  
  else if (page ==5) {
    page = 6;
  }
  
  else if (page ==6) {
    
    page = 7;
    
  }
  
  else if (page ==7) {
    page = int(random(4,8));
    
  }
  
  else if (page ==8) {
    page = int(random(1,7));
  }
  
}
    
    

    


