
PFont font1, font2, font3, font4;
PImage a1,a2,a3,a4,a5;


String p1 = " Somewhere on the other side of this wide night"; 
String p2 = "and the distance between us, I am thinking of you."; 
String p3 = "The room is turning slowly away from the moon."; 
String p4 = "This is pleasurable..."; 
String p5 = "Or shall I cross that out and say"; 
String p6 = "In one of the tenses I singing"; 
String p7 = "an impossible song of desire that you cannot hear"; 
String p8 = "La lala la. See?"; 

int page = 0;


void setup() {
  size(900, 80);
  font1 = loadFont("Cochin-50.vlw");
  font2 = loadFont("ACaslonPro-Italic-50.vlw");
  font3= loadFont("Baskerville-SemiBoldItalic-50.vlw");
  font4 = loadFont("CourierNewPS-ItalicMT-50.vlw");
  
  a1 = loadImage("1.png");
  a2 = loadImage("2.png");
  a3 = loadImage("3.png");
  a4 = loadImage("4.png");
  a5 = loadImage("5.png");

}

void draw() {
  textAlign(CENTER);

  if (page ==0) {
    image(a1,0,0);
    fill(255);
    textFont(font1, 20); 
    text(p1, width/2, 50);
    
  }
  else if (page ==1) {
    image(a2,0,0);
    fill(255);
    textFont(font2, 20); 
    text(p2, width/2,50);
  }  
  else if (page ==2) {
    image(a3,0,0);
    fill(255);
    textFont(font3, 20); 
    text(p3, width/2, 50);
  }
  else if (page ==3) {
    image(a4,0,0);
    fill(255);
    textFont(font4, 20); 
    text(p4, width/2, 50);
  }
   else if (page ==4) {
    image(a5,0,0);
    fill(255);
    textFont(font1, 20); 
    text(p4, width/2,50);
    
  }
   else if (page ==5) {
    image(a1,0,0);
    fill(255);
    textFont(font2, 20); 
    text(p4, width/2, 50);
    
  }
  else if (page ==6) {
    image(a2,0,0);
    fill(255);
    textFont(font3, 20); 
    text(p4, width/2,50);
    
  }
  else if (page ==7) {
    image(a3,0,0);
    fill(255);
    textFont(font4, 20); 
    text(p4, width/2,50);
    
  }
  else if (page ==8) {
    image(a4,0,0);
    fill(255);
    textFont(font1, 20); 
    text(p4, width/2, 50);
    
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
    page  = int(random(2, 4));
  }
   else if ( page  == 4) {
    page  = int(random(3, 7));
  }
   else if ( page  == 5) {
    page  = int(random(4, 6));
  }
   else if ( page  == 6) {
    page  = int(random(1, 3));
  }
   else if ( page  == 7) {
    page  = int(random(5, 6));
  }
  else if ( page  == 8) {
    page =0;
  }
  
  println(page);
} 



