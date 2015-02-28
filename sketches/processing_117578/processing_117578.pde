
int myState = 0 ;
color myRandom ; 

void setup() {
  size(500, 500) ; 
 
 myRandom = color(random(255), random(255), random(255)) ; 
  
}


void draw() {
  
  switch(myState){
    case 0:
    background(0);
    
    text("clickto the top", 50, 50);
    
    fill(myRandom) ;
    rect(230, 450, 40, 60);
    break;
    
    case 1:
    background(0);
    
    fill(myRandom) ;
    rect(230, 450, 40, 60);
    
    fill(myRandom) ;
    rect(230, 390, 40, 60);
    break;
    
    case 2:
    background(0);
    
    fill(myRandom) ;
    rect(230, 450, 40, 60);
    
    fill(myRandom) ;
    rect(230, 390, 40, 60);
    
    fill(myRandom) ;
    rect(230, 330, 40, 60);
    
    break;
    
    case 3:
    background(0);
    
    fill(myRandom) ;
    rect(230, 450, 40, 60);
    
    fill(myRandom) ;
    rect(230, 390, 40, 60);
    
    fill(myRandom) ;
    rect(230, 330, 40, 60);
    
    fill(myRandom) ;
    rect(230, 270, 40, 60);    
    break;
    
    case 4:
    background(0);
    
    fill(myRandom) ;
    rect(230, 450, 40, 60);
    
    fill(myRandom) ;
    rect(230, 390, 40, 60);
    
    fill(myRandom) ;
    rect(230, 330, 40, 60);
    
    fill(myRandom) ;
    rect(230, 270, 40, 60);    
   
   fill(myRandom);
   rect(230, 210, 40, 60);
   
    break;
    
    case 5:
    background(0);
    
    fill(myRandom) ;
    rect(230, 450, 40, 60);
    
    fill(myRandom) ;
    rect(230, 390, 40, 60);
    
    fill(myRandom) ;
    rect(230, 330, 40, 60);
    
    fill(myRandom) ;
    rect(230, 270, 40, 60);    
   
   fill(myRandom);
   rect(230, 210, 40, 60);
   
   fill(myRandom);
   rect(230, 150, 40, 60);
   
    break;
    
    case 6:
    background(0);
    
    fill(myRandom) ;
    rect(230, 450, 40, 60);
    
    fill(myRandom) ;
    rect(230, 390, 40, 60);
    
    fill(myRandom) ;
    rect(230, 330, 40, 60);
    
    fill(myRandom) ;
    rect(230, 270, 40, 60);    
   
   fill(myRandom);
   rect(230, 210, 40, 60);
   
   fill(myRandom);
   rect(230, 150, 40, 60);
   
   fill(myRandom);
   rect(230, 90, 40, 60);
   
    break;
    
    case 7:
    background(0);
    
    fill(myRandom) ;
    rect(230, 450, 40, 60);
    
    fill(myRandom) ;
    rect(230, 390, 40, 60);
    
    fill(myRandom) ;
    rect(230, 330, 40, 60);
    
    fill(myRandom) ;
    rect(230, 270, 40, 60);    
   
   fill(myRandom);
   rect(230, 210, 40, 60);
   
   fill(myRandom);
   rect(230, 150, 40, 60);
   
   fill(myRandom);
   rect(230, 90, 40, 60);
   
   fill(myRandom);
   rect(230, 30, 40, 60);
   
    break;
    
    case 8:
    background(0);
    
    text("DDDOOOONNNEEE!!!", 50, 50);  
    fill(myRandom) ;
    rect(230, 450, 40, 60);
    
    fill(myRandom) ;
    rect(230, 390, 40, 60);
    
    fill(myRandom) ;
    rect(230, 330, 40, 60);
    
    fill(myRandom) ;
    rect(230, 270, 40, 60);    
   
   fill(myRandom);
   rect(230, 210, 40, 60);
   
   fill(myRandom);
   rect(230, 150, 40, 60);
   
   fill(myRandom);
   rect(230, 90, 40, 60);
   
   fill(myRandom);
   rect(230, 30, 40, 60);
   
   fill(myRandom);
   rect(230, -30, 40, 60);
   
    break;
    
  }
}  

void mousePressed() {
   myRandom = color(random(255), random(255), random(255)) ; 
  
  myState = myState + 1 ;
  if (myState > 8) {
    myState = 0 ;
  }
}


