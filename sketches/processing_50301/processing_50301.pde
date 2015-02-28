
// Teresa Yang
// January 26, week 2
// homework#1 - Recreation of Robert Indiana's EAT/DIE logo


PFont myFont;

void setup() {
  size(1150, 600);
  background(173, 173, 173);
  smooth();

  noStroke();
  fill (130, 130, 130);
  beginShape();
  vertex(300, 55);
  vertex(550, 305);
  vertex(300, 555);
  vertex(50, 305);
  endShape(CLOSE);


  noStroke();
  fill (47, 83, 39);
  beginShape();
  vertex(300, 50);
  vertex(550, 300);
  vertex(300, 550);
  vertex(50, 300);
  endShape(CLOSE);


  noStroke();
  fill (153, 0, 2);
  ellipse(300, 300, 345, 345);


  myFont = createFont("Futura", 165);
  textFont(myFont);
  fill(72, 54, 31);
  text("EAT", 150, 362);
  fill(47, 83, 39);
  text("EAT", 150, 360);
  
  
  
 
  noStroke();
  fill (130, 130, 130);
  beginShape();
  vertex(850, 55);
  vertex(1100, 305);
  vertex(850, 555);
  vertex(600, 305);
  endShape(CLOSE);


  noStroke();
  fill (171, 0, 0);
  beginShape();
  vertex(850, 50);
  vertex(1100, 300);
  vertex(850, 550);
  vertex(600, 300);
  endShape(CLOSE);


  noStroke();
  fill (32, 26, 35);
  ellipse(850, 300, 345, 345);


  myFont = createFont("Futura", 165);
  textFont(myFont);
  fill(94, 67, 30);
  text("DIE", 713, 362);
  fill(183, 136, 34);
  text("DIE", 713, 360);
}


