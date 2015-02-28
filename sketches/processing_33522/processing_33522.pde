
void setup() {
  size(900, 500);
  background(100);
  smooth();
}


void draw() {

  fill(255, 72, 238); // eye background: yellowd
  noStroke();
  ellipse (450, 150, 230, 230);  // pink body circle

  fill(255, 230, 0); // yellow color
  ellipse (400, 150, 55, 70);   //eye balls
  ellipse (500, 150, 55, 70);   //eye balls

  ellipse (450, 240, 60, 10);   //eye balls

  float leftEyePos = map(mouseX, 0, width, 250, 350);
  float rightEyePos = map(mouseX, 0, width, 550, 650);
  fill(255, 72, 238);  // pink

  // eye balls position
  ellipse(leftEyePos+100, 170, 20, 20);
  ellipse(rightEyePos-100, 170, 20, 20);

  float lidPos = map(mouseY, 100, height, 0, 250);
  //  rect(0, 0, width, lidPos);

  //  ellipse(400, 110, 80, lidPos);
  ellipse(400, 115, 80, lidPos-100);
  ellipse(500, 115, 80, lidPos-100);

  //random color circle
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 10, 10);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    fill(0, 200, 255);
  } 
  else {
    fill(255, 0, 255);
  }
  ellipseMode(CORNER); //center point of ellipse seting to 255,255
  ellipse(0, 0, width, height);
}


void keyPressed() {
  if (key == 'a') {
    println("a"); 
    background(100);
    fill(255, 72, 238); // eye background: yellowd
    noStroke();


    fill(255, 230, 0); // yellow color
    ellipse (400, 150, 55, 70);   //eye balls
    ellipse (500, 150, 55, 70);   //eye balls

    ellipse (450, 240, 60, 10);   //eye balls

    float leftEyePos = map(mouseX, 0, width, 250, 350);
    float rightEyePos = map(mouseX, 0, width, 550, 650);
    fill(255, 72, 238);  // pink

    // eye balls position
    ellipse(leftEyePos+100, 170, 20, 20);
    ellipse(rightEyePos-100, 170, 20, 20);

    float lidPos = map(mouseY, 100, height, 0, 250);
    //  rect(0, 0, width, lidPos);

    //  ellipse(400, 110, 80, lidPos);
    ellipse(450, 115, 80, lidPos-100);
    ellipse(550, 115, 80, lidPos-100);

    //    ellipseMode(CORNER); //center point of ellipse seting to 255,255
    //    ellipse(0, 0, width, height);
    
        ellipse (350, 50, 230, 230);  // pink body circle
  }
}


