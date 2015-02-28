
//Problem Set #1 - 01
void setup(){
  size(250,250);
  smooth();
}
void draw() {
  background(255,255,234);
  fill(255,201,215,130);
  ellipse(125,135,105,105);
  
  fill(201,237,255,90);
  ellipse(180, 190, 65, 65);
  
  fill(201,255,220,100);
  ellipse(200,130,55,55);
  
  fill(255,207,178,100);
  ellipse(225,225,40,40);
  
  fill(233,203,255,100);
  ellipse(170,220,30,30);
  
}

void keyPressed() {
  saveFrame("PS1_01image.jpeg");
}

