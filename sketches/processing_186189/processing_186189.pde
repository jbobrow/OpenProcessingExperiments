
int line_weight = 20;
int x_height = 100;


void setup() {
  size(960, 580);
  stroke(255,240,245);
}

void draw() {
  background(240,172,172);
  
  if (mouseX > width/2) {
    if (mouseY > height/2) {
      fill(255,255,200);
      rect(mouseX, mouseY, 30, 30);    
    }
  }
  
  if (mouseX < width/2) {
    if (mouseY < height/2) {
      fill(155,155,100);
      ellipse(mouseX, mouseY, 30, 30);    
    }
  }
  
  if (mouseX < width/2) {
    if (mouseY > height/2) {
      fill(55,55,0);
      ellipse(mouseX, mouseY, 30, 30);    
    }
  }
  
  if (mouseX >width/2) {
    if (mouseY < height/2) {
      fill(155,255,10);
      noStroke();
      rect(100 , x_height , line_weight , 100);
      rect(100 , x_height , 70 , line_weight);
      rect(170 , 80 , line_weight , 120);
      rect(100 , 180 , 70 , line_weight);
  
      rect(220 , x_height , line_weight , 100);
      rect(220 , x_height , 70 , line_weight);
      rect(290 , x_height , line_weight , 80);
      rect(220 , 180 , 70 , line_weight);
  
      rect(340 , 100 , line_weight , 100);
      rect(340 , 180 , 70 , line_weight);
      rect(410 , x_height , line_weight, 130);
  
      rect(460 , x_height , line_weight , 100);
      rect(460 , x_height , 70 , line_weight);
      rect(530 , x_height , line_weight , 80);
      rect(460 , 180 , 70 , line_weight);
  
      rect(580 , x_height , line_weight , 100);
      rect(580 , x_height , 70 , line_weight);
      rect(650 , x_height , line_weight , 100);   
    }
  }
  
  
  line(width/2, 0 , width/2, height);
  line(0 , height/2, width, height/2);
  
}
