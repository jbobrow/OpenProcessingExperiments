
PFont font1, font2;
PImage img1, img2, img3, img4, img5, img6, img7, img8;

String p1 = "Life is made up of little things"; 
String p2 = "no great sacrifice of duty."; 
String p3 = "but smiles and many a cheerful word"; 
String p4 = "fill up our lives with beauty."; 
String p5 = "The heartaches, as they come and go"; 
String p6 = "are but blessings in disgises,"; 
String p7 = "for time will trun the pages o`er"; 
String p8 = "and snow us great surprises."; 
 
int page = 0;


void setup() {
  size(900, 600); 
  font1 = createFont("Arial", 100);
  font2 = createFont("Courier",50);
  
  img1 = loadImage("0.jpg");
  img2 = loadImage("1.jpg");
  img3 = loadImage("2.jpg");
  img4 = loadImage("3.jpg");
  img5 = loadImage("4.jpg");
  img6 = loadImage("5.jpg");
  img7 = loadImage("6.jpg");
  img8 = loadImage("7.jpg");
            

}

void draw() {
  textAlign(CENTER);

  if (page ==0) {
    background(0); 
    image(img1,0,0);
    fill(255,0,0);
    textFont(font2, 15); 
    text(p1, width/2, height/2);
  }
  else if (page ==1) {
    background(0); 
    image(img2,0,0);
    fill(0);
    textFont(font2, 15); 
    text(p2, width/2, 100);
  }  
  else if (page ==2) {
    background(255, 0, 0);
   image(img3,0,0); 
    fill(255,255,255);
    textFont(font2, 30); 
    text(p3, width/2 , 80 );
  }
  else if (page ==3) {
    background(255, 255, 0); 
    image(img4,0,0);
    fill(0);
    textFont(font1, 15); 
    text(p4,150 , height/2);
 
  }
  else if (page ==4) {
    background(255, 255, 0); 
    image(img5,0,0);
    fill(255,255,255);
    textFont(font1, 15); 
    text(p5, width/2, height/2);
 
  }
  else if (page ==5) {
    background(255, 255, 0); 
    image(img6,0,0);
    fill(255,255,204);
    textFont(font1, 15); 
    text(p6, width/2, 100);
 
  }
  else if (page ==6) {
    background(255, 255, 0);
   image(img7,0,0); 
    fill(0);
    textFont(font2, 40); 
    text(p7, width/2, 300);
 
  }
   else if (page ==7) {
    background(255, 255, 0);
   image(img8,0,0); 
    fill(255,255,255);
    textFont(font1, 15); 
    text(p8, width/2, 500);
 
  }
}


void mousePressed() {
  if ( page  == 0) {
    page  = 1;
  }
  else if ( page  == 1) {
    page  = 2 ;
  }
  else if ( page  == 2) {
    page  = 3;
  }
  else if ( page  == 3) {
    page =4;
  }
    else if ( page  == 4) {
    page  = 5 ;
  }
  else if ( page  == 5) {
    page  = 6;
  }
  else if ( page  == 6) {
    page = 7;
  }
  else if ( page  == 7) {
    page = 0;
  }

  println(page);
} 


