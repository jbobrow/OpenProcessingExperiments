

String message = "Alone";
float x, y; // X and Y coordinates of text
float angle = 0.0;

void setup() {
  size(640, 640);
  background(100, 200, 150);

  // Create the font
  textFont(createFont("Georgia", 36));
  textAlign(CENTER, CENTER);

  x = width / 2;
  y = height / 2;
  
  noStroke();
}

void draw() {
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(100, 200, 150, 20);
  rect(0, 0, width, height);
  fill(0);

  if (mousePressed) {
    text("surrounded", x, y);
    pushMatrix();
    textAlign(CENTER);
    fill(000);
   // scale(0.4);
    translate(width/2, height/2);
    rotate(angle);
    text("alone", -100, -100);
    text("alone", 100, 100);
    text("alone", -100, 100);
    text("alone", 100, -100);
    //translate(width/2, height/2);
    //    rotate(-PI/2);
    //    text("alone", width/3, height/2);
    //    text("alone", 2*width/3, height/2);
    angle += 0.08;
    popMatrix();
  }
  else {
    text("alone", x, y);
    text("alone", 5*width/7, 3*height/5);
    text("alone", width/4, height/3);
    text("alone", width/5, 6*height/8);
    text("alone", 2*width/5, 7*height/8);
    text("alone", 4*width/5, height/9);
    text("alone", 4*width/5, 8*height/9);
  }
}



