
PImage neighborhood ; //nickname!
PFont kristen ; //font nickname1!
PFont kristen2 ; //font nickname2
PFont kristen3 ; //font nickname5
PFont oldEng ; //font nickname3
PFont alge ; //font nickname4
PFont bold ; //font nickname6
PFont george ; //font nickname7

int x = 0 ;
int x1 = 0 ;
int x2 = 0 ;


void setup() {

  size(600, 600) ;



//data folder resources

neighborhood = loadImage("street scene_HPIM0198_Photoshop.jpg") ;
kristen = loadFont("KristenITC-Regular-90.vlw") ;
kristen2 = loadFont("KristenITC-Regular-75.vlw") ;
kristen3 = loadFont("KristenITC-Regular-150.vlw") ;
oldEng = loadFont("OldEnglishTextMT-90.vlw") ;
alge = loadFont("Algerian-65.vlw") ;
bold = loadFont("Dialog.bold-150.vlw") ;
george = loadFont("Georgia-150.vlw") ;

image(neighborhood, 0, 0, width, height) ;

}

//text properties

void draw() { 
 image(neighborhood, 0, 0, width, height) ; 
fill(#FF0000) ;
textFont(kristen, 100) ;
text("people out of work", x, 150);
  x = x + 2 ;
  if(x > width) {
    x = 0 ;
  }

fill(#2CD313) ;
textFont(kristen2, 75) ;
text("jobs not around", x-200, 530) ;
  x1 = x1 + 1 ;
  if(x1 > width) {
    x1 = 0 ;
  }


fill(#050505) ;
textFont(oldEng, 80) ;
text("the old coal mines", x2, 400) ;
  x2 = x2 - 1 ;
  if(x2 < 0) {
    x2 = width ;
  }

fill(#EAF5E8) ;
textFont(alge, 65) ;
text("utter not a sound", 0, 275) ;
  x = x + 1 ;
  if(x > 600) {
    x = 0 ;
  }

fill(#FFFFFF) ;
textFont (kristen3, 100) ;
text("up and down the blocks, the blocks around my town", 0, 275, 45) ;
  x1 = x + 2 ;
  if(x < 0) {
    x = 0 ;
  }

fill(#FFFFFF) ;
textFont(kristen3, 90) ;
text("the rows of  “for sale” signs old and run down", 0, 400, 45) ;
  x = x + 1 ;
  if(x > 600) {
    x = 0 ;
  }

fill(#2CD313) ;
textFont(kristen3, 95) ;
text("many years ago when the plant and coal were tops", 0, 200) ;
text("we all thought prosperity just couldn’t stop", 0, 300) ;
 
 
 //stopping point!!!!!
 
 

fill(#93BF8D) ;
textFont(bold, 100) ;
text("but hard times came upon us maybe it was fate", 0, 375);
fill(#000000) ;
text("the plant turned off its whistle and closed and locked its gates", 0, 400) ;


fill(#4BA9F0) ;
textFont(george, 150) ;
text("This town where I live I have a lot of faith", 0, 275) ;
textFont(george, 100) ;
text("it’s given me good and bad times that I cannot repay", 0, 375) ;
textFont(george, 150) ;
text("this town where I live it’s where I plan to stay", 0, 275) ;
text("after all these years I still believe today", 0, 375) ;

}


