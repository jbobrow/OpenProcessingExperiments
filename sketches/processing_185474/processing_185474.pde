
void setup(){
  size(640, 360);
  background(0,0,0);
}

void draw(){
  strokeWeight(7);
  
  fill(254,216,13);
  rect(0,0, 10,360);
  
  fill(76, 16, 145);
  rect(14, 0, 40, 360);
  
  fill(254,104,1);
  rect(248, 0, 70, 360);
  
  fill(122,28,148);
  rect(322, 0, 50, 360);
  
  fill(229,60,24);
  rect(376, 0, 90, 360);
  
  fill(36, 87, 177);
  rect(510, 0, 40, 360);
  
  fill(157,15,6);
  rect(554, 0, 60, 360);
  
  fill(88,154,240);
  rect(620, 0, 20, 360);
  
  strokeWeight(2);
  fill(222, 21, 0, 100);
  ellipse(mouseX, mouseY, 30,30);
}

void mousePressed(){
  background(0,0,0);
}

void keyPressed(){
  background(91,1,9);
}
  
  


