
int cloudX1 = 23, cloudX2 = 75, cloudX3 = 50, cloudX4 = 50, cloudX5 = 50, cloudX6 = 90, cloudX7 = 30;

int grassX11 = 25, grassX12 = 75, grassX13 = 125, grassX14 = 175, grassX15 = 225, grassX16 = 275, grassX17 = 325, grassX18 = 375, grassX19 = 425;
int grassX21 = 75, grassX22 = 125, grassX23 = 175, grassX24 = 225, grassX25 = 275, grassX26 = 325, grassX27 = 375, grassX28 = 425, grassX29 = 475;

int rand;

int switchVar = 0;

void setup() { 
  size(500, 500);
  frameRate(4); 
}

void draw() {
  
  background(#A9D7D9);
  
  // cloud
  noStroke();
  fill(#139DBA);
  ellipse(cloudX1, 29, 50, 20);
  ellipse(cloudX2, 29, 50, 20);
  ellipse(cloudX3, 40, 50, 20);
  ellipse(cloudX4, 40, 50, 40);
  ellipse(cloudX5, 20, 50, 20);
  ellipse(cloudX6, 20, 50, 5);
  ellipse(cloudX7, 10, 50, 5);
  if (cloudX1 < 500) {
  cloudX1 += 1;
  cloudX2 += 1;
  cloudX3 += 1;
  cloudX4 += 1;
  cloudX5 += 1;
  cloudX6 += 1;
  cloudX7 += 1;
  }
  else {
    cloudX1 = 23;
    cloudX2 = 75;
    cloudX3 = 50;
    cloudX4 = 50;
    cloudX5 = 50;
    cloudX6 = 90;
    cloudX7 = 30;
  }
    
  // grass
  noStroke();
  fill(#82BF49);
  rect(0, 300, 500, 200);
  stroke(#456627);
  strokeWeight(2);
  rand = floor(random(2));
  switch(rand) {
    case 0:
      line(50, 400, grassX21, 380);
      line(100, 400, grassX22, 380);
      line(150, 400, grassX23, 380);
      line(200, 400, grassX24, 380);
      line(250, 400, grassX25, 380);
      line(300, 400, grassX26, 380);
      line(350, 400, grassX27, 380);
      line(400, 400, grassX28, 380);
      line(450, 400, grassX29, 380);
      line(50, 330, grassX11, 310);
      line(100, 330, grassX12, 310);
      line(250, 330, grassX15, 310);
      line(300, 330, grassX16, 310);
      line(350, 330, grassX17, 310);
      line(400, 330, grassX18, 310);
      line(450, 330, grassX19, 310);
    break;
    case 1:
      line(50, 400, grassX11, 380);
      line(100, 400, grassX12, 380);
      line(150, 400, grassX13, 380);
      line(200, 400, grassX14, 380);
      line(250, 400, grassX15, 380);
      line(300, 400, grassX16, 380);
      line(350, 400, grassX17, 380);
      line(400, 400, grassX18, 380);
      line(450, 400, grassX19, 380);
      line(50, 330, grassX21, 310);
      line(100, 330, grassX22, 310);
      line(250, 330, grassX25, 310);
      line(300, 330, grassX26, 310);
      line(350, 330, grassX27, 310);
      line(400, 330, grassX28, 310);
      line(450, 330, grassX29, 310);
    break;
  }

  // sun
  noStroke();
  fill(#FFCD26);
  arc(500, 0, 100, 100, PI/2, PI);
  stroke(#FFCD26);
  strokeWeight(4);
  rand = floor(random(2));
  switch(rand) {
    case 0:
      line(437, 7, 396, 7);
      line(442, 16, 396, 31);
      line(453, 42, 426, 64);
      line(480, 57, 464, 85);
      break;
    case 1:
      line(445, 28, 410, 45);
      line(465, 51, 443, 74);
      line(491, 59, 491, 95);
      break;
  }
  
  // cat
    // left back paw
    noStroke();
    fill(#706D6A);
    ellipse(212, 295, 20, 20);
    stroke(0);
    strokeWeight(1);
    line(210, 304, 210, 300);
    line(216, 303, 216, 297);
    
    // tail
    noStroke();
    fill(#706D6A);
    ellipse(132, 290, 90, 20);
    
    // body
    noStroke();
    fill(#A6A19D);
    ellipse(170, 265, 105, 105);
    
    // ears 
    noStroke();
    fill(#706D6A);
    triangle(145, 190, 140, 170, 165, 180);
    triangle(205, 190, 210, 170, 185, 180);
    
    // head
    noStroke();
    fill(#A6A19D);
    ellipse(175, 205, 70, 70);
    stroke(#706D6A);
    strokeWeight(1);
    arc(175, 205, 70, 70, PI/5, PI * 5/6);
    
    // eyes
    noStroke();
    fill(#4C702B);
    ellipse(163, 195, 10, 10);
    ellipse(188, 195, 10, 10);
    if (pow(mouseX - 163, 2) + pow(mouseY - 195, 2) == 100) {
      mouseClicked();
    }
    else if (pow(mouseX - 188, 2) + pow(mouseY - 195, 2) == 100) {
      mouseClicked();
    }
    
    // nose
    noStroke();
    fill(#706D6A);
    triangle(175.5, 217, 171, 210, 180, 210);
    
    // whiskers
    stroke(#706D6A);
    strokeWeight(1);
    if (mouseX >= 145 && mouseX <= 175 && mouseY >= 205 && mouseY <= 210) {
      line(175, 210, 145, 200);     
      line(175, 210, 145, 210);
      line(175, 210, 145, 215);
      line(177, 210, 207, 205);
      line(177, 210, 207, 210);
      line(177, 210, 207, 215);
    }
    else if (mouseX >= 145 && mouseX <= 175 && mouseY == 210) {
      line(175, 210, 145, 205);     
      line(175, 210, 145, 215);
      line(175, 210, 145, 215);
      line(177, 210, 207, 205);
      line(177, 210, 207, 210);
      line(177, 210, 207, 215);
    }
    else if (mouseX >= 145 && mouseX <= 175 && mouseY >= 210 && mouseY <= 215) {
      line(175, 210, 145, 205);     
      line(175, 210, 145, 210);
      line(175, 210, 145, 220);
      line(177, 210, 207, 205);
      line(177, 210, 207, 210);
      line(177, 210, 207, 215);
    }
    else if (mouseX >= 177 && mouseX <= 207 && mouseY >= 205 && mouseY <= 210) {
      line(175, 210, 145, 205);     
      line(175, 210, 145, 210);
      line(175, 210, 145, 215);
      line(177, 210, 207, 200);
      line(177, 210, 207, 210);
      line(177, 210, 207, 215);
    }
    else if (mouseX >= 177 && mouseX <= 207 && mouseY == 210) {
      line(175, 210, 145, 205);     
      line(175, 210, 145, 210);
      line(175, 210, 145, 215);
      line(177, 210, 207, 205);
      line(177, 210, 207, 215);
      line(177, 210, 207, 215);
    }     
    else if (mouseX >= 177 && mouseX <= 207 && mouseY >= 210 && mouseY <= 215) {
      line(175, 210, 145, 205);     
      line(175, 210, 145, 210);
      line(175, 210, 145, 215);
      line(177, 210, 207, 205);
      line(177, 210, 207, 210);
      line(177, 210, 207, 220);
    } 
    else {
      line(175, 210, 145, 205);     
      line(175, 210, 145, 210);
      line(175, 210, 145, 215);
      line(177, 210, 207, 205);
      line(177, 210, 207, 210);
      line(177, 210, 207, 215);
    }
    
    // mouth
    stroke(0);
    strokeWeight(1);
    line(169, 225, 182, 225);
  
    // left front paw
    noStroke();
    fill(#706D6A);
    ellipse(200, 315, 20, 20);
    stroke(0);
    strokeWeight(1);
    line(195, 323, 195, 315);
    line(203, 323, 203, 315);
    stroke(#706D6A);
    strokeWeight(1);
    line(190, 310, 186, 270);
    line(204, 305, 208, 265);
    
    // right front paw
    noStroke();
    fill(#706D6A);
    ellipse(155, 315, 20, 20);
    stroke(0);
    strokeWeight(1);
    line(150, 322, 150, 314);
    line(160, 322, 160, 314);
    stroke(#706D6A);
    line(146, 309, 142, 269);
    line(162, 306, 166, 266);
    
    // text
    noStroke();
    fill(0);
    rect(0, 450, 500, 50);
    fill(255);
    textSize(14);
    text("Don't click on the cat's eyes... (You can mouse over its whiskers.)", 25, 475);
    
    switch(switchVar) {
      case 0:
        break;
      case 1:
        background(#8E0B07);
        fill(255);
        textSize(40);
        text("Told ya.", 165, 250);
        break;
    }
    
}

void mouseClicked() {
  background(#8E0B07);
  switchVar = 1;
  draw();
}


