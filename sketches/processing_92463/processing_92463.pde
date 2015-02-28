
int myState = 0 ;
PImage title;
PImage notes1;
PImage notes2;
PImage notes3;
PImage notes4;
PImage notes5;


void setup() {
  
  size(700, 290) ; 
  background(0) ;
  
  title = loadImage("title.jpg") ;
  notes1 = loadImage("notes1.jpg") ;
  notes2 = loadImage("notes2.jpg") ;
  notes3 = loadImage("notes3.jpg") ;
  notes4 = loadImage("notes4.jpg") ;
  notes5 = loadImage("notes5.jpg") ;
    
}


void draw() {
  

  
  switch(myState) {
    
    case 0:
    println("Case 0") ;
    image(title, 0, 0) ;
    break ;
    
    case 1:
    println("Case 1") ;
    image(notes1, 0, 0) ;
    break ;
    
    case 2:
    println("Case 2") ;
    image(notes2, 0, 0) ;
    break ;
    
    case 3:
    println("Case 3") ;
    image(notes3, 0, 0) ;
    break ;
    
    case 4:
    println("Case 4") ;
    image(notes4, 0, 0) ;
    break ;
    
    case 5:
    println("Case 5") ;
    image(notes5, 0, 0) ;
    break ;

    
  }
  
}

void mousePressed() {
  myState = myState + 1 ;
  if (myState > 5) {
    myState = 0 ;
  }
  


  
}


