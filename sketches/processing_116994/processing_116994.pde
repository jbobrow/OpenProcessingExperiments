
import netscape.javascript.*;

PFont font1, font2, font3, font4; 
PImage image1, image2, image3, image4, image5, image6, image7, image8;

String p1 = "Wanna join me, come and play"; 
String p2 = "But, I might shoot you, in you face"; 
String p3 = "Bombs and bullets will, do the trick"; 
String p4 = "What we need here, is a little bit of panic"; 
String p5 = "Do you ever wanna catch me?"; 
String p6 = "Right now i'm feeling ignored"; 
String p7 = "So can you try a little harder?";
String p8 = "I'm really getting bored!";
 
int page = 0;

void setup() {
  size(800, 800); 
  font1 = loadFont("InterGTB-48.vlw");
  font2 = loadFont("Blippo-BlkBT-24.vlw");
  font3 = loadFont("HA-TTM-24.vlw");
  font4 = loadFont("MaturaMTScriptCapitals-36.vlw");
 image1 = loadImage("1.jpg");
 image2 = loadImage("2.jpg");
 image3 = loadImage("3.jpg");
 image4 = loadImage("4.jpg");
 image5 = loadImage("5.jpg");
 image6 = loadImage("6.jpg");
 image7 = loadImage("7.jpg");
 image8 = loadImage("8.jpg");
 

}

void draw() {
  textAlign(CENTER);

  if (page ==0) {
    background(image1); 
    fill(255, 0, 0);
    textFont(font1); 
    text(p1, width/2, height/2);
  }
  else if (page ==1) {
    background(image2); 
    fill(255, 0, 0);
    textFont(font1); 
    text(p2, width/2, 100);
  }  
  else if (page ==2) {
    background(image3); 
    fill(0, 0, 0);
    textFont(font2); 
    text(p3, width/2, 500);
  }
  else if (page ==3) {
    background(image4); 
    fill(0);
    textFont(font3); 
    text(p4, 350, height/2);
    
  }
   else if (page ==4) {
    background(image5); 
    fill(0);
    textFont(font4); 
    text(p5, width/2, height/2);
    
  }
  else if (page ==5) {
    background(image6); 
    fill(255,255,255);
    textFont(font2); 
    text(p6, width/2, 150);
    
  }
  else if (page ==6) {
    background(image7); 
    fill(0);
    textFont(font3); 
    text(p7, width/2, height/2);
     }
  else if (page ==7) {
    background(image8); 
    fill(0);
    textFont(font4); 
    text(p8, width/2, 450);
     }
}


void mousePressed() {
  if ( page  == 0) {
    page  = 1;
  }
  else if ( page  == 1) {
    page  = int(random(2, 4));
  }
  else if ( page  == 2) {
    page  = int(random(1, 5));
  }
  else if ( page  == 3) {
    page  = int(random(6, 8));
  }
  else if ( page  == 4) {
    page = int(random(3, 7));
  }
  else if ( page  == 5) {
    page = int(random(2, 6));
  }
  else if ( page  == 6) {
    page = int(random(1, 7));
  }
  else if ( page  == 7) {
    page = 0;
  }
  //....
  println(page);
} 

