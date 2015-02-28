
void setup() {
  
  size(408,500);
  background(250,243,235);
  
}

void draw() {
  
  noStroke();
  
  //red rectangle
  beginShape();
  fill(160,40,30);
  vertex(0,0);
  vertex(85,0);
  vertex(85,160);
  vertex(0,160);
  endShape();
  
  //yellow rectangle
  beginShape();
  fill(250,200,10);
  vertex(395,0);
  vertex(408,0);
  vertex(408,160);
  vertex(395,160);
  endShape();
  
  //blue rectangle
  beginShape();
  fill(0,90,155);
  vertex(306,455);
  vertex(306,500);
  vertex(408,500);
  vertex(408,455);
  endShape();
  
  fill(20);
  
  //vertical lines
  beginShape();
  vertex(29,0);
  vertex(39,0);
  vertex(39,160);
  vertex(29,160);
  endShape();
  
  beginShape();
  vertex(84,0);
  vertex(95,0);
  vertex(95,500);
  vertex(84,500);
  endShape();
  
  beginShape();
  vertex(295,0);
  vertex(306,0);
  vertex(306,500);
  vertex(295,500);
  endShape();
  
  beginShape();
  vertex(385,0);
  vertex(395,0);
  vertex(395,500);
  vertex(385,500);
  endShape();
  
  //horizontal lines
  beginShape();
  vertex(0,77);
  vertex(0,90);
  vertex(408,90);
  vertex(408,77);
  endShape();
  
  beginShape();
  vertex(0,160);
  vertex(0,172);
  vertex(408,172);
  vertex(408,160);
  endShape();
  
  beginShape();
  vertex(85,455);
  vertex(85,465);
  vertex(408,465);
  vertex(408,455);
  endShape();
  
}

