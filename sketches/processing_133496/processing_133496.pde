

void setup() {
  size(1000, 400);
  background(0,0,0);
  noStroke();
}

float size = 4;

void draw() {

  ellipse(mouseX, mouseY, size, size);
}


void keyPressed() {
  if (key =='1') {
    fill(0, 0, 255);
    background(255,0,0);
    
  } if (key == '2') {
    fill(0, 255, 0);
    background(255,0,200);
    
  } if (key == '3') {
    fill(0, 0, 255);
    background(255,255,0);
    
      } if (key == '4') {
    fill(255, 255, 255);
    background(0,0,0);
  
        } if (key == '5') {
    fill(255, 160, 200);
    background(0,0,255);
  }


  size = 4;
}

