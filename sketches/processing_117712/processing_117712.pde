

int card = 0; 

PFont font1, font2, font3, font4, font5, font6; 
PImage img1, img2, img3, img4, img5, img6;
String p1 = "Stars"; 
String p2 = "Alone in the night On a dark hill with pine around me"; 
String p3 = "And a heaven full of stars over my head";
String p4 = "Myriads with beating hearts of fire";
String p5 = "Up the dome of heaven, I watch them still";
String p6 = "And I know that I am honored to bo witness of this majesty";

void setup() {
  size(720, 480);
  font1 = createFont("Kartika-Bold-200.vlw", 30);
  font2 = createFont("Corbel-Bold-48", 30);
  font3 = createFont("Corbel-Bold-48", 30);
  font4 = createFont("EucrosiaUPCItalic-48", 30);
  font5 = createFont("EucrosiaUPCItalic-48", 30);
  font6 = createFont("Corbel-Bold-48", 30);
  
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
  
}

void draw() {

  if (card == 0) {
      textAlign(CENTER);
   // background(20, 20, 20);
    image(img1, 0, 0,720,480);
    fill(255, 100, 255);
    textFont(font1, 60);
    text(p1, width/2, 200);

  }  
  else if (card == 1) {  
    textAlign(CENTER);
   // background(15, 20, 100);
    image(img2, 0, 0,720,480);
    fill(255, 0, 141);
    textFont(font2, 20);
    text(p2, width/2, 200);

  } 
  else if (card  == 2) {  
  textAlign(CENTER);
    //background(100, 200, 200);
    image(img3, 0, 0,720,480);
    fill(0,255,253);
    textFont(font3, 30);
    text(p3, width/2, 200);

  }
  else if (card  == 3) { 
     textAlign(CENTER);
  //  background(0);
    image(img4, 0, 0,720,480);
    fill(161, 255, 0);
    textFont(font4, 20);
    text(p4, width/2, 200);

  }
  else if (card  == 4) {  
  textAlign(CENTER);
    //background(120, 200, 100);
    image(img5, 0, 0,720,480);
    fill(255, 255, 255);
    textFont(font5, 30);
    text(p5, width/2, 200);

  } 
  else if (card  == 5) {  
    textAlign(CENTER);
   // background(90, 90, 100);
    image(img6, 0, 0,720,480);
    fill(255, 255, 255);
    textFont(font6, 20);
    text(p6, width/2, 200);

  } 
 /* else if (card  == 6) {  
    textAlign(CENTER);
    background(200, 100, 50);
    image(img5, 0, 0);
    fill(0);
    textFont(font6, 30);
    text(p7, width/2, 120);

  } */

}


void mousePressed() {  

  if (card == 0) {  
    card = 1;}
  else if (card == 1) {  
    card = int (random(2,6));
  }
  else if (card == 2) {
    card = int (random(3,4));
  }
  else if (card == 3) {
    card = int (random(4,5));
  }  
  else if (card == 4) {
    card = int (random(5,6));
  }  
  else if (card == 5) {
    card = int (random(6));
  } 
  }





