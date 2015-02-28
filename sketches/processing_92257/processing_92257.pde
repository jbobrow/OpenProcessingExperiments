

int myState = 0 ;
color myRandomC ; 

void setup() {
  size(500, 500) ; 
 
}

void draw() {
  
  textAlign(CENTER, CENTER) ;
  
  switch(myState) {
    case 0:
    background(030, 240, 054) ; 
    text("Zachary Thomas Simmons", width/2, height/2) ; 
    break ;
    
    case 1:
    background(000, 190, 071) ; 
    text("Laura Sue Homan", width/2, height/2) ;
    break ;
    
    case 2:
    background(030, 240, 054) ;
    text("ALfred Christopher Homan", width/2, height/2) ;
    break ;
    
    case 3:
    background(050, 031, 037) ;
    text("Joyce Carleen Simmons", width/2, height/2) ;
    break ;
    
    case 4:
    background(070, 160, 032) ;
    text("Raymond Larry Simmons", width/2, height/2) ;
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


