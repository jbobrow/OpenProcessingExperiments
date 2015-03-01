
}


void draw() {
  background (15,95,128);
  fill(100);
  stroke(150);
  ellipse(300,200,100,100);
  //
  fill(5);
  stroke(100);
  ellipse(300,125,75,50);
  //
  fill(100);
  stroke(20);
  ellipse(300,75,50,50);
  fill(100);
  stroke(100);
  fill(50);
  stroke(45);
  
  if (mousePressed) {
    fill(125);
    ellipse(291,60,15,15);
    ellipse(309,60,15,15);
  } else 
    fill(225);
    ellipse(291,60,15,15);
    ellipse(309,60,15,15);
  }
