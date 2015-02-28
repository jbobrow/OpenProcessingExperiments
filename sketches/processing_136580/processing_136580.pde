
int myState = 0 ;


void setup() {
  size(310, 300) ;
}

void draw() {
  background(0, 0, 0) ;
  switch(myState) {
  case 0:
  //The State is 0
  text("Press any key to watch the moon set.", 10, 10) ;
  fill(255, 255, 255) ;
  break ;
  
  case 1:
  //State is 1
  ellipse(300, 300, 100, 100) ;
  break ;
  
  case 2:
  //State 2
  ellipse(290, 290, 100, 100) ;
  break ;
  
  case 3:
 
  ellipse(280, 280, 100, 100) ;
  break ;
  
  case 4:
 
  ellipse(270, 270, 100, 100) ;
  break ;
  
  case 5:
 
  ellipse(260, 260, 100, 100) ;
  break ;
  
  case 6:
 
  ellipse(250, 250, 100, 100) ;
  break ;
  
  case 7:
 
  ellipse(250, 240, 100, 100) ;
  break ;
  
   case 8:
 
  ellipse(250, 230, 100, 100) ;
  break ;
  
   case 9:
 
  ellipse(250, 220, 100, 100) ;
  break ;
  
   case 10:
 
  ellipse(250, 210, 100, 100) ;
  break ;
  
   case 11:
 
  ellipse(250, 200, 100, 100) ;
  break ;
  
   case 12:
 
  ellipse(250, 190, 100, 100) ;
  break ;
  
  case 13:
 
  ellipse(250, 180, 100, 100) ;
  break ;
  
  case 14:
 
  ellipse(250, 170, 100, 100) ;
  break ;
  
  case 15:
 
  ellipse(250, 160, 100, 100) ;
  break ;
  
  case 16:
 
  ellipse(250, 150, 100, 100) ;
  break ;
  
  case 17:
 
  ellipse(250, 140, 100, 100) ;
  break ;
  
  case 18:
 
  ellipse(250, 130, 100, 100) ;
  break ;
  
  case 19:
 
  ellipse(250, 120, 100, 100) ;
  break ;
  
  case 20:
 
  ellipse(250, 110, 100, 100) ;
  break ;
  
  case 21:
 
  ellipse(250, 100, 100, 100) ;
  break ;
  
  case 22:
 
  ellipse(250, 90, 100, 100) ;
  break ;
  
  case 23:
 
  ellipse(250, 80, 100, 100) ;
  break ;
  
  case 24:
 
  ellipse(250, 70, 100, 100) ;
  break ;
  
  case 25:
 
  ellipse(250, 60, 100, 100) ;
  break ;
  
  case 26:
 text("Goode Morning Everyone!", 50, 10) ;
  ellipse(250, 60, 100, 100) ;
  break ;
  }
}

void keyPressed() {
  myState = myState - 1 ;
  if (myState < 0) {
    myState = 25 ;
}
}


