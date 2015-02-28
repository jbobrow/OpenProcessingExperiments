
/* @pjs preload="pumpkin0.png,pumpkin1.png,pumpkin2.png,pumpkin3.png,pumpkin4.png,pumpkin5.png,pumpkin6.png,pumpkin7.png,pumpkin8.png,"pumpkin9.png"; */ 

PImage photo0;
PImage photo1;
PImage photo2;
PImage photo3;
PImage photo4;
PImage photo5;
PImage photo6;
PImage photo7;
PImage photo8;
PImage photo9;

int myKey = 0 ;

void setup() {
  size(1000, 800) ; 
  
  //noCursor() ;
  
  photo0 = loadImage("pumpkin0.png");
  photo1 = loadImage("pumpkin1.png");
  photo2 = loadImage("pumpkin2.png");
  photo3 = loadImage("pumpkin3.png");
  photo4 = loadImage("pumpkin4.png"); 
  photo5 = loadImage("pumpkin5.png");
  photo6 = loadImage("pumpkin6.png");
  photo7 = loadImage("pumpkin7.png");
  photo8 = loadImage("pumpkin8.png");
  photo9 = loadImage("pumpkin9.png");
  
}


void draw() {
   
  switch(myKey) {
    case 0:
    image(photo0, 0, 0) ; 
    break ;
    
    case 49:
    background(photo1) ; 
    break ;
    
    case 50:
    background(photo2) ;
    break ;
    
    case 51:
    background(photo3) ;
    break ;
   
    case 52:
    background(photo4) ;
    break ;
    
    case 53:
    background(photo5) ;
    break ;
    
    case 54:
    background(photo6) ;
    break ;
    
    case 55:
    background(photo7) ;
    break ;
    
    case 56:
    background(photo8) ;
    break ;
    
    case 57:
    background(photo9) ;
    break ;
  }
  
  
}

void keyPressed() {
//    println(keyCode);
  myKey = keyCode ; 

  switch(myKey) {
    case 48:
    background(photo0);
    //println("you pressed 0") ;
    break ;
    
    case 49:
    background(photo1);
    //println("you pressed 1") ;
    break ;
    
    case 50:
    background(photo2);
    //println("you pressed 2") ;
    break ;
    
    case 51:
    background(photo3);
    //println("you pressed 3") ;
    break ;
    
    case 52:
    background(photo4);
    //println("you pressed 4") ;
    break ;
    
    case 53:
    background(photo5);
    //println("you pressed 5") ;
    break ;
    
    case 54:
    background(photo6);
    //println("you pressed 6") ;
    break ;
    
    case 55:
    background(photo7);
    //println("you pressed 7") ;
    break ;
    
    case 56:
    background(photo8);
    //println("you pressed 8") ;
    break ;
    
    case 57:
    background(photo9);
    //println("you pressed 9") ;
    break ;
    
  }
}


