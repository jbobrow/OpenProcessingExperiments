
void setup () {
  size(640, 480);
  background(200);
}

void draw () {
  //dark wood grain
  fill(207, 168, 103);
  //dark background
  rect(175, 100, 250, 290);
  
  //vertical join lines
  line(185, 100, 185, 390);
  line(415, 100, 415, 390);
  stroke(20);
  
  //lighter wood grain
  fill(227, 188, 123);
  //top of dresser
  rect(165, 90, 270, 10);
  
   //light wood grain
  fill(222, 183, 118);
  //dresser drawers
  rect(180, 110, 240, 60);
  rect(180, 180, 240, 60);
  rect(180, 250, 240, 60);
  rect(180, 320, 240, 60);
  
  line(300, 70, 290, 90);
  line(300, 70, 310, 90);
  fill(255,215,0);
  ellipse(300,65, 40, 40);
  fill(255,255,255);
  ellipse(300.5, 65, 35, 35);
  
  
  line(300, 65, 300, 75);
  line(300, 65, 310, 60);
  
  //clock bells
  fill(255,215,0);
  ellipse(290, 47, 20, 13);
  ellipse(310, 47, 20, 13);
  
}



