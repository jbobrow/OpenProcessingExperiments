
int myState = 0 ;
PImage band ; 
PImage drive ;
PImage lone ;
PImage moon ;
PImage good ; 
PImage dead ;

void setup() {
  size(500,500) ;
  band = loadImage("modest_mouse.jpg") ;
  drive = loadImage("long_drive.jpg") ;
  lone = loadImage("lonesome.jpg") ;
  moon = loadImage("moon_in.jpg") ;
  good = loadImage("bury_me.jpg") ;
  dead = loadImage("dead_before.jpg") ;

}

void draw() { 

  switch(myState) {
    case 0: 
    background(0) ;
    imageMode(CENTER) ;
    image(band, 250, 200) ;
    textSize(30) ;
    textAlign(CENTER);
    text("Modest Mouse Discography", 250, 40) ;
    textSize(15) ;
    text("Long Drive for Someone With Nothing To Think About - Press 'L'", 250, 400) ;
    text("Lonesome Crowded West - Press 'C'", 250, 416) ;
    text("Moon & Antarctica - Press 'M'", 250, 431) ;
    text("Good News for People Who Love Bad News - Press 'G'", 250, 446) ;
    text("We Were Dead Before the Ship Even Sank - Press 'W'", 250, 461) ;
    text("For home screen - Press 'H'", 250, 477) ;
    break ; 
    
    case 1: 
    background(0) ;
    imageMode(CENTER) ;
    image(drive, 250, 250) ;
    textSize(30) ;
    text("This is a Long Drive for Someone", 250, 40) ;
    text("with Nothing to Think About", 250, 71) ;
    textSize(20) ;
    text("Released in 1996", 250, 450) ;
    break ;
    
    case 2:
    background(0) ;
    imageMode(CENTER) ;
    image(lone, 250, 250) ;
    textSize(30) ;
    text("Lonesome Crowded West", 250, 40) ;
    textSize(20) ;
    text("Released in 1997", 250, 450) ;
    break ; 
    
    case 3: 
    background(0) ;
    imageMode(CENTER) ;
    image(moon, 250, 250) ;
    textSize(30) ;
    text("The Moon & Antarctica", 250, 40) ;
    textSize(20) ;
    text("Released in 2000", 250, 480) ;
    break;
    
    case 4: 
    background(0) ;
    imageMode(CENTER) ;
    image(good, 250, 250, width/1.5, height/1.5) ;
    textSize(30) ;
    text("Good News for People", 250, 40) ;
    text("Who Love Bad News", 250, 71) ;
    textSize(20) ;
    text("Released in 2004", 250, 450) ;
    break;
    
    case 5: 
    background(0) ;
    imageMode(CENTER) ;
    image(dead, 250, 250) ;
    textSize(30) ;
    text("We Were Dead Before", 250, 40) ;
    text("the Ship Even Sank", 250, 71) ;
    textSize(20) ;
    text("Released in 2007", 250, 450) ;
    break;
    
  }
}

void keyPressed() {
 if (key == 'l') 
    myState = 1 ;
    
 if (key == 'c') 
    myState = 2 ;
    
 if (key == 'm') 
    myState = 3 ;
    
 if (key == 'g') 
    myState = 4 ;
    
 if (key == 'w') 
    myState = 5 ;

 if (key == 'h') 
    myState = 0 ; 
 
       }



