

int myState = 0, myCounter = 200;
 
void setup() {
  size (600, 500);
   
}
 
 
void draw() {
 
  myCounter = myCounter -1;
   
  background(0);
  textSize(32);
   
  switch(myState) {
     
    case 0:
    background(255, 0, 0);
    text("pasta", 250, height/2) ; 
    if(myCounter < 0) {
      myCounter = 60*3;
      myState = 1;
    }   
    break;
     
    case 1:
    background(0, 255, 0);
     text("alien blood", 225, height/2) ; 
        if(myCounter < 0) {
      myCounter = 60*3;
      myState = 2;
    }  
    break;
     
    case 2:
    background(0, 0, 255);
     text("oceån abyss", 225, height/2) ; 
        if(myCounter < 0) {
      myCounter = 60*3;
      myState = 3;
    }  
    break;
     
    case 3:
    background(155, 0, 155);
     text("purple people eater", 150, height/2) ; 
        if(myCounter < 0) {
      myCounter = 60*3;
      myState = 4;
    }  
    break;
     
    case 4:
    background(0, 155, 155);
     text("dolphins in a tiffany store", 100, height/2) ; 
        if(myCounter < 0) {
      myCounter = 60*3;
      myState = 0;
    }  
    break;


  }
}



