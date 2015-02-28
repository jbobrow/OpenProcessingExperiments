
//Make Circles & Line
//Test 005 [Date:20131006] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

//圓形漸層

void setup() {

  size(600, 300);
  smooth();
  background(40, 59, 67);
}

void draw() {

  stroke(mouseX, mouseY, mouseX+mouseY, 120);
  strokeWeight(2);


  if (mousePressed) {
    fill(mouseX, mouseY, mouseX-mouseY);
  } 
  else {
    
    fill(mouseX/2, mouseY, mouseX+mouseY);
  }


  float centerX = width/2;
  float centerY = height/2;

  ellipse(centerX, centerY, mouseX+5, mouseX+5);
}



