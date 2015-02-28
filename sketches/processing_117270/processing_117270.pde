
PFont font1, font2, font3; 
PImage a1, a2, a3, a4, a5, a6, a7, a8;
String p1 = "Every time, when I look into mirror"; 
String p2 = "I wish I could lose all of my blues"; 
String p3 = "It takes my breath away"; 
String p4 = "Something wonderful will happen"; 
String p5 = "Enjoy the moment"; 
String p6 = "I'm looking for the face that I've never seen"; 
String p7 = "Smile as long as you can"; 
String p8 = "Hey there"; 


//.... 
int page = 0;


void setup() {
  size(400, 500); 
  font1 = loadFont("Chalkduster-20.vlw");
  //  font2 = createFont("Arial", 100);
  //  font3 = createFont("Georgia", 80);
  a1 = loadImage("1.png");
  a2 = loadImage("2.png");
  a3 = loadImage("3.png");
  a4 = loadImage("4.png");
  a5 = loadImage("5.png");
  a6 = loadImage("6.png");
  a7 = loadImage("7.png");
  a8 = loadImage("8.png");
}

void draw() {
  //  textAlign(CENTER);

  if (page ==0) {
    image(a1, 0, 0);
    textFont(font1, 18); 
    text(p1, 20, 40);
  }
  else if (page ==1) {
    image(a2, 0, 0);
    textFont(font1, 18); 
    text(p2, 10, 200);
  }  
  else if (page ==2) {
    image(a3, 0, 0);
    textFont(font1, 18); 
    text(p3, 80, 400);
  }
  else if (page ==3) {
    image(a4, 0, 0);
    textFont(font1, 18); 
    text(p4, 20, 80);
  }
  else if (page ==4) {
    image(a5, 0, 0);
    textFont(font1, 18); 
    text(p5, 140, 60);
  }
   else if (page ==5) {
    image(a6, 0, 0);
    textFont(font1, 15); 
    text(p6, 10, 300);
  }
  else if (page ==6) {
    image(a7, 0, 0);
    textFont(font1, 18); 
    text(p7, 50, 430);
  }
  else if (page ==7) {
    image(a8, 0, 0);
    textFont(font1, 19); 
    text(p8, 300, 410);
  }
}


void mousePressed() {
  if ( page  == 0) {
    page  = 1;
  }
  else if ( page  == 1) {
    page  = int(random(2, 8));
  }
  else if ( page  == 2) {
    page  = int(random(1, 8));
  }
  else if ( page  == 3) {
    page =int(random(1, 8));
  }
   else if ( page  == 4) {
    page =int(random(1, 8));
  }
   else if ( page  == 5) {
    page =int(random(1, 8));
  }
   else if ( page  == 6) {
    page =int(random(1, 8));
  }
  else if ( page  == 7) {
    page =int(random(1, 8));
  }
  else if ( page  == 8) {
    page =int(random(1, 8));
  }
  //....
  println(page);
} 



