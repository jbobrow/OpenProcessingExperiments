
int myState = 0;
PImage boy;
int counter = 0;

void setup() {
  size(500, 500);
  frameRate(24);
  boy = loadImage("Sketchbook.png");
}

void draw() {
  background(100);
  
  counter = counter + 1;
  if (counter > 6*5) {
    
    // changing states!!!
    
    myState = myState + 1;
    if (myState > 4) {
      myState = 0;
    }
    counter = 0;
  }
  
  
  switch(myState) {
    
    case 0:
    fill(#FF0303);
    rect(0, 0, 500, 500);
    image(boy, 225, 150);
    break ;
    
    case 1:
    fill(#032AFF);
    rect(0, 0, 500, 500);
    image(boy, 225, 150);
    break ;
    
    case 2:
    fill(#03FF47);
    rect(0, 0, 500, 500);
    image(boy, 225, 150);
    break ;
    
    case 3:
    fill(#F6FF03);
    rect(0, 0, 500, 500);
    image(boy, 225, 150);
    break ;
    
    case 4:
    fill(#F6FF03);
    rect(0, 0, 500, 500);
    image(boy, 225, 150);
    
    break ;
    
  }
  
  
 
}


