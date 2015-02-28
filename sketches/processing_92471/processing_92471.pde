
/*@pjs font = "BadIntentions.ttf, CFOneTwoTrees-Regular.ttf" ; */

 
/*press f to advance*/

int myState = 0 ;
PFont badintentions ;
PFont trees ;
//int myCtr = 2*60 ;
PImage SCENE1 ;
PImage SCENE2 ;
PImage SCENE3 ;
PImage SCENE4 ;
PImage SCENE5 ;

void setup() {
  
  size(500,500) ;
  badintentions = createFont("BadIntentions.ttf", 20);
  trees = createFont("CFOneTwoTrees-Regular.ttf", 20);
  SCENE1 = loadImage("scene1.jpg");
  SCENE2  = loadImage("SCENE2.jpg");
  SCENE3 = loadImage("SCENE3.jpg");
  SCENE4 = loadImage("SCENE4.jpg");
  SCENE5 = loadImage("SCENE5.jpg");
  //myCtr = 2*60 ;
}

void draw() {

  switch(myState) {
    
    case 0:
    image(SCENE1, 0, 0, 500, 500);
    fill(random(200), random(130), random(87));
    textFont(badintentions, 40);
    text("MOSHI!", 155, 310);
    text("MOSHI!", 160, 360);
    //time-based countdown for this state
   /*myCtr-- ;
    if (myCtr< 0) {
    myState = 1 ; //move to state 1
    myCtr = 2*60 ;
  }*/
    
    break ;
    
    case 1:
    
    image(SCENE2, 0, 0, 500, 500);
    textFont(badintentions, 18);
    fill(#ffffff);
    ellipse(310, 280, 250, 280);
    fill(#000000);
    text("What ghostly", 220, 230);
    text("deed shall", 220, 270);
    text("we do today", 220, 310);
    text("onee-chan?", 220, 350);
    
   /* myCtr-- ;
    if (myCtr< 0) {
    myState = 2 ;
    myCtr = 2*60 ;
    }*/
    break ;
    
    case 2: 
    image(SCENE3, 0, 0, 500, 500);
    textFont(trees, 60);
    fill(#000000);
    text("TAKE", 5-random(-3, 3), 170-random(-3, 3));
    text("OVER ", 5-random(-3, 3), 210-random(-3, 3));
    text("THE", 5-random(-3, 3), 250-random(-3, 3));
    text("WOOOORLD!!", 5-random(-3, 3), 290-random(-3, 3));
    
    /*myCtr-- ;
    if (myCtr< 0) {
    myState = 3 ;
    myCtr = 2*60 ;
    }*/
    break ;
    
    case 3: 
    image(SCENE4, 0, 0, 500, 500);
    textFont(badintentions, 18);
    fill(#ffffff);
    ellipse(410, 150, 250, 230);
    fill(#000000);
    text("eeeeh", 350, 100);
    text("how bout", 350, 130);
    text("something", 330, 160);
    text( "else", 350, 190);
    
    /*myCtr-- ;
    if (myCtr< 0) {
    myState = 3 ;
    myCtr = 2*60 ;
    }*/
    break ;
    
    case 4: 
    image(SCENE5, 0, 0, 500, 500);
    fill(random(38), random(72), random(117));
    textFont(badintentions,30);
    text("hehehe...", 150, height/2-random(-3, 3));
    /*myCtr-- ;
    if (myCtr< 0) {
    myState = 3 ;
    myCtr = 2*60 ;
    }*/
    break ;
    }

  }
  


void keyPressed() {
    if(key == 'F' || key == 'f') {
      myState = myState + 1;
      if (myState > 4) {
 myState = 0;
      }
    };
    
/*myState = myState + 1;
if (myState > 4) {
 myState = 0;*/
 
} 





