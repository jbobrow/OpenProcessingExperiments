
/* @pjs  font = "Garamond-80.vlw" ; preload = "falltree.png, oleaf1.png, oleaf2.png, yleaf1.png, yleaf2.png, bluepetal.png, pinkpetal.png, purplepetal.png, stem.png, degree.png, snowywintertree.png, springtree.png, summertree.png"  ; */

int myState=0;
int myCounter=0;
int x = 100 ;
int xDelta = -1 ;
float y1 = 402 ;
int y2 = 235 ;
int y3 = 185 ;
int y4 = 120 ;
int y5 = 140 ;
int a = 20 ;
int b = 20 ;
int a1 = 65 ;
int b1 = 70 ;
int a2 = 103 ;
int b2 = 80 ;
int a3 = 191 ;
int b3 = 140 ;
int a4 = 560 ;
int b4 = 135 ;
int a5 = 478 ;
int b5 = 160 ;

PImage degree ;
PImage snowtree ;
PImage springtree ;
PImage summertree ;
PImage falltree ;
PImage stem ;
PImage pinkpetal ;
PImage purplepetal ;
PImage bluepetal ;
PImage yleaf1 ;
PImage yleaf2 ;
PImage oleaf1 ;
PImage oleaf2 ;

PFont gara ;

void setup() {
  size(500, 500) ;
  frameRate(60) ;
    snowtree = loadImage("snowywintertree.png") ;
    summertree = loadImage("summertree.png") ;
    springtree = loadImage("springtree.png") ;
    falltree = loadImage("falltree.png") ;
    degree = loadImage("degree.png") ;
    stem = loadImage("stem.png") ;
    pinkpetal = loadImage("pinkpetal.png") ;
    bluepetal = loadImage("bluepetal.png") ;
    purplepetal = loadImage("purplepetal.png") ;
    oleaf1 = loadImage("oleaf1.png") ;
    oleaf2 = loadImage("oleaf2.png") ;
    yleaf1 = loadImage("yleaf1.png") ;
    yleaf2 = loadImage("yleaf2.png") ;
    
    gara = createFont("Garamond-80.vlw", 22) ;
  
}

void draw() {
  background(155) ;
println(mouseX +","+mouseY);
    
    
    
  myCounter = myCounter +1 ;
  //runs 1 time every 4 seconds
  if (myCounter > 4*60) {
  myState = myState + 1 ;
    if (myState > 4) {
    myState = 0;
    }
  myCounter = 0;
}
  
   switch(myState) {
     
//winter     
     case 0:
     background(#478AF2);
     fill(255);
     noStroke();
   
     image(snowtree, -50, 62) ; 
     
           
  ellipse(a, b, 4, 4) ;
  a = a + 4 ; //put if statement to reset
  if (a > width) {
  a = 0 ;
  }
  b = b + 4 ;
  if (b > height) {
  b = 50 ;
}
 ellipse(a1, b1, 3, 3) ;
  a1 = a1 + 3 ; //put if statement to reset
  if (a1 > width) {
  a1 = 0 ;
  }
  b1 = b1 + 3 ;
  if (b1 > height) {
  b1 = -10 ;
}
  ellipse(a2, b2, 5, 5) ;
  a2 = a2 + 6 ; //put if statement to reset
  if (a2 > width) {
  a2 = 0 ;
  }
  b2 = b2 + 6 ;
  if (b2 > height) {
  b2 = -20 ;
}
  ellipse(a3, b3, 5, 5) ;
  a3 = a3 + 2 ; //put if statement to reset
  if (a3 > width) {
  a3 = 0 ;
  }
  b3 = b3 + 2 ;
  if (b3 > height) {
  b3 = -200 ;
}
  ellipse(a4, b4, 3, 3) ;
  a4 = a4 + 3 ; //put if statement to reset
  if (a4 > width) {
  a4 = 0 ;
  }
  b4 = b4 + 3 ;
  if (b4 > height) {
  b4 = 0 ;
}
  ellipse(a5, b5, 3, 3) ;
  a5 = a5 + 1 ; //put if statement to reset
  if (a5 > width) {
  a5 = 0 ;
  }
  b5 = b5 + 1 ;
  if (b5 > height) {
  b5 = 50 ;
}

     rect(0, 400, width, 100);

     //text("we're in 0", 10, 20);
     break ;
 
 //spring    
     case 1:

     background(#478AF2);
     image(stem, 49, 325) ; 
     image(stem, 201, 325) ; 
     image(stem, 301, 325) ; 
     image(stem, 401, 325) ;  
     image(pinkpetal, 50, y1) ;  
     y1 = (y1 - .25) ;
     if (y1 < 334) {
       y1 = 402 ;
     }
     image(bluepetal, 205, y1) ;   
     image(purplepetal, 305, y1) ;    
     image(pinkpetal, 405, y1) ;       
     image(springtree, -55, 62) ; 
     fill(#068E0D);
     rect(0, 400, width, 100);
     fill(255);
     //text("we're in 1", 10, 20);
     fill(#F7F248);
     ellipse(500, 0, 150, 150);
     break ;
     
//summer     
     case 2:
     frameRate(60) ;
      println(mouseX +","+mouseY);
     background(#478AF2);

     fill(#F7F248);
     triangle(500, 0, -15, 55, 0, 12);
     triangle(500, 0, -15, 170, 0, 120);     
     triangle(500, 0, -15, 390, 0, 440);
     triangle(500, 0, -15, 240, 0, 285);
     triangle(500, 0, 140, 415, 203, 415);
     triangle(500, 0, 303, 415, 350, 415);     
     triangle(500, 0, 440, 415, 483, 415);
 
   
     fill(255, 0, 0, x);
     
     
 x = x + xDelta ;
if (x > 99) {
   xDelta = -2 ;
}
if (x < 1) {
  xDelta = 2 ;
}

     triangle(500, 0, -15, 55, 0, 12);
     triangle(500, 0, -15, 170, 0, 120);     
     triangle(500, 0, -15, 390, 0, 440);
     triangle(500, 0, -15, 240, 0, 285);
     triangle(500, 0, 140, 415, 203, 415);
     triangle(500, 0, 303, 415, 350, 415);     
     triangle(500, 0, 440, 415, 483, 415);
     
     image(summertree, -50, 62) ;   
     fill(#068E0D);
     rect(0, 400, width, 100);
     fill(255);
     
     fill(#F7F248);
     ellipse(500, 0, 150, 150);
     break ;
     
//fall     
     case 3:
     
     image(yleaf1, 37, y2) ;
     y2 = y2 + 1 ;
     if (y2 > 410) {
       y2 = 235 ;
     }     
     image(oleaf2, 27, y2) ;
     
     
     image(yleaf2, 87, y3) ;
     y3 = y3 + 1 ;
     if (y3 > 410) {
       y3 = 235 ;
     }     
     image(oleaf1, 97, y3) ;
     
     
     image(yleaf2, 155, y4) ;
     y4 = y4 + 1 ;
     if (y4 > 410) {
       y4 = 235 ;
     }     
     image(oleaf1, 165, y3) ;
 
     
     image(yleaf1, 285, y5) ;
     y5 = y5 + 1 ;
     if (y5 > 410) {
       y5 = 235 ;
     }  
     
     
     image(falltree, -55, 62) ; 
     fill(#8E6106);
     rect(0, 400, width, 100);
     fill(255);
     //text("we're in 3", 10, 20);
     break ;

//graduation bitches     
     case 4:

     image(degree, 0, 0);
     fill(0);
     textFont(gara) ; 
     text("...And then I crap", 15, 33);
     text("out a degree...", 29, 60);
     break ;
   } 
}




