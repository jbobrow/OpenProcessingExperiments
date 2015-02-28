
int x=0; // a counter
int up=1; // arm up or down
 
void setup() {
  size(300,300);
}
 
void draw(){
  // erase last frame
  background(255,342,159);
     
  // draw stick person
  ellipse(100,100,50,50);
  rectMode(CENTER);
  rect(100,150,50,50);
  line(75,135,50,175);
  line(85,175,70,195);
  line(115,175,120,195);
   
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
    line(60,85,70,30);
  } else {
    // arm down
    line(100,85,70,50);
  }
    
}
