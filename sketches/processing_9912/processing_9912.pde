
boolean printThis, active1, active2, active3, active4, active5, active6, active7, active8, active9, initializeCursor;
float score, subtractor;
int page, a, b, c;
String worst = "The piece expresses an objective";
String worst1 = "overflowing of political numbness";
String worst2 = "and profound ignorance.";
String a1 = "Stop doing art.";
String worse = "As a deconstructionist homage,";
String worse2 = "it fails to imply the overall";
String worse3 = "sense of the medium's potential.";
String a2 = "Please get better at art.";
String bad = "My god, it's shit!";
String bad2 = "But in a post modernist manner.";
String good = "The formal juxtaposition between";
String good1 = "the esoteric form and the spatial";
String good2 = "relationship is agreeable.";
String a3 = "Draw better, though.";
String better = "The sublime beauty of the deeper";
String better1 = "values engenders a composition more";
String better2 = "indicative of porn than art.";
String a4 = "This is good.";
String best = "The organic tactilliousness of the";
String best1 = "piece renders it magnificently!";
String a5 = "This will sell marvelously.";

PFont font;

void setup() {
  textAlign(CENTER);
  c = -10;
  a = 0;
  score = 0;
  page = 1;
  subtractor = 0;
  active1 = false;
  active2 = false;
  active3 = false;
  active4 = false;
  active5 = false;
  active6 = false;
  active7 = false;
  active8 = false;
  active9 = false;
  size(500, 500);
  smooth();
  stroke(100);
  strokeWeight(1);
  background(255);
  noFill();
  //  rect(20, 20, 80, 80);
  //  rect(200, 300, 120, 90);
  //  rect(300, 90, 140, 140);
  //  rect(90, 150, 90, 110);
  //  rect(330, 390, 70, 70);
  //  rect(60, 420, 70, 70);
  //  rect(340, 260, 70, 70);
  //  rect(190, 70, 70, 70);
  //  rect(230, 410, 70, 70);

  font = loadFont("00-Starmap-Truetype-48.vlw");
  textFont(font);

  textSize(40);
  fill(200);
  text("DRAW!", 70, 35);
}

void draw() {
  if (page == 1) {
    stroke(50);
    strokeWeight(2);
    if(mouseX > 400 && mouseX < 480 && mouseY > 450 && mouseY < 480) {
      fill(21, 30, 124);
    } 
    else {
      fill(100);
    }
    rect(400, 450, 80, 30);
    fill(255);
    textSize(21);
    text("submit", 443, 472);
  } 
  else if (page == 2) {
    background(70);
    c++;
    if (c > 10) {
      c = -10;
    }
    if (c < 0) {
      fill(255);
      textSize(30);
      text("analyzing...", width/2 + 5, height/2 - 70);
    }
    a++;
    b = constrain(a, 0, 157);
    stroke(230);
    strokeWeight(3);
    fill(120);
    rect(width/2 - 80, height/2 - 20, 160, 40);
    noStroke();
    fill(21, 30, 124);
    rect(width/2 - 78, height/2 - 18, b, 37);
    if (b == 157) {
      page = 3;
    }
  }
  else if (page == 3) {
    pushMatrix();
    textSize(25);
    background(70);
    translate(0, -50);
    fill(255);
    if (score < 3) {
      text(worst, width/2, height/2 - 100);
      text(worst1, width/2, height/2 - 50);
      text(worst2, width/2, height/2);
      text(a1, width/2, height/2 + 50);
    } 
    else if (score >= 3 && score < 5) {
      text(worse, width/2, height/2 - 100);
      text(worse2, width/2, height/2 - 50);
      text(worse3, width/2, height/2);
      text(a2, width/2, height/2 + 50);
    } 
    else if (score >= 5 && score < 8) {
      text(bad, width/2, height/2 - 50);
      text(bad2, width/2, height/2);
      text(a2, width/2, height/2 + 50);
    } 
    else if (score >= 8 && score < 11) {
      text(good, width/2, height/2 - 100);
      text(good1, width/2, height/2 - 50);
      text(good2, width/2, height/2);
      text(a3, width/2, height/2 + 50);
    } 
    else if (score >= 11 && score < 14) {
      text(better, width/2, height/2 - 100);
      text(better1, width/2, height/2 - 50);
      text(better2, width/2, height/2);
      text(a4, width/2, height/2 + 50);
    } 
    else if (score >= 14) {
      text(best, width/2, height/2 - 50);
      text(best1, width/2, height/2);
      text(a5, width/2, height/2 + 50);
    }
    stroke(230);
    strokeWeight(3);
    if (mouseX > width/2 - 60 && mouseX < width/2 + 60 && mouseY > height/2 + 50 && mouseY < height/2 + 100) {
      fill(21, 30, 124);
    } 
    else {
      fill(120);
    }
    rect(width/2 - 60, height/2 + 100, 120, 50);
    fill(255);
    textSize(35);
    text("RETRY", width/2 + 4, height/2 + 137);
    popMatrix();
  }
  if (printThis == false) {
    println(score);
  } 
  else {
    println(mouseX + " " + mouseY);
  }
}

void mouseDragged() {
  if (page == 1) {
    subtractor++;
    strokeWeight(10);
    stroke(0);
    line(pmouseX, pmouseY, mouseX, mouseY);
    if (mouseX > 20 && mouseX < 100 && mouseY > 20 && mouseY < 100) {
      active1 = true;
    }
    if (mouseX > 200 && mouseX < 320 && mouseY > 300 && mouseY < 390) {
      active2 = true;
    }
    if (mouseX > 300 && mouseX < 440 && mouseY > 90 && mouseY < 230) {
      active3 = true;
    }
    if (mouseX > 90 && mouseX < 180 && mouseY > 150 && mouseY < 260) {
      active4 = true;
    }
    if (mouseX > 330 && mouseX < 420 && mouseY > 390 && mouseY < 480) {
      active5 = true;
    }
    if (mouseX > 60 && mouseX < 130 && mouseY > 420 && mouseY < 490) {
      active6 = true;
    }
    if (mouseX > 340 && mouseX < 410 && mouseY > 260 && mouseY < 330) {
      active7 = true;
    }
    if (mouseX > 190 && mouseX < 240 && mouseY > 70 && mouseY < 120) {
      active8 = true;
    }
    if (mouseX > 230 && mouseX < 300 && mouseY > 410 && mouseY < 480) {
      active9 = true;
    }
  }
}

void mousePressed() {
  if (mouseX > 400 && mouseX < 480 && mouseY > 450 && mouseY < 480) {
    if (active1 == true) {
      score = score + 3;
    }
    if (active2 == true) {
      score = score + 1;
    }
    if (active3 == true) {
      score = score + 0.5;
    }
    if (active4 == true) {
      score = score + 1;
    }
    if (active5 == true) {
      score = score + 3;
    }
    if (active6 == true) {
      score = score + 3;
    }
    if (active7 == true) {
      score = score + 1.5;
    }
    if (active8 == true) {
      score = score + 1.5;
    }
    if (active9 == true) {
      score = score + 2;
    }
    score = score - (subtractor/600);
    page = 2;
  }
  if (page == 3 && mouseX > width/2 - 60 && mouseX < width/2 + 60 && mouseY > height/2 + 50 && mouseY < height/2 + 100) {
    page = 1;
    setup();
  }
}

void keyPressed() {
  if (key == '1') {
    printThis = false;
  } 
  else if (key == '2') {
    printThis = true;
  }
}











