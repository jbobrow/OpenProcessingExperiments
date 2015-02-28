
//Mark Terra-Salomao
//Introduction to Digital Media
//Section A
//September 11, 2012

// Disclaimer: DO NOT RUN THIS PROGRAM IF YOU ARE EPILEPTIC.

boolean a = false;

void setup() {
  size(1200, 600);
  smooth(); //antialiasing
  //background(19,23,173);
}

void draw() {



  background(19, 23, 173);

  for (int i=0; i<1000; i++) {
    strokeWeight(0.25);
    stroke(255);
    noFill();
    ellipse(i*15, i*3, 500, 410);
  }

  line(0, height, width, 525);

  strokeWeight(2.75);
  stroke(242, 126, 17);

  for (int i=0; i<10; i++) {
    line(0, 0, mouseX, i*mouseY);
    line(0, height, mouseX, (i/2)*mouseY);
    line(width, 0, mouseX, i*mouseY);
    line(width, height, mouseX, (i/2)*mouseY);

    fill(i*23, 64, 101);
    ellipse(mouseX, i*mouseY, 15, 15);
  }
  
  for (int i=0; i<1000; i++) {
    if(a) {
    strokeWeight(0.75);
    stroke(random(0,255), random(0,255), random(0,255));
    noFill();
    ellipse(i*15, i*3, 500, 410);
  
    }
  }


  strokeWeight(5);
  stroke(255, 3, 28);
  fill(random(0, 255), random(0, 255), random(0, 255));

  for (int i=0; i<10; i++) {
    if (a) {
      line(0, 0, mouseX, i*mouseY);
      line(0, height, mouseX, (i/2)*mouseY);
      line(width, 0, mouseX, i*mouseY);
      line(width, height, mouseX, (i/2)*mouseY);
      ellipse(mouseX, i*mouseY, 15, 15);
      rect(random(0, 250), random(0, 250), random(3, 108), random(8, 254));
      rect(random(950, 1200), random(350, 600), random(3, 108), random(8, 254));
    }
  }


  strokeWeight(random(0, 15));
  stroke(random(0, 255), random(0, 255), random(0, 255));



  for (int i=0; i<10; i++) {
    if (a) {
      line(mouseX, i*mouseY, random(0, 1200), random(0, 600));
    }
  }
}


void mouseClicked() {
  a = !a;
  println(a);
}



void keyPressed() {
  if (key == 's') {
    save("markTerra-Salomao.png");
  }
}
