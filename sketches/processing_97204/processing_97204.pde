
/* @pjs font = "Kavoon-Regular.ttf" ; */

PImage dawn;
PImage day;
PImage sunset;
PImage dusk;
PImage night;
PFont myFont;

void setup() {
  size(500, 500) ; 
  smooth();
  myFont = createFont("Kavoon-Regular.ttf", 200);
  
  dawn=loadImage ("dawn.jpg");
  day=loadImage ("day.jpg");
  sunset=loadImage ("sunset.jpg");
  dusk=loadImage ("dusk.jpg");
  night=loadImage ("night.jpg");
  
}


void draw() {
   background(255);
  

  
  switch(hour()) {
    case 5:
    case 6:
    case 7:
    case 8:
    image(dawn, 0, 0, width, height) ; //5am - 8am
    break ;
    
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    image(day, 0, 0, width, height) ; //9am - 4pm
    break ;
    
    case 17:
    case 18:
    case 19:
    image(sunset, 0, 0, width, height) ; //5pm - 7pm
    break ;
    
    case 20:
    case 21:
    case 22:
    image(dusk, 0, 0, width, height) ; //8pm - 10pm
    break ;
    
    case 23:
    case 24:
    case 1:
    case 2:
    case 3:
    case 4:
    image(night, 0, 0, width, height) ; //11pm - 4am
    break ;
    
  }
  
   textFont(myFont,100); 
   fill (000);
   text(nf(hour(), 2) + ":" + nf(minute(), 2), 130, 130);

  
}


