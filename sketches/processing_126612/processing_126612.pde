
void setup() {
  size(250, 250);
  noSmooth();
  background(231,183,232);
  textAlign(CENTER);
  textSize (20);
}
 
void draw() {
  background(231,183,232);
 
  fill (242,228,179);
  rect(101, 90, 46, 62);
  ellipse(124,67,65,60);
  //occhi
  fill(0);
  ellipse(103, 70, 7,7);
  ellipse(145, 70, 7,7);
  //gambe
  line(147, 140, 147, 200);
  line(101, 140, 101, 200);
  
  //braccia
  if(mousePressed) {
     line(147,105,134,60);
     line(101,105,90,60);
  } 
  else {
    line(147,105,180,60);
    line(101,105,134,60);
  }
    
  fill(0);
  text ("Click to dance :)",125,225);
}



