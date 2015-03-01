

void setup(){
  size(260, 260);
}

void draw(){
  background(204, 233, 255);

  drawFlower(mouseX+mouseY/2, mouseX, mouseY, 0, 0);
  drawFlower(140, 45, 45, -mouseY, 60);
  drawFlower(60, 270, 70, 100, -mouseX);
  drawFlower(242, 78, 220, mouseY, -55);
  drawFlower(0, 46, 167, -20, mouseX);
}

void drawFlower(int Rpetal, int Gpetal, int Bpetal, int xshift, int yshift) {
  //stem
  strokeWeight(5);
  stroke(0, 204, 102);
  line(130 + xshift, 70 + yshift, 130 + xshift, 210 + yshift);
  //flower petals
  noStroke();
  ellipseMode(CORNER);  // Set ellipseMode to CORNERS
  fill(Rpetal, Gpetal, Bpetal);  // Set fill to gray
  ellipse(70 + xshift, 45 + yshift, 50, 50); 
  ellipse(105 + xshift, 20 + yshift, 50, 50); 
  ellipse(85 + xshift, 85 + yshift, 50, 50); 
  ellipse(125 + xshift, 85 + yshift, 50, 50); 
  ellipse(140 + xshift, 45 + yshift, 50, 50); 
  //flower center
  fill(242, 223, 78);  
  ellipse(112 + xshift, 63 + yshift, 35, 35);

}
  


