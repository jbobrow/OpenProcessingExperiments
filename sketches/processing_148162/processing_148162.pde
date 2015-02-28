
void setup(){
  size(400,400, P2D);
  background(0,206,209);
}

void draw(){
  translate(-95,-53);
  fill(139,69,19);
  arc(150, 150, 80, 80, 0, 180);
  line(150, 80, 150, 150);
  line(110, 150, 190, 150);
  fill(139, 0, 0);
  triangle(150, 120, 150, 60, 200, 120);
  
  text("GB", 120, 166);
  text("GB", 156, 177);
  text("GB", 169, 162);
  text("GB", 142, 163);
  text("GB", 129, 180);
  
  fill(47,79,79);
  textSize(32);
  text("?", 199, 167);
  text("?", 221, 197);
  text("?", 185, 197);
  translate(91, 59);
  
  fill(255);
  rect(44, 249, 75, 50);
  rect(263, 292, 75, 50);
  rect(270, 85, 75, 50);
   
  noStroke();
  fill(32, 32, 120);
  rect(286, 85, 12, 50);
  rect(270, 104, 75, 12);
   
  fill(255, 0, 0);
  ellipse(83, 275, 30, 30);
   
  fill(237, 116, 9);
  rect(264, 293, 74, 16);
  
  fill(59, 122, 34);
  rect(264, 326, 74, 16);
  
  fill(0, 0, 255);
  ellipse(303, 318, 13, 13);
  
  fill(255);
  ellipse(303, 318, 10, 10);
  
  fill(0);
  
  textSize(50);
  
  text("@", 231, 280);
  text("http://", 220, 176);
  text("☣", 121, 280);
}

void mousePressed(){
    filter(INVERT); 

