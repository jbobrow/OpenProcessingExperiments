
/* @pjs preload="flower0.jpg", "flower01.jpg", "flower02.jpg", "flower03.jpg", "flower04.jpg"; font="whiterabbit.ttf"; */
int myState = 0 ;
PFont rabb ;

void setup() {
  size(677, 673) ; 
 flower= loadImage ("flower0.jpg") ;
 flower1= loadImage ("flower01.jpg") ;
 flower2= loadImage ("flower02.jpg") ;
 flower3= loadImage ("flower03.jpg") ;  
 flower4= loadImage ("flower04.jpg") ;
 rabb= createFont("whiterabbit.ttf", 50);

}



void draw() {
  
  textAlign(CENTER, CENTER) ;
  
  switch(myState) {
    case 0:
    background(255, 0, 0) ; 
    image (flower, -200, -200);
     fill (#CE2EBC) ;
     textFont (rabb, 60) ;
    text ("Click the screen to see", 350, 40) ; 
    text ("the flower grow!", 300, 100) ; 
    break ;
    
    case 1:
    background(0, 255, 0) ; 
    image (flower1, -200, -200);
    break ;
    
    case 2:
    background(0, 0, 255) ;
    image (flower2, -150, -180);
    break ;
    
     case 3:
    background(10, 250, 0) ; 
    image (flower3, -150, -200);
    break ;
    
    case 4:
    background(10, 0, 255) ;
    image (flower4, -150, -150);
    break ;
    
  }
  
}

void mousePressed() {
  myState = myState + 1 ;
  if (myState > 4) {
    myState = 0 ;
  }
}


