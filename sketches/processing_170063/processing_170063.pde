
/* @pjs preload="start.jpg" ; "casea.jpg" ; "lefta.jpg" ; "leftb.jpg" ; "middle.jpg" ; "rightb.jpg" ; "righta.jpg" ; font = "chubby.ttf" ; */
int myState = 0 ;
int x = 0 ;
PImage[] pics = new PImage[5];
PImage start ;
PImage casea ;
PFont chubby ;

void setup() {
  frameRate(10) ;
  size(500, 500) ;
  start = loadImage("start.jpg") ;
  casea = loadImage("casea.jpg") ;
  chubby = createFont("chubby.ttf", 24) ;
  
  pics[0] = loadImage("lefta.jpg") ;
  pics[1] = loadImage("leftb.jpg") ;
  pics[2] = loadImage("middle.jpg") ;
  pics[3] = loadImage("rightb.jpg") ;
  pics[4] = loadImage("righta.jpg") ;
}

void draw() {
  switch(myState) {

  case 0:
    //Start Button
    image(start, 0, 0, width, height) ;
    textFont(chubby, 16) ;
    fill(#000000) ;
    text("Hello!", 10, 90) ;
    text("My name is Holly Hooper.", 10, 110) ;
    text("Would you like to hula-hoop", 10, 130) ;
    text("with me?", 10, 150) ;
    fill(#F2210A) ;
    rect(50, 200, 130, 55) ;
    fill(#000000) ;
    text("START", 70, 233) ;
    break ;

  case 1:
    image(casea, 0, 0, width, height) ;
    textFont(chubby, 16) ;
    fill(#000000) ;
    text("Great!", 20, 90) ;
    text("Let's get started then.", 20, 110) ;
    text("Start with the hula-hoop", 20, 130) ;
    text("at your waist.", 20, 150) ;
    fill(#F2210A) ;
    rect(50, 300, 100, 55) ;
    fill(#000000) ;
    text("Next", 70, 340) ;
    break ;

  case 2:
    background(255) ; 
    image(pics[x], 0, 0) ;
    x++ ;
    if (x > 2) {
      x = 0 ;
    }
    textFont(chubby, 16) ;
    fill(#000000) ;
    text("Trace your hips in a", 50, 90) ;
    text("circle to keep the hoop up!", 50, 110) ;
    break ;

  case 3: 
    image(casea, 0, 0, width, height) ;
    textFont(chubby, 16) ;
    fill(#000000) ;
    text("Great!", 20, 90) ;
    text("You've got it!", 20, 110) ;
    text("Keep on going!", 20, 130) ;
    fill(#F2210A) ;
    rect(50, 300, 100, 55) ;
    fill(#000000) ;
    text("Next", 70, 340) ;
    break ;

  case 4:
    image(start, 0, 0, width, height) ;
    textFont(chubby, 16) ;
    fill(#000000) ;
    text("Thanks for hula-hooping", 10, 90) ;
    text("with me!", 10, 110) ;
    text("Would you like to hoop again?", 10, 430) ;
    fill(#F2210A) ;
    rect(410, 430, 250, 50) ;
    fill(#000000) ;
    text("Yes!", 420, 460) ;
  }
}

void mousePressed() {
  myState = (myState + 1 ) % 5 ;
}



