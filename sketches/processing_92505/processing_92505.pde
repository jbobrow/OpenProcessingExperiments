
boolean reset;
boolean first;

void setup() {
  first = true;
  size(400, 400);
  background(0);
  noStroke();
}

void draw() {
  fill(10, 5);
  rect(0,0,width, height); 
  if(mousePressed){
    if(!reset && mouseX > 190 && mouseX < 210 && mouseY > 190 && mouseY < 210) {
      background(0);
    }
    if(mouseX != 200 && mouseY != 200){
      drawLine(mouseX, mouseY, pmouseX, pmouseY);
      stroke(255, 95);
      strokeWeight(10);
    }
    reset = true;    
  } else {
    if(!first) {
      ellipse(200, 200, 20, 20);
      fill( 100 , 121, 20 );
    }
    first = false;
    reset = false;
  }
}

void drawLine(int x, int y, int x2, int y2) {
  if(x >= 210 && y < 190) {
    line(y, x, y2, x2);
    fill(255, 90);
    ellipse(y, x, 0.5, 0.5);
    fill(0);
  } else if(x >= 210 && y >= 210) {
    line(400-y, 400-x, 400-y2, 400-x2);
    fill(255, 90);
    ellipse(400-y, 400-x, 0.5, 0.5);
    fill(0);
  } else if(x < 190 && y < 190){
    line(400-x, 400-y, 400-x2, 400-y2);
    fill(255, 90);
    ellipse(400-x, 400-y, 0.5, 0.5);
    fill(0);
  } else {
    line(400-x, 400-y, 400-x2, 400-y2);
    fill(255, 90);
    ellipse(400-x, 400-y, 0.5, 0.5);
    fill(0);
  }
}
