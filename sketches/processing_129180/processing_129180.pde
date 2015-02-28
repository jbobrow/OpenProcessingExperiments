
/* Created by Eric Morrison
hold M to move
hold UP to smile
hold DOWN to frown
*/
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
  //face update + eye movment
  fill(255);
  background(255);
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
  //eyes
  strokeWeight(10);
  fill(0);
  ellipse(map(mouseX, 0, width, width/2-10, width/2+10)-70, map(mouseY, 0, height, height/2-3, height/2+3)-10, 4, 9);
  ellipse(map(mouseX, 0, width, width/2-10, width/2+10)+70, map(mouseY, 0, height, height/2-3, height/2+3)-10, 4, 9);
  //mouth
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
  
  //mouth
  strokeWeight(5);
    stroke(0);
    line(width/2-30, height/2+130, width/2+30, height/2+130);
    stroke(255);
    ellipse(width/2, height/2+130, 90, 60);

  if (keyPressed) {
    if (key == 'm' || key == 'M') {
      // move face
      background(255);
      fill(255);
      stroke(0);
      strokeWeight(3);
      ellipse( mouseX, mouseY, 300, 400);
      line(mouseX-80, height/2+mouseY, mouseX-80, height/2+mouseY-78);
      line(mouseX+80, height/2+mouseY, mouseX+80, height/2+mouseY-78);
      strokeWeight(10);
      rect(mouseX+20, mouseY-height/2+200, 110, 80, 10, 0, 20, 50);
      rect(mouseX-20-110, mouseY-height/2+200, 110, 80, 0, 10, 50, 20);
      rect(mouseX-150, mouseY-50, 20, 10, 0, 0, 0, 10);
      rect(mouseX+150-20, mouseY-50, 20, 10, 0, 0, 10, 0);
      strokeWeight(20);
      line(mouseX-15, mouseY-30, mouseX+15, mouseY-30);
      strokeWeight(10);
      fill(0);
      ellipse(mouseX-70, mouseY-10, 4, 9);
      ellipse(mouseX+70, mouseY-10, 4, 9);
      strokeWeight(3);
      noFill();
      arc(mouseX-60, mouseY-2, 80, 40, PI+QUARTER_PI, PI+HALF_PI);
      arc(mouseX+60, mouseY-2, 80, 40, PI+QUARTER_PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI);
      arc(mouseX-15, mouseY+95, 20, 40, PI+QUARTER_PI, PI+HALF_PI);
      arc(mouseX+15, mouseY+95, 20, 40, PI+QUARTER_PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI);
      ellipse(mouseX-10, mouseY+90, 10, 3);
      ellipse(mouseX+10, mouseY+90, 10, 3);
      line(mouseX-15, mouseY+60, mouseX-15, mouseY+30);
      fill(255);
      stroke(255);
      strokeWeight(1);
      ellipse(mouseX-145, mouseY-45, 10, 3);
      ellipse(mouseX+145, mouseY-45, 10, 3);
      strokeWeight(2);
      stroke(0);
      noFill();
      arc(mouseX-width/2+300, mouseY-height/2+100, 50, 200, 0, HALF_PI);
      arc(mouseX-width/2+150, mouseY-height/2+100, 350, 200, 0, HALF_PI);
      arc(mouseX-width/2+100, mouseY-height/2+100, 450, 200, 0, HALF_PI);
      arc(mouseX-width/2+290, mouseY-height/2+190, 300, 200, PI, PI+HALF_PI);
      arc(mouseX-width/2+290, mouseY-height/2+250, 250, 300, PI+QUARTER_PI, PI+HALF_PI);
      
     //mouth
     strokeWeight(5);
    stroke(0);
    line(mouseX-30, mouseY+130, mouseX+30, mouseY+130);
    stroke(255);
    ellipse(mouseX, mouseY+130, 90, 60);
    }
  }

  //conditionals deciding whether to smile or frown based on arrows


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



