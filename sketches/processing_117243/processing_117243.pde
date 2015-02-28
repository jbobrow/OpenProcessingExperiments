
PFont font1, font2, font3, font4, font5;
PImage img1, img2, img3, img4, img5, img6, img7, img8;

String p0 = "One day when the rain falls";
String p1 = "just like a star across my sky";
String p2 = "you have appeared to my life";
String p3 = "and if i traveled all around the world i know what i wouldn't find";
String p4 = "someone half as beautiful, someone as kind";
String p5 = "I never felt the way that i feel inside";
String p6 = "It's possible i may have found my dream come true";
String p7 = "There can never be another you.";

int page = 0;

void setup(){
  
  size(800,600);
  font1 = loadFont("ChalkboardSE-Light-70.vlw");
  font2 = loadFont("Courier-50.vlw");
  font3 = loadFont("DIN-RegularItalic-50.vlw");
  font4 = loadFont("Didot-Bold-50.vlw");
  font5 = loadFont("ElgethyEst-50.vlw");
  
  img1 = loadImage("page01.jpg");
  img2 = loadImage("page02.jpg");
  img3 = loadImage("page03.jpg");
  img4 = loadImage("page04.jpg");
  img5 = loadImage("page05.jpg");
  img6 = loadImage("page06.jpg");
  img7 = loadImage("page07.jpg");
  img8 = loadImage("page08.jpg");
  
}

void draw(){
  textAlign(CENTER);
  
  if (page == 0){
    image(img1, 0, 0);
    fill(0);
    textFont(font1, 60);
    text(p0, width/2, 500);
  }  
  else if (page == 1){
    image(img2, 0, 0);
    fill(255);
    textFont(font2, 20);
    text(p1,200,200);
  }
  else if (page == 2){
    image(img3, 0, 0);
    textFont(font3, 30);
    text(p2, 400, 350);
  }
  else if (page == 3){
    image(img4, 0, 0);
    textFont(font4, 20);
    text(p3, 400, 200);
  }
  else if (page == 4){
    image(img5, 0, 0);
    textFont(font2, 25);
    text(p4, 350, 400);
  }
  else if (page == 5){
    image(img6, 0, 0);
    fill(0);
    textFont(font5, 35);
    text(p5, mouseX/2, 300);
  }
  else if (page == 6){
    image(img7, 0, 0);
    fill(255);
    textFont(font2, 20);
    text(p6, 480, 250);
  }
  else if (page == 7) {
    image(img8, 0, 0);
    textFont(font3, 50);
    text(p7, width/2, height/2);
  }
}

void mousePressed(){
  if (page == 0){
    page = 1;
  }
  else if (page == 1){
    page = 2;
  }
  else if(page == 2){
    page = 3;
  }
  else if(page == 3){
    page = int(random(2,5));
  }
  else if(page == 4){
    page = 5;
  }
  else if(page == 5){
    page = 6;
  }
  else if(page == 6){
    page = int(random(4,8));
  }
  else if(page == 7){
    page = 0;
  }
}


