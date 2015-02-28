
PFont font1, font2, font3; 
PImage img1, img2, img3, img4, img5, img6, img7, img8, img9;

String p1 = "This little chick is black"; 
String p2 = "She stands in the barnyard on a big haystack"; 
String p3 = "This little chick is brown"; 
String p4 = "She is feeling sad and wearing a frown";  
String p5 = "This little chick is yellow"; 
String p6 = "She's friends with the rooster"; 
String p7 = "He's a handsome fellow";
String p8 = "This little chick is blue";
String p9 = "She lays eggs for me and you";
//.... 
int page = 0;

void setup() {
  size(500, 500); 
  img1 = loadImage("0.png");
  img2 = loadImage("1.png");
  img3 = loadImage("2.png");
  img4 = loadImage("3.png");
  img5 = loadImage("4.png");
  img6 = loadImage("5.png");
  img7 = loadImage("6.png");
  img8 = loadImage("7.png");
  img9 = loadImage("8.png");

  font1 = loadFont("Helvetica-48.vlw");
}

void draw() {
  textAlign(CENTER);

  if (page ==0) { //first
    image(img1, 0, 0);
    fill(0);
    textFont(font1, 13); 
    text(p1, width/2, height/1.6);
  }

  else if (page ==1) {
    image(img2, 0, 0);
    fill(0);
    textFont(font1, 13);
    text(p2, width/2, height/3);
  }  

  else if (page ==2) {//first
    image(img3, 0, 0);
    fill(0);
    textFont(font1, 13);
    text(p3, width/2, height/1.6);
  }

  else if (page ==3) {
    image(img4, 0, 0);
    fill(#A7FFFD);
    textFont(font1, 13);
    text(p4, width/2, height/1.45);
  }

  else if (page ==4) {//first
    image(img5, 0, 0);
    fill(0);
    textFont(font1, 13);
    text(p5, width/2, height/1.6);
  }

  else if (page ==5) {
    image(img6, 0, 0);
    fill(0);
    textFont(font1, 13);
    text(p6, width/2.5, height/2.2);
  }

  else if (page ==6) {
    image(img7, 0, 0);
    fill(255, 0, 0);
    textFont(font1, 13);
    text(p7, width/3, height/2.2);
  }
  else if (page ==7) {//first
    image(img8, 0, 0);
    fill(0);
    textFont(font1, 13);
    text(p8, width/2, height/1.6);
  }
  else if (page ==8) {
    image(img9, 0, 0);
    fill(0);
    textFont(font1, 13);
    text(p9, width/2, height/1.5);
  }
}


void mousePressed() {
  if ( page  == 0) {
    page  = 1;
  }
  else if ( page  == 1) {
    page = 2;
  }
  else if ( page  == 2) {
    page  = 3;
  }
  else if ( page  == 3) {
    page = 4;
  }
  else if ( page  == 4) {
    page = 5;
  }
  else if ( page  == 5) {
    page = 6;
  }
  else if ( page  == 6) {
    page = 7;
  }
  else if ( page  == 7) {
    page = 8;
  }
  else if ( page  == 8) {
    page = 0;
  }
  //....
  println(page);
} 



