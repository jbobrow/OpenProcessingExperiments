
int middle;
 int frogHead;
 int frogEye;
 int frogPupil;
 int frogTongue;
 int frogCheek;
 
 String jargon="Please feed the frog! He's very hungry.";

void setup() {
  
  size(480, 480);
  smooth();
  
  middle = 240;
  frogHead = 180;
  frogEye = 65;
  frogPupil = 150;
  frogTongue = 80;
  frogCheek = 55;
  
}

void draw() {
  
  noStroke();
  
  /* frog head */
  fill(120, 198, 27);
  ellipse(middle, middle, frogHead, frogHead);
  
  /* frog eyes */
  fill(237, 252, 219);
  ellipse(188, 160, frogEye, frogEye);
  ellipse(285, 160, frogEye, frogEye);
  
  /* cheeks */
  fill(158, 203, 19);
  ellipse(180, 220, frogCheek, frogCheek);
  ellipse(300, 220, 55, 55);
  
  /* pupils */
  fill(28, 80, 17);
  rect(182, frogPupil, 10, 15);
  rect(282, frogPupil, 10, 15);
  
  /* mouth */
  fill(28, 80, 17);
  ellipse(middle, 260, 160, 120);
  
  /* tongue */
  fill(192, 115, 77);
  ellipse(middle, 235, frogTongue, frogTongue);
  
  /* chin */
  fill(120, 198, 27);
  ellipse(middle, 270, 160, 100);
  
  fill(120, 190, 39);
  ellipse(middle, 283, 100, 80);
  
  /* nose */
  fill(102, 169, 24);
  ellipse(234, 180, 5, 8);
  ellipse(242, 180, 5, 8);

  /* flies */ //when mouse moves it creates flies!
  fill(51, 35, 21);
  ellipse(mouseX, mouseY, 10, 10); // fly body
  fill(255, 255, 255);
  ellipse(mouseX-8, mouseY+1, 8, 3); // fly wing 1
  ellipse(mouseX+8, mouseY+1, 8, 3); // fly wing 2

}

  /* grasshopper */ //when mouse is clicked it creates grasshoppers!
  void mousePressed() {
  fill(158, 210, 32);
  rect(mouseX, mouseY, 45, 15);
  fill(51, 35, 21);
  ellipse(mouseX+28, mouseY-1, 7, 7);
  ellipse(mouseX+36, mouseY-1, 7, 7);
  fill(222, 255, 144);
  rect(mouseX+15, mouseY-5, 8, 14);
}

/* PSA */ //when any key is pressed, a println will appear.
void keyPressed(){
  println(jargon);
}
