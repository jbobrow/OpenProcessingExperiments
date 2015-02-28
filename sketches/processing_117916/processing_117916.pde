
/* @pjs preload ="Logo.png" ; */
/* @pjs font = "data/Roboto-Thin.ttg" ; */
int myState = 0 ;
int x = 150 ;
PImage logo ;
PFont myFont ;


void setup() {
  myFont = createFont("Roboto-Thin", 14) ;
  size(400, 200) ;
  smooth () ;
  logo = loadImage("Logo.png") ;
  textFont(myFont) ;
  
  background(75);
  
}


void draw () {
  
  switch(myState) {
    
    case 0:
        
        background(75) ;
          println("We are in state 0") ;
         
    break ;
    
    case 1:
        background(75) ;
        println("We are in state 1") ;
       
          logo.resize(100, 100) ;
          image(logo, 150, 50) ;
    
    break ;
    
    case 2:
        
        background(75) ;
        println("We are in state 2") ;
        
          image(logo, 50, 50) ;
          fill(255) ;
          stroke(255) ;
          line(width/2-40, 65, width/2-40, 115);
          text("Jason Haff", width/2-20, height/2-5) ;
          
         

          
    break ;
    
    case 3:
        background(75) ;
        println("We are in state 3") ;
        
          image(logo, 50, 50) ;
          fill(255) ;
          stroke(255) ;
          line(width/2-40, 65, width/2-40, 115);
          text("Web + Print + 3D", width/2-20, height/2-5) ;
          
    break ;
    
    case 4:
          background(75) ;
          println("We are in state 4") ;
         
            image(logo, 50, 50) ;
            fill(255) ;
            stroke(255) ;
            line(width/2-40, 65, width/2-40, 115);
            text("Coding + Photo + Video", width/2-20, height/2-5) ;
    break ;
    
     case 5:
          background(75) ;
          println("We are in state 5") ;
          
            image(logo, 50, 50) ;
            fill(255) ;
            stroke(255) ;
            line(width/2-40, 65, width/2-40, 115);
            text("Jason", width/2-20, height/2-5) ;
            fill(168,208,108) ;
            text("Haff", width/2+20, height/2-5) ;
            fill(255) ;
            text(".com", width/2+50, height/2-5) ;
           
    break ;
     }
  
}

void mousePressed()  {
  myState = myState + 1;
  if (myState > 5) 
    myState = 0 ;
  }






