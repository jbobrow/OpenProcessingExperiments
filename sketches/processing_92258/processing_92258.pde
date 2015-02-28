

int myState = 0 ;
color myRandomC ; 

void setup() {
  size(500, 500) ; 
 
 myRandomC = color(random(255), random(255), random(255)) ; 
  
}

void draw() {
  
  textAlign(CENTER, CENTER) ;
  
  switch(myState) {
    case 0:
    background(0, 0, 200) ; 
    text("And the days are not full enough", width/2, height/2) ; 
    break ;
    
    case 1:
    background(myRandomC) ; 
    text("And the nights are not full enough", width/2, height/2) ;
    break ;
    
    case 2:
    background(myRandomC) ;
    text("And life slips by", width/2, height/2) ;
    break ;
    
    case 3:
    background(myRandomC) ;
    text("Like a field mouse", width/2, height/2) ;
    break ;
    
    case 4:
    background(myRandomC) ;
    text("Not shaking the grass.", width/2, height/2) ;
    break ;
    
  }
  
}

void mousePressed() {
   myRandomC = color(random(255), random(255), random(255)) ; 
  
  myState = myState + 1 ;
  if (myState > 4) {
    myState = 0 ;
  }
}


