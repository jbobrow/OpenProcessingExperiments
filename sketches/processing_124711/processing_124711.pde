
//When the flower blooms, the bees come uninvited.
//Ramakrishna

/* @pjs preload="flower2.jpg, beeweb.png";font="LaBelleAurore.ttf"; */

PFont myFont ;
PImage flower;
PImage bee ;
int myState = 0 ;
int myCounter = 100 ;
int x = 1000;
int i = 1000;

void setup(){
  size(1008, 672);
  flower = loadImage("flower2.jpg");
  bee = loadImage("beeweb.png");  
   myFont = createFont("LaBelleAurore.ttf", 400);
}

void draw () {
  noStroke();
  smooth(); 
  background(flower);
  
  textFont(myFont, 20);
    text("~Ramakrishna", 890, 650);
    
 textFont(myFont, 150); 
 
   myCounter--;

  switch(myState) {
    
  case 0:
  text ("When the flower blooms,...", x,200);
    x=x-5;
  if (x < -1800) {
  x=1000;
  if (myCounter < 0 ) { // go to the next state
     myCounter = 550 ; // case 1 will have 550 counts
     myState = 1;
  }
  }
  break;
  
  case 1:
  text ("the bees come uninvited.", i,500);
  i=i-5;
  if (i < -2000) {
  i=1000;
  }
    if (myCounter < 0 ) { // go to the next state
     myCounter = 100 ; // case 2 will have 100 counts
     myState = 2;
  }
  break ;
  
  
  case 2:
  image(bee, 800, 500, width/7, height/7);
  
    if (myCounter < 0 ) { // go to the next state
     myCounter = 100 ; // case 4 will have 100 counts
     myState = 3;
  }
  break;
  
  case 3:
  image(bee, 300, 300, width/7, height/7);
  
    if (myCounter < 0 ) { // go to the next state
     myCounter = 100 ; // case 5 will have 100 counts
     myState = 4;
  }
  break;
  
  case 4:
  image(bee, 500, 200, width/7, height/7);
  
    if (myCounter < 0 ) { // go to the next state
     myCounter = 100 ; // case 5 will have 100 counts
     myState = 5;
  }
  break;
  
  case 5:
  image(bee, 200, 100, width/7, height/7);
  
    if (myCounter < 0 ) { // go to the next state
     myCounter = 550 ; // case 0 will have 550 counts
     myState = 0;
  }
  break;

  }

}



