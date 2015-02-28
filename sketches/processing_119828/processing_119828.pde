
/* @pjs preload = "stop.png, slow.png, go.png" */

int step = 0 ;

void setup() {
  
  size(243, 400) ;
  
  
}

void draw (){
  
  switch(step) {
    case 0:
    PImage go = loadImage("go.png") ;
    image (go, 0, 0) ;
    break ;
    
    case 1:
    PImage slow = loadImage ("slow.png") ;
    image (slow, 0, 0) ;
    break ;
    
    case 2:
    PImage stop = loadImage ("stop.png") ;
    image (stop, 0, 0) ;
    break ;
  }
  
}

void keyPressed() {
  step = step + 1 ;
  if (step > 2) {
    step = 0 ;
  }
}

void mousePressed () {
  step = step + 1 ;
  if (step > 2) {
    step = 0 ;
  }
}


