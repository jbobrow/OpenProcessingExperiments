
/* @pjs font = "PrincessSofia-Regular.ttf" ; */
 
int x=0; 
int myState = 0 ;
PImage mountain;
PFont myFont ;
int myCtr ;
 
 void setup() {
  size(500, 500) ;
  mountain=loadImage ("mountain.jpg");
  myFont = createFont("PrincessSofia-Regular.ttf", 200);
  //textFont(myFont, 30) ;
  //textAlign(CENTER, CENTER) ;
  smooth();
  frameRate(20) ;
  
  myCtr = 1*20 ;

}
 
void draw() {
   background(255);
   
   switch(myState) {
     
    case 0:
    background (#06557E) ; 
    fill(#FFF705);
    ellipse(400, 80, 100, 100);
    textFont(myFont, 45) ;
    textAlign(CENTER, CENTER) ;
    fill(255);
    text("Have you ever heard the wolf",width/2, height/2.5);
    text("cry to the blue corn moon", width/2, height/2);

     
    myCtr-- ;
    if (myCtr < 0) {
    myState = 1 ;
    myCtr = 1*20 ;
   }
   
    break ;
   
    case 1:
    background(000);
    fill(255);
    pushMatrix ();
    rotate (radians (180));
    arc(-250, -365, 160, 150, PI, TWO_PI);
    popMatrix ();
      textFont(myFont, 45) ;
      textAlign(CENTER, CENTER) ;
      fill(#FF0900);
      text("or asked the grinning bobcat",width/2, height/2.5);
      text("why he grinned?", width/2, height/2);
     
    myCtr-- ;
    if (myCtr < 0) {
      myState = 2 ;
      myCtr = 1*20 ;
     
    }
     
    break ;
     
    case 2:
    //background(255);
    image (mountain, 0, 0, width, height);
    textFont(myFont, 45);
    textAlign(CENTER, CENTER) ;
    fill(000);
    text("Can you sing with all",width/2, height/2.5);
    text("the voices of the mountains?", width/2, height/2);
     
       myCtr-- ;
    if (myCtr < 0) {
      myState = 3 ;
      myCtr = 1*20 ;
    }
    break;
    
    case 3:
    background (#FF71F1) ;
    textFont(myFont, 45) ;
    textAlign(CENTER, CENTER) ;
    fill(#3A29FF);
    text("Can you paint with all",width/2, height/2.5);
    text("the colors of the wind?", width/2, height/2);
     
       myCtr-- ;
    if (myCtr < 0) {
      myState = 4 ;
      myCtr = 1*20 ;
    }
    break;
     
    case 4:
    background((random(255)),(random(255)),(random(255)));
    textFont(myFont, 45) ;
    textAlign(CENTER, CENTER) ;
    fill(000);
    text("Can you paint with all",width/2, height/2.5);
    text("the colors of the wind?", width/2, height/2);
    
       myCtr-- ;
    if (myCtr < 0) {
      myState = 4 ;
      myCtr = 1*20 ;
    }
    break;
   
  }
}


