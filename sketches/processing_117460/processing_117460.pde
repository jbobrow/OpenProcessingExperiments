
int myState = 0;
int myCounter = 60;
PImage rocketship;
PImage rocketship2;

void setup() { 
  size(500,500);
      rocketship = loadImage("rocketship.png");
      rocketship2 = loadImage("rocketship2.png");
  
 }


void draw() {
  
  image(rocketship, 0, 0, 500, 500);
  
  textSize(95);
  
  myCounter = myCounter - 1;
  if (myCounter < 0) {
    myState = myState + 1;
    myCounter = 60;
  }
  
  if (myState > 5) {
    myState = 0;
  }
  
  
  switch(myState) {
    
    case 0:
    text("5", 350, 200);
    break;
    
    case 1: 
    text("4", 350, 200);
    break;
    
    case 2:
     text("3", 350, 200);
     break;
    
    case 3:
    text("2", 350, 200);
    break;
    
    case 4: 
    text("1", 350, 200);
    break;
    
    case 5: 
    image(rocketship2, 0, 0, 500, 500);
    textSize(40);
    text("Blast Off!", 300, 200);
    break;
    
    
  }
}






