
/* @pjs  font = "birthmark.ttf, Fuzzy.ttf, Garamond-80.vlw, rainBold.ttf" ; preload = "baby1.png, baby2.png, baby3.png, baby4.png, blueiphone65.png, greeniphone55.png, pinkiphone65.png, yellowiphone55.png, skull50.png, skull65.png"  ; */

int myState = 0 ;
int myCounter = 0 ;
int myCounter1 = 0 ;
int myCounter2 = 0 ;
int myCounter3 = 0 ;
int myCounter4 = 0 ;
int myCounter5 = 0 ;

float x = 0 ;
float y = 0 ;
float x1 = 0 ;
float y1 = 0 ;
float x2 = 0 ;
float y2 = 0 ;
float x3 = 0 ;
float y3 = 0 ;
float x4 = 0 ;
float y4 = 0 ;


PImage baby1 ;
PImage baby2 ;
PImage baby3 ;
PImage baby4 ;
PImage blueiphone65 ;
PImage greeniphone55 ;
PImage pinkiphone65 ;
PImage yellowiphone55 ;
PImage skull50 ;
PImage skull65 ;

PFont birthmark ;
PFont fuzzy ;
PFont gara ;
PFont rain ;
PFont rain1 ;
PFont rain2 ;

void setup() {
  size(510, 500) ;
    background(155) ;
    frameRate(60) ;
  
  baby1 = loadImage("baby1.png") ;
  baby2 = loadImage("baby2.png") ;
  baby3 = loadImage("baby3.png") ;
  baby4 = loadImage("baby4.png") ;
  blueiphone65 = loadImage("blueiphone65.png") ;
  greeniphone55 = loadImage("greeniphone55.png") ;
  pinkiphone65 = loadImage("pinkiphone65.png") ;
  yellowiphone55 = loadImage("yellowiphone55.png") ;
  skull50 = loadImage("skull50.png") ;
  skull65 = loadImage("skull65.png") ;
  
  birthmark = createFont("birthmark.ttf", 40) ;
  fuzzy = createFont("Fuzzy.ttf", 20) ;
  gara = createFont("Garamond-80.vlw", 22) ;
  rain2 = createFont("rainBold.ttf", 120) ;
  rain1 = createFont("rainBold.ttf", 90) ;
  rain = createFont("rainBold.ttf", 40) ;
   
}

void draw() {


 
   switch(myState) {
     
     case 0:
      myCounter5 = myCounter5 +1 ;
          
      fill(255) ;    
  textFont(rain1) ;  
     background(100) ;
     text("What's in a second?", 10, 90); 
  textFont(rain);   
     text("If the average human life span is 75 years.", 12, 220);
     text("That's 2. 3 billion seconds.", 12, 255);
     textFont(rain2) ;  
     text(myCounter5, 180, 400);
//     text("We hardly notice an individual second,", 10, 425);
//     text("and yet so much happens in each one.", 10, 455);
    textFont(gara);
    text("Click, then hit Enter to proceed...", 18, 480);
     break ;
     
     
     
     case 1:
     
//variables     
     myCounter = myCounter +1 ;

     x1 = random(490);
     y1 = random(390);
     
     
//skulls         
     if (myCounter > 33) {
       image(skull65, x1, y1) ;
       myCounter = 0;
     }
     
    fill(0);
    rect(0, 400, width, 100);
     fill(255);
       textFont(rain) ; 
     text("1.7 people die every second.", 10, 425);
     text("Approximately over 4 billion people will die", 10, 455);
     text("during your life span.", 10, 485);
  //   text("4023594000", width/2, height/2);


     
     break ;
     
     
     
     case 2: 
     
//variables     
     myCounter = myCounter +1 ;
     myCounter1 = myCounter1 +1 ;
     myCounter2 = myCounter2 +1 ;
     myCounter3 = myCounter3 +1 ;
     myCounter4 = myCounter4 +1 ;

 
     x = random(490);
     y = random(-400);
     x1 = random(490);
     y1 = random(-400);
     x2 = random(490);
     y2 = random(-400);
     x3 = random(490);
     y3 = random(-400);
     x4 = random(-12);
     y4 = random(-400);
     
//babies

     if (myCounter > 105) {
       image(baby1, x1, y1) ;
       myCounter = 45;
     }
    
     if (myCounter1 > 61) {
       image(baby2, x, y) ;
       
       myCounter1 = 1;
       
     }
     
     if (myCounter2 > 75) {
       image(baby3, x2, y2) ;
       
       myCounter2 = 15;
       
     }
     if (myCounter3 > 90) {
       image(baby4, x3, y3) ;
        
       myCounter3 = 30;
       
     }
      
     if (myCounter4 > 5 * frameRate) {
       image(baby4, x4, y4) ;
       myCounter4 = 0;
     }
     
    fill(0);
    rect(0, 400, width, 100);
     fill(255);     
        textFont(rain) ; 
     text("4.2 people are born every second.", 10, 425);
     text("Approximately over 10 billion people will be", 10, 455);
 //    text("9940644000", width/2, height/2);
     text("born during your life span.", 10, 485);
     break ;
     
     
     
     case 3:
     
     //variables     
     myCounter = myCounter +1 ;
     myCounter1 = myCounter1 +1 ;
     myCounter2 = myCounter2 +1 ;
     myCounter3 = myCounter3 +1 ;
     myCounter4 = myCounter4 +1 ;
     
     x = random(490);
     y = random(390);
     x1 = random(490);
     y1 = random(390);
     x2 = random(490);
     y2 = random(390);
     x3 = random(490);
     y3 = random(390);
     x4 = random(490);
     y4 = random(390);
     
//iphones

     if (myCounter > 60) {
       image(blueiphone65, x1, y1) ;
       myCounter = 0;
     }
     
     if (myCounter1 > 105) {
       image(pinkiphone65, x, y) ;
      
       myCounter1 = 45;
      
     }
     
     if (myCounter2 > 75) {
       image(greeniphone55, x2, y2) ;
       
       myCounter2 = 15;
       
     }
     if (myCounter3 > 90) {
       image(yellowiphone55, x3, y3) ;
       
       myCounter3 = 30;
       
     }
          
     if (myCounter4 > 75) {
       image(pinkiphone65, x4, y4) ;
       myCounter4 = 0;
     }
     
    fill(0);
    rect(0, 400, width, 100);
     fill(255); 
            textFont(rain) ; 
     text("4.7 iPhones were sold per second in Dec. 2013.", 5, 425);
     text("That's valued at 6.25 billion U.S. dollars.", 5, 455);
//     text("That's between 2.5 and 6.25 billion U.S. dollars", 5, 455);
//     text("based on pricing with contract and with out.", 5, 485);
     
     break ;
  
  
     
     case 4:    
          
     //variables     

     myCounter1 = myCounter1 +1 ;

     
     x = random(500);
     y = random(500);
     x1 = random(500);
     y1 = random(500);
     x2 = random(500);
     y2 = random(500);
     x3 = random(500);
     y3 = random(500);
     x4 = random(500);
     y4 = random(500);
     
// XXX    

fill(255);
  textFont(fuzzy) ;  
     text("X X X", x, y) ;
     text("X X X", x1, y1) ;
     text("X X X", x2, y2) ;
     text("X X X", x3, y3) ;
     
     if (myCounter1 > 2) {
       text("X X X", x4, y4) ;
       if (myCounter1 > 3) {
       myCounter1 = 0;
     }
    }

 fill(0) ;    
  textFont(gara) ;  
     text("787 porn searches are executed per second.", 40, 70);
     text("That means approximately 25 billion seconds", 40, 160); 
     text("are spent each year just searching for porn.", 40, 200); 
     text("That's over 13 minutes of human life", 40, 270); 
     text("spent searching for porn...", 40, 310); 
     text("every... second.", 40, 350); 
     text("That doesn't include time spent watching :)", 40, 410);      
     
     break ;
 
 } 
}


void keyPressed() {
 //essentially an "interupt"
 background(0);
  myState = myState + 1 ; 
  if (myState > 4) {
  myState = 0 ;
  
  
  }
  
}




