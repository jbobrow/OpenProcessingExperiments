

void setup() {
  size(500, 500);
  background(255);
  //begin drawing of face
  fill(255);
  stroke(0);
  strokeWeight(3);
  ellipse( width/2, height/2, 300, 400);
  line(width/2-80, height, width/2-80, height-78);
  line(width/2+80, height, width/2+80, height-78);
  strokeWeight(10);
  rect(width/2+20, 200, 110, 80, 10, 0, 20, 50);
  rect(width/2-20-110, 200, 110, 80, 0, 10, 50, 20);
  rect(width/2-150, height/2-50, 20, 10, 0, 0, 0, 10);
  rect(width/2+150-20, height/2-50, 20, 10, 0, 0, 10, 0);
  strokeWeight(20);
  line(width/2-15, height/2-30, width/2+15, height/2-30);
  strokeWeight(10);
  fill(0);
  ellipse(width/2-70, height/2-10, 4, 9);
  ellipse(width/2+70, height/2-10, 4, 9);
  strokeWeight(3);
  noFill();
  arc(width/2-60, height/2-2, 80, 40, PI+QUARTER_PI, PI+HALF_PI);
  arc(width/2+60, height/2-2, 80, 40, PI+QUARTER_PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI);
  arc(width/2-15, height/2+95, 20, 40, PI+QUARTER_PI, PI+HALF_PI);
  arc(width/2+15, height/2+95, 20, 40, PI+QUARTER_PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI);
  ellipse(width/2-10, height/2+90, 10, 3);
  ellipse(width/2+10, height/2+90, 10, 3);
  line(width/2-15, height/2+60, width/2-15, height/2+30);
  fill(255);
  stroke(255);
  strokeWeight(1);
  ellipse(width/2-145, height/2-45, 10, 3);
  ellipse(width/2+145, height/2-45, 10, 3);
  strokeWeight(2);
  stroke(0);
  noFill();
  arc(300, 100, 50, 200, 0, HALF_PI);
  arc(150, 100, 350, 200, 0, HALF_PI);
  arc(100, 100, 450, 200, 0, HALF_PI);
  arc(290, 190, 300, 200, PI, PI+HALF_PI);
  arc(290, 250, 250, 300, PI+QUARTER_PI, PI+HALF_PI);
}

void draw() {



  //conditionals deciding whether to smile or frown based on arrows
  if (true) {
    stroke(0);
    line(width/2-30, height/2+130, width/2+30, height/2+130);
    stroke(255);
    ellipse(width/2, height/2+130, 90, 60);
  }

  if (keyPressed) {
    if (keyCode == UP) {
      strokeWeight(5);
      stroke(255);
      arc(width/2, height/2+130, 90, 60, PI, TWO_PI);
      line(width/2-30, height/2+130, width/2+30, height/2+130);
      stroke(0);
      noFill();
      arc(width/2, height/2+130, 90, 60, 0, PI);
    }

    else if (keyCode == DOWN) {
      strokeWeight(5);
      stroke(255);
      arc(width/2, height/2+130, 90, 60, 0, PI);
      line(width/2-30, height/2+130, width/2+30, height/2+130);
      stroke(0);
      noFill();
      arc(width/2, height/2+130, 90, 60, PI, TWO_PI);
    }
  }
}



