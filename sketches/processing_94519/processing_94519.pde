

// 20121181 JiHoon Han

// Used in brush 1
PImage webImg;

// Used in brush 5
float a = 0;
float b = 0;

// setup function (run once)
void setup() {
  size(800, 800);

  background(255);
  noStroke();

  // text telling how to use program
  fill(0);
  textSize(30);
  fill(255, 0, 0);
  text("Doesn't work on website.\nPlease use in Processing app!", width/8, height/2 - 300);

  fill(0);
  text("Press a number (1~9) and left mouse to draw", width/8, height/2 - 100);
  textSize(20);
  text("Press '0' to erase the whole canvas", width/8, height/2 - 50);
  text("Press right mouse to erase a little part", width/8, height/2 - 20);

  text("You need to connect to internet to use brush 1", width/8, height/2 +30);

  // load image for brush 1
  String url ="http://postfiles5.naver.net/20130326_4/jihoongks_13643025010192YFPK_PNG/aa4.png?type=w2";
  webImg = loadImage(url, "png");
}


//////////////////////////// brush functions ////////////////////////////
void brush1() {
  frameRate(10);
  image(webImg, -20, -20, 100, 100);
  frameRate(60);
}

void brush2() {

  noStroke();
  fill(random(100, 200), random(100, 200), random(100, 200));
  ellipse(random(-10, 10), random(-10, 10), 20, 20);

  brush2Small();
  brush2Small();
  brush2Small();
}

void brush2Small() {
  frameRate(30);
  pushMatrix();
  translate(random(-10, 10), random(-10, 10));

  fill(random(0, 255), random(0, 255), random(0, 255), random(100, 255));
  ellipse(random(-10, 10), random(-10, 10), random(5, 30), random(5, 30));

  popMatrix();

  brush2SmallSmall();
  brush2SmallSmall();

  frameRate(60);
}

void brush2SmallSmall() {
  pushMatrix();
  translate(random(-30, 30), random(-30, 30));

  fill(random(0, 255), random(0, 255), 0, 150);
  ellipse(random(-5, 5), random(-5, 5), random(2, 5), random(2, 5));

  popMatrix();
}

void brush3() {

  noStroke();

  pushMatrix();
  scale(3);

  fill(255, 0, 0, random(0, 150));
  triangle(0, 0, 10, 0, 5, 10);

  popMatrix();

  brush3Small();
  brush3Small();
}

void brush3Small() {
  pushMatrix();
  translate(random(10, 30), random(-10, 10));
  scale(random(0.01, 2));

  fill(0, random(0, 255), 0, random(0, 150));
  triangle(0, 0, 10, 0, 5, 10);

  popMatrix();

  pushMatrix();
  translate(random(-10, -30), random(10, 30));
  scale(random(0.01, 1.8));

  fill(0, 0, random(0, 255), random(0, 150));
  triangle(0, 0, 10, 0, 5, 10);

  popMatrix();
}

void brush4() {
  pushMatrix();
  rotate(radians((millis())/3)*3);

  strokeWeight(1);
  stroke(random(80, 240), random(10, 50), random(80, 240));
  line(0, 0, 10, 50);
  noStroke();

  popMatrix();
}

void brush6() {

  stroke(0);
  strokeWeight(1);
  fill(random(100, 200), random(50, 150), random(0, 100), random(10, 80));
  int c;
  c = int(random(0, 3.99));

  if (c == 0)
    ellipse(0, 0, 10, 10);

  else if (c == 1)
    rect(0, 0, 20, 5);

  else if (c == 2)
    ellipse(0, 0, 20, 10);

  else if (c == 3)
    arc(0, 0, 50, 50, 0, HALF_PI);
}

void brush7() {

  pushMatrix();

  scale(0.2);
  rotate(radians((millis())/3)*3);
  translate(-250, -250);

  noStroke();
  //the face
  strokeWeight(2);
  fill(250, 245, 41, 255);
  ellipse(250, 250, 250, 250);
  strokeWeight(1);

  //the mouth
  fill(0, 0, 0, 255);
  arc(250, 230, 250, 250, PI/5, PI/1.5, CHORD);

  //the eyes
  ellipse(200, 200, 50, 50);
  ellipse(300, 200, 50, 50);

  popMatrix();

  brush7Small();
}

void brush7Small() {
  pushMatrix();

  scale(0.1);
  rotate(radians((millis())/3)*3);
  translate( 150, 150);

  stroke(0);
  //the face
  strokeWeight(2);
  fill(250, 245, 41, 255);
  ellipse(250, 250, 250, 250);
  strokeWeight(1);

  //the mouth
  fill(0, 0, 0, 255);
  arc(250, 230, 250, 250, PI/5, PI/1.5, CHORD);

  //the eyes
  ellipse(200, 200, 50, 50);
  ellipse(300, 200, 50, 50);

  popMatrix();
}

void brush8() {
  fill(0);
  ellipse(0, 0, 30, 30);
}

void brush8White() {
  fill(255);
  ellipse(0, 0, 30, 30);
}

void brush9() {
  int text1;
  text1 = int(random(65, 122));

  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  text(text1, 0, 0);
}

//////////////////////////// main draw function ////////////////////////////
void draw() {

  // erase canvas if key '0' is pressed
  if (key == '0') {
    println("Erase whole canvas");
    background(255);
  }

  // brush 5
  if (key == '5') {
    println("Use brush 5");

    noStroke();
    pushMatrix();

    if ( mousePressed && (mouseButton == LEFT)) {

      a = mouseX;
      b = mouseY;

      translate(a, b);

      fill(10, 10, random(50, 200), random(50, 255));
      rect(0, 0, 8, 40);
    }

    else {

      pushMatrix();

      a = a + random(0, 3);
      b = b + random(0, 3);
      translate(a, b);

      fill(10, 10, random(50, 200), random(50, 150));
      rect(0, 0, 8, 40);

      fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
      ellipse(random(-10, 30), random(-20, 60), 10, 10);

      popMatrix();
    }  

    popMatrix();
  }


  // use brush when left mouse is pressed
  if ( mousePressed && (mouseButton == LEFT)) {

    if (key == '1') {
      println("Use brush 1");

      pushMatrix();
      translate(mouseX, mouseY);

      brush1();

      popMatrix();
    }

    else if (key == '2') {
      println("Use brush 2");

      pushMatrix();
      translate(mouseX, mouseY);

      brush2();

      popMatrix();
    }


    else if (key == '3') {
      println("Use brush 3");

      pushMatrix();
      translate(mouseX, mouseY);

      brush3();

      popMatrix();

      fill(255, 255, 255, 5);
      rect(0, 0, width, height);
    }

    else if (key == '4') {
      println("Use brush 4");

      pushMatrix();
      translate(mouseX, mouseY);

      brush4();

      popMatrix();

      //      background(0, 0, 0);
    }

    else if (key == '6') {
      println("Use brush 6");

      pushMatrix();
      translate(mouseX, mouseY);
      rotate(radians(random(0, 360)));

      brush6();

      popMatrix();
    }

    else if (key == '7') {
      println("Use brush 7");

      pushMatrix();
      translate(mouseX, mouseY);

      brush7();

      popMatrix();
    }

    else if (key == '8') {
      println("Use brush 8");

      fill(255, 0, 0);
      textSize(30);
      text("Color the canvas with black, faster than white!!", 10, 30);

      noStroke();
      pushMatrix();
      translate(mouseX, mouseY);
      brush8();
      popMatrix();

      float r;
      r = random(1, 3);

      if (r<2) {
        pushMatrix();
        translate(random(0, width), random(0, height));
        brush8White();
        popMatrix();

        pushMatrix();
        translate(random(0, width), random(0, height));
        brush8White();
        popMatrix();
      }

      if (r>2) {
      }
    }

    else if (key == '9') {
      pushMatrix();
      translate(mouseX, mouseY);

      brush9();

      popMatrix();
    }
  }

  // use an eraser when right mouse is pressed
  else if (mousePressed && (mouseButton == RIGHT)) {
    noStroke();
    fill(255);
    ellipse(mouseX, mouseY, 80, 80);
  }
}

