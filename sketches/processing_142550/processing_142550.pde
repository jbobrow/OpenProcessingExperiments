
void setup(){
  
  
  size(500,500);
  background(0,0,0);
  
}

void draw(){
  pushMatrix();
  background(0,0,0);
  noStroke();
  fill(255);
  float ecke = map(mouseY, 0, 500, 50, 0);
  float naehe = map(mouseX, 0, 500, 0, -90);
  translate(naehe, 0);
  rect(110,110,80,80, ecke);
  rect(110,210,80,80, ecke);  
  rect(110,310,80,80, ecke);
  popMatrix();
  resetMatrix();
  
  noStroke();
  fill(255);
  
  rect(210, 110, 80,80);
  rect(310, 110, 80,80);
  rect(210, 210, 80,80);
  rect(310, 210, 80,80);
  rect(210, 310, 80,80);
  rect(310, 310, 80,80);
  
  
  
  
  
}


