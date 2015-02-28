
/* @pjs font="Raleway-Heavy.ttf"; */
/* @pjs font="Raleway-Medium.ttf"; */

PFont rh ;
PFont rm ;


PImage np1 ;
int x = -500 ;
int y = 400 ;

void setup() {
  frameRate(48) ;
  size(600, 400) ;
   rh = createFont("Raleway-Heavy.ttf", 240) ; 
   rm = createFont("Raleway-Medium.ttf", 240) ;
   
   np1 = loadImage("midwest_water_scenes.jpeg") ;
   
}

void draw () {
  background(100) ;
  
image(np1, 0, 0, width, height) ;

  fill(255, 70) ; //fading in and out
  textFont(rh, 200) ;
  //textAlign(CENTER, CENTER) ;
  text("Nippersink", x, height/2) ;
  
  x--;
  if (x < 3) {
   x = 400 ; 
  }
  
  textFont(rm, 120) ;
  text("Nippersink", x-200, y-40) ;
  
   y--;
  if (y < 6) {
   y = 200 ; 
  }
  
  fill(#FFFFFF) ;
  textFont(rm, 18) ;
  text("About a third of your neighbors currently use phosphate free fertilizers", 20,  40) ;
  
  textFont(rm, 15) ;
  text("Respondents seemed to make a connection", 20, 80) ;
  text("between their concern for excess nitrogen", 20, 95) ;
  text("and a likely source of that pollutant,", 20, 110) ;
  text("lawn fertilizers.", 20, 125) ;
  
  text("Efforts to target residential homeowners", 20, 155) ;
  text("regarding the proper use, application and purchase", 20, 170) ;
  text("various environmentally friendly lawn fertilizer", 20, 185) ;
  text("products may have a positive impact on further", 20, 200) ;
  text("reducing excess nitrogen in the watershed.", 20, 215) ;
  
  text("Properly disposing of wet paste, keeping grass", 20, 245) ;
  text("clippings and leave out of the roads, ditches", 20, 260) ;
  text("and gutters, inspecting their septic system for", 20, 275) ;
  text("size and condition and using phosphate free fertilizer.", 20, 290) ;
  
}


