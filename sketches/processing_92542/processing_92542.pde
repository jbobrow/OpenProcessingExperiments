
int myState = 0 ;
//PFont ProBold ;
PImage gen1 ;
PImage cyb1 ;
PImage cyb2 ;
PImage cyb3 ;
PImage cyb4 ;
 
 
 
void setup() {
  size (540, 720) ;
  //ProBold = loadFont("AGaramondPro-Bold-66.vlw") ;
 gen1 = loadImage("gen1.jpg") ;
  cyb1 = loadImage("cyb1.png") ;
   cyb2 = loadImage("cyb2.png") ;
   cyb3 = loadImage("cyb3.png") ;
   cyb4 = loadImage("cyb4.png") ;
 
}
 
 
void draw() {
  
   
  if ((mouseX < 100) && (mouseX > 400) && (mouseY > 100) && (mouseY < 400)){
    noStroke() ;
   
     cursor(HAND);
  }
 
  else{
    noStroke() ;
   
      fill(0, 0, 0) ;
      cursor(HAND);
  }
 
    switch(myState) {
        
      case 0:
     image(gen1, 0, 0, 540, 720) ;
   break ;
   
      case 1:
     image(cyb1, 0, 0, 540, 720) ;
      break ;
    
     case 2:
     image(cyb2, 0, 0, 540, 720) ;
      break ;
      
       case 3:
     image(cyb3, 0, 0, 540, 720) ;
      break ;
      
       case 4:
     image(cyb4, 0, 0, 540, 720) ;
      break ;
    
  }   
}
 
void mousePressed() {
  myState = myState + 1 ;
  if (myState > 4) {
    myState = 0 ;
  } 
} 



