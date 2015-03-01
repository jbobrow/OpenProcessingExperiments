
/* @pjs font="title.ttf,story.ttf"; */  

int myState = 0 ;
int x = 0 ;

PImage title ; 
PImage dream ; 
PImage study ; 
PImage plane ;
PImage sky ; 
PImage paris ;

PFont font1 ; 
PFont font2 ;

void setup() {
  size (500, 500) ;
  
  font1 = createFont("title.ttf", 120) ;
  font2 = createFont("story.ttf", 120) ;
  
  title = loadImage ("title.jpg") ;
  dream = loadImage("dream.jpg") ;
  study = loadImage ("study.jpg") ;
  plane = loadImage ("airplane.png") ;
  sky = loadImage ("trip.jpg") ;
  paris = loadImage ("paris.jpg") ;
}

void draw() {

  switch(myState) {

  case 0:
    background (0) ; 
    image(title, 0, 0) ;
    fill (#000000) ; 
    textFont(font1, 100) ;
    text ("Lucy's", 55, 200) ;
    text ("Dream", 160, 355) ;
    break ;

  case 1 :
    background (0) ; 
    image(dream, 0, 0) ;
    textFont(font2, 40) ; 
    fill(#FF2E86) ; 
    text("Lucy has always dreamed of", 35, 410) ;
    fill(#2EADFF) ;
    text("Paris.", 200, 470) ;  
    break ;

  case 2 :
    background (0) ; 
    image (study, 0, 0) ;
    fill (#FFFFFF) ;
    textFont(font2, 24) ;
    text ("She loved it so much,", 150, 310) ;
    text ("it started to influence", 150, 340) ;
    fill(#F5DBFF) ; 
    text ("her style.", 200, 370) ;
    break ; 

  case 3 :
    background (0) ;
    image (sky, 0, 0) ;
    image (plane, x, 150, 250, 200) ; 
    x = x + 2 ; 
    if (x > width) {
      x = 0 ;
    }
    textFont(font2, 30) ;
    fill (#000000) ;
    text("When she was finally old enough,", 60, 430) ;
    text("she jumped on a plane to Paris.", 68, 470) ; 
    break ;

  case 4 :
    background (0) ;
    image(paris, 0, 0) ;
    textFont(font2, 27) ;
    fill (#000000) ;
    text ("Once she arrived,", 20, 170) ;
    text ("Lucy realized it was", 30, 205) ; 
    text ("just as she", 40, 240) ; 
    fill(#FF2E86) ;
    text("dreamed!", 155, 240) ;
    break ;
  }
}

void mouseReleased() {
  myState = myState + 1 ;  
  if (myState > 4) {
    myState = 0 ;
  }
}



