
//////////////////////////////////
//// Project Two, DSDN 142    ////
//// George Bristow 300239542 ////
//////////////////////////////////
List<Spring> springs = new ArrayList<Spring>();
Spring held = null;

void setup(){
  size(500,500);
  smooth();
  
  
 springs.add(new Spring(width / 2 , height /2));
    
  
}

void draw(){
  background(255);
  
  for (Spring spring : springs) {
    if (spring == held) {
      spring.moveTo(mouseX, mouseY).draw();
    } else {
      spring.move().draw();
    }
  }
}
  
void mousePressed(){
  // mouse pressed on a ball will let u drag it in any direction
  for (Spring spring : springs) {
    if (spring.mouseOver()) {
      held = spring;
      break;
    }
  }
}
  
void mouseReleased(){
  // will release the ball in the opersite direction that u have dragged it
  if (held != null) {
    held.release();
    held = null;
  }
}

