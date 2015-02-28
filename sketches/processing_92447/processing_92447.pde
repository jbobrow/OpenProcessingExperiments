
int myState = 0 ;
PImage door;
PImage blob;
PImage blob2;
PImage blob3;
PImage blob4;


void setup() {
  
  size(500, 500) ; 
  background(0) ;
  
  door = loadImage("blobbysdoor.jpg") ;
  blob = loadImage("blobby01.jpg") ;
  blob2 = loadImage("blobby02.jpg") ;
  blob3 = loadImage("blobby03.jpg") ;
  blob4 = loadImage("blobby04.jpg") ;
    
}


void draw() {
  

  
  switch(myState) {
    
    case 0:
    println("Case 0") ;
    image(door, 0, 0) ;
    break ;
    
    case 1:
    println("Case 1") ;
    image(blob, 0, 0) ;
    break ;
    
    case 2:
    println("Case 2") ;
    image(blob2, 0, 0) ;
    break ;
    
    case 3:
    println("Case 3") ;
    image(blob3, 0, 0) ;
    break ;
    
    case 4:
    println("Case 4") ;
    image(blob4, 0, 0) ;
    break ;

    
  }
  
}

void mousePressed() {
  myState = myState + 1 ;
  if (myState > 4) {
    myState = 0 ;
  }
  


  
}


