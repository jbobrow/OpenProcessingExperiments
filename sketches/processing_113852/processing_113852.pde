
//Make Circles & Line
//Test 005 [Date:20131006] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

//圓形移動背景顏色跟著變動

void setup() {

  size(600, 300);
  smooth();
  background(0);
}

void draw() {

  stroke(mouseX, mouseY, mouseX+mouseY, 120);
  strokeWeight(2);


  if (mousePressed) {
    fill(mouseX, mouseY, mouseX-mouseY, mouseX+mouseY);
    background(0);
  } 
  else {

    fill(mouseX/2, mouseY/4, mouseX+mouseY);
    background(mouseX, mouseY, mouseX+mouseY);
  }


  float centerX = width/2;
  float centerY = height/2;

  ellipse(mouseX, mouseY, centerX/4, centerY/2);
}



