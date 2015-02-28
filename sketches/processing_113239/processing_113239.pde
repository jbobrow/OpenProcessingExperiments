
//Make Circles & Line
//Test 004 [Date:20131002] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

//滑鼠固定座標於畫布中央，移動滑鼠往外作圖

void setup() {

  size(600, 300);
  smooth();
  background(7, 16, 49);
  
}

void draw() {

  
  stroke(mouseX, mouseY, mouseX/10+mouseY/10, 120);
  strokeWeight(0.5);
  

  if (mousePressed) {
    
    fill(mouseX, mouseY);
  } 
  else {
    fill(255, 150);
  }


  float centerX = width/2;
  float centerY = height/2;


 
  line(centerX -20, centerY-40, centerX+20, centerY+40);
  line(mouseX, mouseY, 300, 150);
  
}

void keyPressed() {
  saveFrame("screen-###.png");
}



