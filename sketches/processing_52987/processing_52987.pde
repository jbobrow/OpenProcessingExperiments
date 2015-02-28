
PImage monday;

void setup() {
  size(700, 420); 
  frameRate(15);
  monday = loadImage("monday.jpg");
}

void draw() {
//    noLoop();

  // writing "monday" with glowing 
  // randomic colors and various shapes
  // by ruggero castagnola
  background(0); 
  //  image(monday, 0, 0, 700, 420);    

  // background ellipses (they come and go)
  for (int z = 0; z < 5; z++) {
    float radiusel0 = random(20);
    noStroke();
    fill(random(255), random(255), random(255), random(40, 80));
    ellipse(random(width), random(height), radiusel0, radiusel0);
  }

  // M letter
  // m part 1 (ellipses in the center)
  for (int a = 0; a < 10; a++) {
    float radiusel = random(50);
    noFill();
    strokeWeight(1);
    stroke(random(140), random(200, 220), random(190, 245), random(140, 180));
    ellipse(random(97, 109), random(191, 205), radiusel, radiusel);
  }
  // m part 2 (left & right legs)  
  // specular to m part 7
  for (int i = height; i > 159; i--) {
    for (int l = 1; l < 3; l++) {
      stroke(random(140), random(200, 220), random(190, 245), random(140, 180));
      strokeWeight(1);
      line(20+random(-10, 10)+l*50, i, 30+random(-10, 10)+l*50, i);
    }
  }

  // A letter (here because of layer order)
  // a
  for (int p = 0; p < 10; p++) {
    stroke(random(140), random(200, 220), random(190, 245), random(140, 180));
    strokeWeight(1);
    triangle(random(450, 470), random(20, 40), 
    random(30, 40), random(50, 60), 
    random(620, 648), random(357, 377));
  }

  // O letter
  // black o shade
  for (int b = 0; b < 10; b++) {
    strokeWeight(5);
    noFill();
    stroke(0);
    //  acceptably right ellipse(212, 210, 65, 105);
    ellipse(random(190, 214), random(154, 164), 
    random(50, 70), random(90, 110));
  }
  // o
  for (int b = 0; b < 10; b++) {
    strokeWeight(1);
    noFill();
    stroke(random(140), random(200, 220), random(190, 245), random(140, 180));
    ellipse(random(190, 214), random(154, 164), 
    random(50, 70), random(90, 110));
  }

  // N letter
  // black n part 1 (left leg) shade
  // equals n part 3
  for (int m = 271; m < 288; m++) {
    stroke(0);
    strokeWeight(5);
    line(m, height, m, (height/2)+random(-20, 20)-40);
  }
  // black n part 2 (oblique part) shade
  float ver3 = random(height/2);
  int hor3 = 270;
  for (int linerep3 = 0; linerep3 < 27; linerep3++) {
    stroke(0);
    strokeWeight(5);
    line(random(265, 290), random(150, 170), 
    random(326, 340), random(255, 275));
    hor3 += 4;
  }
  // black n part 3 (right leg) shade
  for (int n = 319; n < 336; n++) {
    stroke(0);
    strokeWeight(5);
    line(n, random(height)-150, n, random(height)-150);
  }
  // n part 1 (left leg)
  for (int m = 271; m < 288; m++) {
    stroke(random(140), random(200, 220), random(190, 245), random(140, 180));
    strokeWeight(1);
    line(m, height-random(height/2)+random(-5, 30), m, (height/2)+random(-20, 20)-40);
  }
  // n part 2 (oblique part)
  for (int linerep3 = 0; linerep3 < 27; linerep3++) {
    stroke(random(140), random(200, 220), random(190, 245), random(140, 180));
    strokeWeight(1);
    line(random(265, 290), random(150, 170), 
    random(326, 340), random(255, 275));
    hor3 += 4;
  }
  // n part 3 (right leg)
  for (int n = 319; n < 336; n++) {
    stroke(random(140), random(200, 220), random(190, 245), random(140, 180));
    strokeWeight(1);
    line(n, random(height)-150, n, random(height)-150);
  }

  // D letter
  // black d shade
  for (int o = 0; o < 10; o++) {
    stroke(0);
    strokeWeight(5);
    arc(random(365, 393), 210, 110, 200, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  // d
  for (int o = 0; o < 10; o++) {
    stroke(random(140), random(200, 220), random(190, 245), random(140, 180));
    strokeWeight(1);
    arc(random(365, 393), 210, 110, 200, PI+HALF_PI, TWO_PI+HALF_PI);
  }

  // Y letter
  // black y part 1 (tail) shade
  for (int q = 0; q < 10; q++) {
    noFill();
    strokeWeight(5);
    stroke(0);
    arc(random(380, 420), 190, 353, 380, 0, HALF_PI);
  }
  // black y part 2 (arc on top) shade
  for (int r = 0; r < 10; r++) {
    noFill();
    strokeWeight(5);
    stroke(0);
    arc(random(569, 589), random(100, 120), 150, 130, 0, PI);
  }
  // y part 1 (tail)
  for (int q = 0; q < 10; q++) {
    noFill();
    strokeWeight(1);
    stroke(random(140), random(200, 220), random(190, 245), random(140, 180));
    arc(random(380, 420), 190, 353, 380, 0, HALF_PI);
  }
  // y part 2 (arc on top)
  for (int r = 0; r < 10; r++) {
    noFill();
    strokeWeight(1);
    stroke(random(140), random(200, 220), random(190, 245), random(140, 180));
    arc(random(575, 595), random(100, 120), 150, 130, 0, PI);
  }
}


