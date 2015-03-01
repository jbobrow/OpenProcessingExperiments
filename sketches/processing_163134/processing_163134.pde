
import processing.pdf.*;

boolean record = false;

void setup () {
  size(600, 600);
}
void draw () {
  
  if (record == true) {
    
    beginRecord(PDF, "frame-####.pdf");
    stroke(#F050D5);
  }

  background(#114179);

  pushMatrix();
  translate(width/2, height/2);

  for (int j = 0; j<50; j++) {
    pushMatrix();
    strokeWeight(0.5);
    rotate(radians(random(360)));
    for (int i = 0; i<20; i++) {
      rotate(radians(random(-15, 15)));
      scale(1.3);
      line(0, 0, 0, -46);
      translate(0, -25);
    }
    popMatrix();
  }
  popMatrix();

  noStroke();
  fill(#4486D3, 200);
  ellipse(width/2, height/2, 200, 200);

  fill(#4486D3, 160);

  ellipse(width/2, height/2, 400, 400);
  for (int i = 0; i < 80; i = i+5 ) {
    ellipse(width/2, height/2, i, i);
  }

  noFill();
  stroke(#F050D5, 150);
  strokeWeight(3);

  ellipse(width/2, 350, 80, 80);
  ellipse(width/2, 250, 80, 80);
  ellipse(250, height/2, 80, 80);
  ellipse(350, height/2, 80, 80);

  if (record) {
    endRecord();
    record = false;
  }
}


void keyPressed() {
  record = true;
}

