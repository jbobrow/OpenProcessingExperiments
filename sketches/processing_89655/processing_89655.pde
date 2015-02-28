
/* @pjs font="Raleway-Regular.ttf"; */
/* @pjs font="Raleway-SemiBold.ttf"; */

PFont rr ;
PFont rsb ;

int x = 375 ;
PImage water ;
PImage nippersink ;


void setup() {
  frameRate(24) ;
  size(800, 600) ;
  rr = createFont("Raleway-Regular.ttf", 240) ;
  rsb = createFont("Raleway-SemiBold.ttf", 240) ;
  water = loadImage("water.jpg") ;
  nippersink = loadImage("nippersink.jpg") ;
  
}

void draw() {
  background(100) ;
  image(water, 0, 0, width, height) ;
  noStroke() ;
  fill(0, 0, 0, 180) ;
  rect(0, 250, width, height) ;
  
  fill(255, 110) ;
  textFont(rr, 180) ;
  text("Nippersink", x, 200) ; 
  
  x-- ;
  if (x < 0) {
    x = 300 ;
  }
  
  fill(#FFFFFF, 255) ;
  textFont(rsb, 28) ;
  textAlign(CENTER) ;
  text("-- Residence say its their responsibility --", width/2, 280) ;
  textAlign(LEFT) ;
  textFont(rr, 22) ;
  text("“Lawn and yard care can influence water", 55, 335) ;
  text("quality in local streams and lakes.”", 63, 365) ;
  
  text("“It is my personal responsibility to", 55, 410) ;
  text("help protect water quality.”", 63, 440) ;
  
  text("“My actions have an impact on water quality.”", 55, 485) ;
  
  text("“Economic stability of community depends", 55, 530) ;
  text("on good water quality.”", 63, 560) ;
  fill(255) ;
  rect(555, 305, 220, 274) ;
  image(nippersink, 565, 315) ;
}


