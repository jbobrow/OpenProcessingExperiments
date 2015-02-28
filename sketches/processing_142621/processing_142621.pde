

PFont my_font; 
PImage img;
PImage poland;
int wordX = -310 ;
int state = 0 ;

void setup () {
  
img = loadImage("star.png");
poland = loadImage("poland.jpg");

  size(800, 500);
  background(0);
  my_font = loadFont("Times-Roman-48.vlw");
textFont(my_font, 54);
  
}

void draw() {
  wordX = wordX + 1 ;
 if (wordX > width) {
   wordX = -310 ; 
 }

  background(30, 144, 255) ;

//  println(state) ;

  switch(state) {

  case 0:
    background(255, 250, 250) ;
    fill(0, 100, 0) ;
    rect(-2, -2, 266, 500) ;
     fill(178, 34, 34) ;
    rect(533, -2, 266, 500) ;
    textSize(140); 
    fill(0);
 text("ITALY", wordX, 245);
 
  wordX = wordX + 1 ;
 if (wordX > width) {
   wordX = -310 ; 
 }
    break; 

  case 1:
    background(255, 250, 250) ;
    fill(178, 34, 34) ;
    rect(-1, 240, 800, 500) ;
    image(poland, 315, 30);
    textSize(140); 
    fill(0);
 text("POLAND", wordX, 245);
   wordX = wordX + 1 ;
 if (wordX > width) {
   wordX = -230 ; 
 }
    break;

  case 2:

 background(255, 215, 0) ;
    fill(178, 34, 34) ;
    rect(-1, 166, 800, 500) ;
    fill(0, 100, 0) ;
    rect(-1, 333, 800, 500);
        fill(0);
        textSize(100);
 text("LITHUANIA", wordX, 245);
   wordX = wordX + 1 ;
 if (wordX > width) {
   wordX = -5000;
 }
    break;
    

  case 3:
  background(0, 0, 205) ;
    fill(255, 250, 250) ;
    rect(-1, 100, 800, 500) ;
    fill(0, 0, 205) ;
    rect(-1, 400, 800, 500);
image(img, 290, 140);

    fill(0);
 text("ISRAEL", wordX, 245);
   wordX = wordX + 1 ;
 if (wordX > width) {
   wordX = -2;
 }
    break;
    
  case 4: 
 background(255, 250, 250) ;

    fill(178, 34, 34) ;
    rect(-1, 240, 800, 500) ;
    fill(0, 0, 128); 
 triangle(-1, -1, -1, 500, 390, 241);
     fill(0);
     textSize(100);
 text("CZECH REPUBLIC", wordX, 245);
   wordX = wordX + 1 ;
 if (wordX > width) {
   wordX = -2;
 }
    break;
  }
}
  

void mousePressed() {
  //state++ ;

  state = ++state % 5 ;
}



