
int x=0; // a counter
int up=1; // arm up or down

void setup() {
  size(100,100);
}

void draw(){
  // erase last frame
  background(255,142,159);
    
  // draw stick person
  ellipse(50,20,20,20);
  rectMode(CENTER);
  rect(50,40,20,20);
  line(55,50,60,70);
  line(45,50,40,70);
  line(40,40,30,50);
  
  // counter moves ahead  
  x=x+1;
  
  if (x==20) {
    // reset counter
    x=0;
    // change direction of arm
    up=up*-1;
  }
  if (up==1) {
    // arm up
    line(60,40,70,30);
  } else {
    // arm down
    line(60,40,70,50);
  }
   
}
