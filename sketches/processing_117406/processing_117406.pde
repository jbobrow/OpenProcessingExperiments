
int myState = 0 ;
int myCounter = 120 ;

PImage title ;
PImage web ;
PImage graphic ;
PImage film ;
PImage digital ;

void setup() {  
  size(600, 400);

  title = loadImage("title-01.png") ;
  web = loadImage("webdesign-03.png") ;
  graphic = loadImage("graphicdesign-02.png") ;
  film = loadImage("film-02-01.png") ;
  digital = loadImage("digital-02-01.png") ;
}

void draw() {

  myCounter = myCounter - 1 ;
  if (myCounter < 0) {
    myState = myState + 1 ;
    if (myState > 4) {
      myState = 0 ;
    }
    myCounter = 120 ;
  }



  background(255);

  switch(myState) {

  case 0:
    image(title, 0, 0);
    break; 

  case 1:
    image(web, 0, 0) ;
    break; 

  case 2:
    image(graphic, 0, 0) ;
    break; 

  case 3:
    image(film, 0, 0) ;
    break; 

  case 4:
    image(digital, 0, 0) ;
    break;
  }
}




