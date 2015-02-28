
/* @pjs font="Roboto-Regular.ttf"; */

int y = 0 ;
int y1 = -250 ;
int y2 = -480 ;
int y3 = -520 ;
int y4 = -560 ;
int y5 = -600 ;
int y6 = -640 ;
PImage sunset ;
PFont helv ;


void setup() {
  frameRate(24) ;
  size(752, 422) ;
  helv = createFont("Roboto-Regular.ttf") ;
  textFont(helv) ;
  sunset = loadImage("sunset.jpg") ;

}

void draw() {

  image(sunset, 0, 0) ;

  textFont(helv, 24) ;
  text("Imagine...", 25, 250) ;


  textFont(helv, 24) ;
  text("All the People...", 140, y) ;
  y = y + 12 ;
  if (y > 250) {
    y = 250 ;
  }


  textFont(helv, 24) ;
  text("Living life in", 320, y1) ;
  y1 = y1 + 8 ;
  if (y1 > 250) {
    y1 = 250 ;
  }


  textFont(helv, 48) ;
  text("P", 460, y2) ;
  y2 = y2 + 8 ;
  if (y2 > 250) {
    y2 = 250 ;
  }


  textFont(helv, 48) ;
  text("E", 495, y3) ;
  y3 = y3 + 8 ;
  if (y3 > 250) {
    y3 = 250 ;
  }


  textFont(helv, 48) ;
  text("A", 530, y4) ;
  y4 = y4 + 8 ;
  if (y4 > 250) {
    y4 = 250 ;
  }


  textFont(helv, 48) ;
  text("C", 565, y5) ;
  y5 = y5 + 8 ;
  if (y5 > 250) {
    y5 = 250 ;
  }


  textFont(helv, 48) ;
  text("E", 600, y6) ;
  y6 = y6 + 8 ;
  if (y6 > 250) {
    y6 = 250 ;
  }
}



