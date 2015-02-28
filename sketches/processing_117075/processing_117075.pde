
PFont font1, font2; 
PImage img1, img2, img3, img4;
float angle=0;

String p1 = "Said Hamlet to Ophelia,"; 
String p2 = "I'll draw a sketch of thee,"; 
String p3 = "What kind of pencil shall I use?"; 
String p4 = "2B or not 2B?"; 


int page = 0;


void setup() {
  size(500, 500); 
  font1 = loadFont("Baskerville-SemiBold-48.vlw");
  font2 = loadFont("Baskerville-BoldItalic-60.vlw");
  img1=loadImage("img1.jpg");
  img2=loadImage("img2.jpg");
  img3=loadImage("img3.jpg");
  img4=loadImage("img4.jpg");
}

void draw() {
  textAlign(CENTER);

  if (page ==0) {
    image(img1, 0, 0);
    fill(0, 0, 0);
    textFont(font1, 30); 
    text(p1, width/2, 140);
  }
  else if (page ==1) {
    image(img2, 0, 0); 
    fill(255, 255, 255);
    textFont(font2, 40); 
    text(p2, width/2, 40);
  }  
  else if (page ==2) {
    image(img3, 0, 0);
    fill(255, 255, 0);
    textFont(font2, 30); 
    text(p3, width/2, TOP);
  }

  else if (page ==3) {
    image(img4, 0, 0);
    fill(255, 0, 0);
    textFont(font2, 70); 
    text(p4, width/2, 430);
  }
}


void mousePressed() {
  if ( page  == 0) {
    page  = int(random(1, 3));
  }
  else if ( page  == 1) {
    page  = int(random(2, 3));
  }
  else if ( page  == 2) {
    page  = int(random(3, 0));
  }
  else if ( page  == 3) {
    page =int(random(0, 2));
  }
  //....
  println(page);
} 

