
PFont font1; 
PImage img1, img2, img3, img4, img5, img6, img7;

String p1 = "Tears stream down on your face"; 
String p2 = "I promise you I will learn from my mistakes"; 
String p3 = "Tears stream down on your face"; 
String p4 = "And I"; 
String p5 = "Light will guide you home"; 
String p6 = "And ignite your bones"; 
String p7 = "And I will try to fix you";

int page = 0;

float a;


void setup() {
  size(600, 400); 
  font1 = loadFont("Serif-48.vlw");
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
  img5 = loadImage("5.jpg");
  img6 = loadImage("6.jpg");
  img7 = loadImage("7.jpg");
}

void draw() {
  textAlign(CENTER);

  if (page ==0) {
    background(0); 
    image(img1, 0, 0);
    fill(255, 70);
    textFont(font1, 20); 
    text(p1, width/2, height/2);
  }
  else if (page ==1) {
    image(img2, 0, 0);
    fill(255, 70);
    textFont(font1, 20); 
    text(p2, width/2, 100);
  }  
  else if (page ==2) {
    image(img3, 0, 0);
    fill(255, 70);
    textFont(font1, 40); 
    text(p3, width/2, 100);
  }
  else if (page ==3) {
    image(img4, 0, 0);  
    fill(255, 70);
    textFont(font1, 65); 
    text(p4, width/2, 245);
    noStroke();
    fill(255, 30);
    rect(225, 215, 150, 60);
  }
  else if (page ==4) {
    image(img5, 0, 0);
    fill(255, 40);
    textFont(font1, 20); 
    text(p5, width/2, 100);
    noStroke();
    fill(255, 10+a);
    a += 2;
    rect(0, 124, 600, 14);
  }
  else if (page ==5) {
    image(img6, 0, 0);
    fill(255, 70);
    textFont(font1, 30); 
    text(p6, width/2, 255);
  }
  else if (page ==6) {
    image(img7, 0, 0);
    fill(255, 20);
    noStroke();
    ellipse(100, 100, 50+a, 50+a);
    fill(255, 255, 0, 30);
    ellipse(400, 300, 30+a, 30+a);
    fill(255, 30);
    ellipse(440, 50, 20+a, 20+a);
    fill(255, 0, 255, 15);
    ellipse(300, 300, 20+a, 20+a);
    a +=0.2;

    fill(255, 90);
    textFont(font1, 50); 
    text(p7, width/2, 300);
  }
}


void mousePressed() {
  if ( page  == 0) {
    page  = 1;
  }
  else if ( page  == 1) {
    page  = 2;
  }
  else if ( page  == 2) {
    page  = 3;
  }
  else if ( page  == 3) {
    page =4;
  }
  else if ( page  == 4) {
    page =5;
  }
  else if ( page  == 5) {
    page =6;
  }
  else if ( page  == 6) {
    page =7;
  }
  else if ( page  == 7) {
    page =0;
  }

  println(page);
} 



