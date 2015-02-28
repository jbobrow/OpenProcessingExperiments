



Walker walker1;


void setup() {
  size(1366, 768);
  background (0);
  walker1 = new Walker();
  
}

void draw() {
  println(millis()/1000); //see how long it takes to fill screen! prints time in seconds;;
  walker1.step();
  walker1.display();
  
}

// QUESTIONS: How to stop loop when screen gets full??

class Walker {
  float x;
  float y;
  float change =10;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void display() {
    ellipse (x, y, change, change);
  }

  void step() {

    float r = random(1);
    if (r < 0.25) { //change value to change probability (dont forget to change others)
//      fill(random(255), random (255), random(255)); //RGB - Random:)
      fill(255, 0, 0); //RGB - R color
      x+=change;
    } 
    else if (r < 0.5) {
//      fill (random(255),random( 255),random (255)); //RGB - Random:)
      fill (0, 255, 0); //RGB - G color
      x-=change;
    } 
    else if (r < 0.75) {
//      fill (random(255), random (255), random (255)); //RGB - Random:)
      fill (0, 0, 255); //RGB - R color
      y+=change;
    } 
    else {
      fill (255);
      y-=change;
    }
    if (x>width) {  //boundary
      x-=change; 
    }
    if (x<0) {      //boundary
      x+=change;
    }
    if (y>height) { //boundary
      y-=change;
    }
    if (y<0) {      //boundary
      y+=change;
    }
  }
}



