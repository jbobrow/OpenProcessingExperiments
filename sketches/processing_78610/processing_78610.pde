
                ///////////////////
                ///Simple Timer///
                //////////////////
/*Displays stopwatch-style time in seconds and minutes*/



int actualSecs; //actual seconds elapsed since start
int actualMins; //actual minutes elapsed since start
int startSec = 0; //used to reset seconds shown on screen to 0
int startMin = 0; //used to reset minutes shown on screen to 0
int scrnSecs; //seconds displayed on screen (will be 0-60)
int scrnMins=0; //minutes displayed on screen (will be infinite)
int restartSecs=0; //number of seconds elapsed at last click or 60 sec interval
int restartMins=0; //number of seconds ellapsed at most recent minute or click


void setup() {
size(600,500);

smooth();
PFont font;
font = createFont("Arial.ttf", 72); // Arial, 16 point, anti-aliasing on
textFont(font, 72);


}  

void draw(){
background(0);
  
////////////////////////////////////  
/*this section is the "mathy" part*/
////////////////////////////////////
  actualSecs = millis()/1000; //convert milliseconds to seconds, store values.
  actualMins = millis() /1000 / 60; //convert milliseconds to minutes, store values.
  scrnSecs = actualSecs - restartSecs; //seconds to be shown on screen
  scrnMins = actualMins - restartMins; //minutes to be shown on screen
 
  if (mousePressed) { //if mouse is pressed, restart timer
    restartSecs = actualSecs; //stores elapsed SECONDS
    scrnSecs = startSec; //restart screen timer  
    restartMins = actualMins; //stores elapsed MINUTES
    scrnMins = startMin; //restart screen timer
  } 

  if (actualSecs % 60 == 0) { //after 60 secs, restart second timer  
      restartSecs = actualSecs;   //placeholder for this second in time
      scrnSecs = startSec; //reset to zero
    }
    
  println(scrnSecs); //print timer to console (secs)
  println(scrnMins);//print timer to console (mins)
  
  
///////////////////////////////////////////////////  
////*this section controls the visual elements*////
///////////////////////////////////////////////////

//displays time on screen
textAlign(CENTER);
fill(255);
text(nf(scrnMins, 2) + " : " + nf(scrnSecs, 2), width/2, height/2);

//call ellipse drawing function
drawEllipses(scrnSecs, scrnMins);

}

//function to draw stationary grid of ellipses
//also draws larger ellipses in the correct locations on the grid to represent seconds
void drawEllipses(int screenSeconds, int screenMinutes){
  int ix;
  int iy;
  for(ix = 10; ix < width; ix+=10) {
    for(iy = 10; iy <height; iy+=10) {
      strokeWeight(2);
      stroke(240);
      fill(255, 2);
      point(ix, iy);
      if (screenSeconds*10 == ix && screenSeconds*10 == ix ){
          ellipse(screenSeconds * 10, screenMinutes * 10 + 10, 10, 10); //larger ellipses
          filter(INVERT);     //inverts screen colors (mostly black screen) @ minute marks
      }
    }    
  }
}






