
int myState = 0;
int x = 0;
PFont google ;
PImage dog;


void setup() {
  size(500,500);

 /*background image*/
  dog = loadImage("dog.jpg");

  /*text*/
  google = createFont("google.ttf", 120);
  textFont(google);
}

void draw()
{

 textAlign(CENTER, CENTER) ;
  background(0);
  image(dog, 0, 0);

  switch(myState) {

    case 0:
    background(255, 0, 0) ;
    text("OHHHH", width/2, height/2) ;
    break ;

    case 1:
    background(0, 255, 0) ;
    text("ME SO", width/2, height/2) ;
    break ;

    case 2:
    background(#0F0F0F);
    textSize(50);
    text("HUNGRY.", width/2, height/2) ;
    break ;

    case 3:
    image(dog, 0, 0, width, height);
    textSize(50);
    fill(#050505);
    text("YA NASTY!", 250, 400) ;
    break ;




  }

}

/*HOW DO YOU STOP THE MOUSE PRESS AFTER "GOTCHA PERV!" AND GO BACK TO THE FIRST CASE*/


void mousePressed() {
  myState = myState + 1 ;
  if (myState > 3) {
    myState = 0 ;
  }
}



