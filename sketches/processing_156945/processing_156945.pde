
// the variation amount of position X and Y 
float varX, varY;
// the ball sizes
float ballS, ballM, ballL;

void setup() {
  size(700, 700);
  smooth();
  varY = random(70);
  varX = random(70);
}

void draw() {
  ballS = random(10);
  ballM = random(20);
  ballL = random(45);
  
  if (mousePressed) {
    //stroke(random(255), random(255), random(255));
    noStroke();
    fill(random(255), random(255), random(255)); 

// generate balls to explode
    ellipse(mouseX-random(varX), mouseY-random(varY), ballS, ballS);
    ellipse(mouseX+random(varX), mouseY-random(varY), ballM, ballM);
    ellipse(mouseX+random(varX), mouseY+random(varY), ballL, ballL);
    ellipse(mouseX-random(varX), mouseY+random(varY), ballM, ballM);

    ellipse(mouseX-random(varX), mouseY, ballM, ballM);
    ellipse(mouseX, mouseY-random(varY), ballS, ballS);
    ellipse(mouseX+random(varX), mouseY, ballM, ballM);
    ellipse(mouseX, mouseY+random(varY), ballL, ballL);

    ellipse(mouseX-random(varX)/2, mouseY-random(varY), ballL, ballL);
    ellipse(mouseX+random(varX)/2, mouseY-random(varY), ballM, ballM);
    ellipse(mouseX-random(varX)/2, mouseY+random(varY), ballS, ballS);
    ellipse(mouseX+random(varX)/2, mouseY+random(varY), ballM, ballM);

    ellipse(mouseX-random(varX), mouseY-random(varY)/2, ballM, ballM);
    ellipse(mouseX+random(varX), mouseY-random(varY)/2, ballL, ballL);
    ellipse(mouseX-random(varX), mouseY+random(varY)/2, ballM, ballM);
    ellipse(mouseX+random(varX), mouseY+random(varY)/2, ballS, ballS);

    varX += random(70);
    varY += random(70);

  } else {
    varY = 0;
    varX = 0;

// random background color 
    background(mouseX, mouseY, mouseX%(mouseY+1));
    
    noStroke();
    fill(random(255), random(255), random(255));
    ellipse(random(100)+mouseX-25, random(100)+mouseY-25, 15, 15);
    ellipse(random(100)+mouseX+25, random(100)+mouseY-25, 5, 5);
    ellipse(random(100)+mouseX, random(100)+mouseY, 35, 35);
    ellipse(random(100)+mouseX-25, random(100)+mouseY-25, 15, 15);
    ellipse(random(100)+mouseX+25, random(100)+mouseY-25, 25, 25);
    ellipse(random(100)+mouseX, random(100)+mouseY, 35, 35);
  }
}



