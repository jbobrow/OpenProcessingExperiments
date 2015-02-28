
PImage[] img = new PImage[8];




PFont font1;

String p1 = "GOOD LUCK IN THE WAR"; 
String p2 = "WE'D BETTER SAY GOODBYE"; 
String p3 = "I WAS WRONG"; 
String p4 = "NOT END"; 
String p5 = "THAT HURTS MY FEELINGS"; 
String p6 = "FROM NOW ON,"; 
String p7 = "NOTHING BOTHERS ME"; 
String p8 = "JUST A SPECIAL";
String p9 = "LITTLE EFFECT"; 

String p10 = "I'M NOT YOURS"; 

int page = 0;


void setup() {
  size(850, 1000); 
  font1 = loadFont("ComicSansMS-Bold-60.vlw");
  for (int i = 0; i < 8; i ++) {
    img[i] = loadImage( i+".jpg");
  }
}

void draw() {
  textAlign(CENTER);

  if (page ==0) {
    background(27, 71, 90); 
    fill(0);
    textFont(font1, 60); 
    text(p1, width/2, 480);
    image(img[0], 26, 30);
  }
  else if (page ==1) {
    background(150, 38, 50); 
    fill(255);
    textFont(font1, 55); 
    text(p2, width/2, 870);
    image(img[1], 26, 180);
  }  
  else if (page ==2) {
    background(191, 0, 31); 
    fill(255, 255, 0);
    textFont(font1, 60); 
    text(p3, 465, 900);
    image(img[2], 226, 30);
  }
  else if (page ==3) {
    background(4, 164, 0); 
    fill(255);
    textFont(font1, 60); 
    text(p4, width/2, 700);
    rect(100, 100, 100, 100);
    image(img[3], 26, 30);
  }
  else if (page ==4) {
    background(251, 2, 0); 
    fill(232, 213, 23);
    textFont(font1, 55); 
    text(p5, width/2, 100);
    image(img[4], 26, 330);
  }
  else if (page ==5) {
    background(66, 127, 156); 
    fill(255, 229, 13);
    textAlign(LEFT);
    textFont(font1, 40); 
    text(p6, 320, 900);
    text(p7, 320, 940);
    image(img[5], 26, 30);
  }
  else if (page ==6) {
    background(186, 0, 24); 
    fill(48, 106, 148);
    textAlign(LEFT);

    textFont(font1, 30); 
    text(p8, 410, 80);
    text(p9, 410, 120);

    rect(100, 100, 100, 100);
    image(img[6], 26, 30);
  }
  else if (page ==7) {
    background(255, 255, 0); 
    fill(0);
    textAlign(LEFT);
    textFont(font1, 60); 
    text(p10, 180, 920);
    image(img[7], 140, 50);
  }
}


void mousePressed() {
  if ( page  == 0) {
    page  = 1;
  }
  else if ( page  == 1) {
    page  = int(2);
  }
  else if ( page  == 2) {
    page  = int(3);
  }
  else if ( page  == 3) {
    page  = int(4);
  }
  else if ( page  == 4) {
    page  = int(5);
  }
  else if ( page  == 5) {
    page  = int(6);
  }
  else if ( page  == 6) {
    page  = int(7);
  }
  else if ( page  == 7) {
    page =0;
  }

  println(page);
} 



