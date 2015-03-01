
float bg = 255;

void setup() {
  size(800, 500);
  noFill();
  strokeWeight(3);
  smooth();
}
void draw() {
  background(bg);
  noFill();
  stroke(0);
  ellipse(421.053-mouseX/19, 263.158-mouseY/19, 475, 475);
  ellipse(422.222-mouseX/18, 263.889-mouseY/18, 450, 450);
  ellipse(423.529-mouseX/17, 264.706-mouseY/17, 425, 425);
  ellipse(425-mouseX/16, 265.625-mouseY/16, 400, 400); 
  ellipse(426.667-mouseX/15, 266.667-mouseY/15, 375, 375); 
  ellipse(428.571-mouseX/14, 267.86-mouseY/14, 350, 350); 
  ellipse(430.769-mouseX/13, 269.231-mouseY/13, 325, 325); 
  ellipse(433.333-mouseX/12, 270.833-mouseY/12, 300, 300);
  ellipse(436.364-mouseX/11, 272.727-mouseY/11, 275, 275); 
  ellipse(440-mouseX/10, 275-mouseY/10, 250, 250);
  ellipse(444.444-mouseX/9, 277.778-mouseY/9, 225, 225); 
  ellipse(450-mouseX/8, 281.25-mouseY/8, 200, 200);
  ellipse(457.143-mouseX/7, 285.714-mouseY/7, 175, 175); 
  ellipse(466.667-mouseX/6, 291.667-mouseY/6, 150, 150);
  ellipse(480-mouseX/5, 300-mouseY/5, 125, 125); 
  ellipse(500-mouseX/4, 312.5-mouseY/4, 100, 100);
  ellipse(533.333-mouseX/3, 333.333-mouseY/3, 75, 75); 
  ellipse(600-mouseX/2, 375-mouseY/2, 50, 50);
  ellipse(800-mouseX, 500-mouseY, 25, 25);
  noStroke();
  fill(255, 0, 0);
  ellipse(1200-mouseX*2, 750-mouseY*2, 12.5, 12.5);
}

void mousePressed(){
  bg = bg - 20;
  if (bg<20){
    bg = 255;
  }
}
