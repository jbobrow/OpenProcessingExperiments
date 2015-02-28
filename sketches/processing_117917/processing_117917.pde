
/* @pjs preload ="fog.jpg" ; */
/* @pjs preload ="glass.jpg" ; */
/* @pjs preload ="night.JPG" ; */
/* @pjs preload ="overhead.jpg" ; */
/* @pjs preload ="Logo.png" ; */
/* @pjs font = "data/Roboto-Thin.ttg" ; */
int myState = 0 ;
int myCounter = 100 ;
int x = 150 ;
PImage fog  ;
PImage night  ;
PImage desk  ;
PImage glass  ;
PFont myFont ;
PImage logo ;


void setup() {
  myFont = createFont("Roboto-Thin", 14) ;
  size(600, 400) ;
  smooth () ;
  fog = loadImage("fog.jpg") ;
  night = loadImage("night.JPG") ;
  glass = loadImage("glass.jpg") ;
  desk = loadImage("overhead.jpg") ;
  logo = loadImage("Logo.png") ;
  textFont(myFont) ;
  background(75);
  imageMode(CENTER) ;
  
}


void draw () {
  
  
  
  myCounter = myCounter - 1 ;
  if(myCounter < 0) {
    myState = myState + 1 ;
    myCounter = 100 ;
  }
  if(myState > 4) {
    myState = 0 ;
  }
  
  
  
  switch(myState) {
    
    case 0:
        
          background(75) ;
         
          image(logo, width/2, height/2-100) ;
          println("We are in state 0") ;
          if(myCounter < 0) {
          myState = myState + 1 ;
          myCounter = 100 ;
          }
          if(myState > 4) {
          myState = 0 ;
          }
          
          tint(255, 126); 
          image(desk, width/2, height/2) ;
          
          textAlign(CENTER) ;
          textSize(48) ;
          text("Hey!", width/2, height/2-10) ;
          textSize(28) ;
          text("I'm Jason Haff", width/2, height/2+20) ;
          fill(255);
          textSize(24) ;
          text("", width/2, height/2+50) ;
          noTint();
          logo.resize(100, 100) ;
          
          
    break ;
    
    case 1:
        background(75) ;
        logo.resize(50, 50) ;
        println("We are in state 1") ;
        if(myCounter < 0) {
          myState = myState + 1 ;
          myCounter = 100 ;
          }
          if(myState > 4) {
          myState = 0 ;
          }
          
          tint(255, 126); 
          image(night,  width/2, height/2) ;
          textSize(18);
          fill(255);
          text("from", width/2-27, height/2-10) ;
          fill(168,208,108) ;
          text("Chicago", width/2+27, height/2-10) ;
          noTint() ;
         image(logo, 30, 370) ;
      
      
    break ;
    
    case 2:
        
        background(75) ;
        println("We are in state 2") ;
        if(myCounter < 0) {
          myState = myState + 1 ;
          myCounter = 100 ;
          }
          if(myState > 4) {
          myState = 0 ;
          }
           
          tint(255, 126); 
          image(fog,  width/2, height/2) ;
          textSize(18);
          fill(255);
          text("My skills include", width/2, height/-10) ;
          fill(168,208,108) ;
          text("Web | Print", width/2, height/2) ;
          noTint() ;
          image(logo, 30, 370) ; 
          
         

          
    break ;
    
    case 3:
        background(75) ;
        println("We are in state 3") ;
        if(myCounter < 0) {
          myState = myState + 1 ;
          myCounter = 100 ;
          }
          if(myState > 4) {
          myState = 0 ;
          }
          
          tint(255, 126); 
          image(glass,  width/2, height/2) ;
          fill(255) ;
          text("Photo | Video", width/2, height/2-10) ;
           noTint() ;
           image(logo, 30, 370) ;
           
    break ;
    
    case 4:
          background(0) ;
          println("We are in state 4") ;
          if(myCounter < 0) {
            myState = myState + 1 ;
            myCounter = 100 ;
            }
            if(myState > 4) {
            myState = 0 ;
            }
            
            
            tint(255, 126);
            fill(255) ;
            textSize(14);
            text("Jason", width/2-15, height/2-10) ;
            fill(168,208,108) ;
            text("Haff", width/2+20, height/2-10) ;
            fill(255) ;
            text(".com", width/2+50, height/2-10) ;
            noTint() ;
            image(logo, width/2-60, height/2-10) ;
    break ;
    
    
     }
  
}







