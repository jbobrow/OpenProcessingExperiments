
// Beatriz Bukvic - March 5th, Creative Computing B, Benjamin Bacon

void setup(){
  size(500,500);
}

void draw(){
  
  background(203,244,211);
  
   //----------------------------
  
  noStroke();
  fill(155,188,162);
  
  if (key == CODED) {
    if (keyCode == UP) { 
      noStroke();
      fill(73,12,54);
    } else {
  noStroke();
  fill(155,188,162);
    }
  }
  beginShape();
    vertex(250, 100);
    vertex(290, 150);
    vertex(270, 150);
    vertex(270, 185);
    vertex(230, 185);
    vertex(230, 150);
    vertex(210, 150);
  endShape(CLOSE);
  
   //----------------------------
  
  if (key == CODED) {
    if (keyCode == RIGHT) { 
      noStroke();
      fill(73,12,54);
    } else {
  noStroke();
  fill(155,188,162);
    }
  }
  beginShape();
    vertex(350, 210);
    vertex(400, 250);
    vertex(350, 290);
    vertex(350, 270);
    vertex(310, 270);
    vertex(310, 230);
    vertex(350, 230);
  endShape(CLOSE);
  
 
   //----------------------------
  
  if (key == CODED) {
    if (keyCode == DOWN) { 
      noStroke();
      fill(73,12,54);
    } else {
  noStroke();
  fill(155,188,162);
    }
  }
  beginShape();
    vertex(270, 310);
    vertex(270, 350);
    vertex(290, 350);
    vertex(250, 400);
    vertex(210, 350);
    vertex(230, 350);
    vertex(230, 310);
  endShape(CLOSE);
  
   //----------------------------
  
  if (key == CODED) {
    if (keyCode == LEFT) { 
      noStroke();
      fill(73,12,54);
    } else {
  noStroke();
  fill(155,188,162);
    }
  } 
  beginShape();
    vertex(190, 270);
    vertex(150, 270);
    vertex(150, 290);
    vertex(100, 250);
    vertex(150, 210);
    vertex(150, 230);
    vertex(190, 230);
  endShape(CLOSE);
  }




