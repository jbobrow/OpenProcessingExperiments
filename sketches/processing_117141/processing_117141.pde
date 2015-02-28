
PImage photo0;
PImage photo1;
PImage photo2;
PImage photo3;


int card = 0; 
int textX = 580;
int textY = 430;

String p0 = "But what if Dragoon comes out?"; 
String p1 = "D!"; 
String p2 = "RA!"; 
String p3 = "GOON!"; 
String p4 = "Maybe, it will change the aspect of the war"; 
String p5 = "That's";
String p6 = "Definitely";
String p7 = "True";

PFont f; 

void setup() {
  size(480, 720);
  f = createFont("Geogia", 30);
  textFont(f);

  photo0 = loadImage("0.jpg");
  photo1 = loadImage("1.jpg");
  photo2 = loadImage("2.jpg");
  photo3 = loadImage("3.png");
}

void draw() {
  println(mouseX+","+ mouseY);
  fill(0);
  textSize(30);
  if (card == 0) {
    image(photo0, 0, 0);
    text(p0, 30, 100);
  }  
  else if (card == 1) {  
    image(photo1, 0, 0);
    text(p1, 20, 50);
  } 
  else if (card  == 2) {
    image(photo1, 0, 0);  
    text(p1, 20+random(-5, 5), 50);
    text(p2, 40+random(-7, 7), 300);
  }
  else if (card  == 3) { 
    image(photo1, 0+random(-1, 1), 0+random(-1, 1)); 
    fill(250, 0, 0); 
    text(p1, 20+random(-5, 5), 50+random(-5, 5));
    text(p2, 40+random(-7, 7), 300+random(-7, 7));
    text(p3, 375+random(-9, 9), 560+random(-9, 9));
  }
  else if (card  == 4) { 
    image(photo2, 0+random(-2, 2), 0+random(-2, 2)); 
    textSize(20);
    text(p4, 5, 15, 180, 150);
  } 
  else if (card  == 5) {
    image(photo2, 0+random(-2, 2), 0+random(-2, 2));
    textSize(20);
    text(p4, 5, 15, 180, 150);
    image(photo3, 0, 0);  
    text(p5, 85, 260);
  } 
  else if (card  == 6) {
    image(photo2, 0+random(-2, 2), 0+random(-2, 2)); 
    textSize(20);
    text(p4, 5, 15, 180, 150);
    image(photo3, 0, 0); 
    text(p6, 160, 260);
  } 
  else if (card == 7) {  
    image(photo2, 0+random(-2, 2), 0+random(-2, 2));
    textSize(20);
    text(p4, 5, 15, 180, 150);
    image(photo3, 0, 0); 
    text(p7, 335, 255);
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



