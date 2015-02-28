
String theKey = "a";
String theeKey = "E";


void setup() {
  size(500, 500);
  smooth();
  background(255);
  noStroke();
  PFont font;
  font = loadFont("CamilleBD-200.vlw");
  textFont(font);
  fill(random(100, 180), random(20, 120), random(10, 220), random(100, 170));
}

void draw() {
  background(255);

  for (int i=0;i<=width+50;i=i+95) {
    for (int j=0; j<=height+50; j=j+95) {
      rotLetter (theKey, i, j, TWO_PI*mouseX/width);
    }
  }

  if (key == CODED) {
    if (keyCode == UP) {
      for (int i=0;i<width+95;i=i+95) {
        for (int j=0; j<height+95; j=j+95) {
          rotLetter (theeKey, i, j, TWO_PI*mouseY/height);
        }
      }
    }
  }
  if (key == CODED) {
    if (keyCode == DOWN) {
      for (int i=0;i<width+9;i=i+95) {
        for (int j=0; j<height+95; j=j+95) {
          rotLetter ("S", i+50, j+50, TWO_PI*mouseY/height);
        }
      }
    }
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      for (int i=0;i<width+95;i=i+95) {
        for (int j=0; j<height+95; j=j+95) {
          rotLetter ("f", i, j, TWO_PI*mouseY/height+100);
        }
      }
    }
  }
  if (key == CODED) {
    if (keyCode == ALT) {
      for (int i=0;i<width+95;i=i+95) {
        for (int j=0; j<height+95; j=j+95) {
          rotLetter ("M", i, j, TWO_PI*mouseY/height+100);
        }
      }
    }
  }
  if (key == TAB) {
    for (int i=0;i<width+95;i=i+95) {
      for (int j=0; j<height+95; j=j+95) {
        rotLetter ("C", i, j, TWO_PI*mouseY/height+100);
      }
    }
  }
  if (key == DELETE || key == BACKSPACE) {
    for (int i=0;i<width+95;i=i+95) {
      for (int j=0; j<height+95; j=j+95) {
        rotLetter ("0", i, j, TWO_PI*mouseY/height+100);
      }
    }
  }

  if (keyPressed == true) {
    if ((key>=32) && (key<=126)) {
      theKey =Character.toString(key);
      theeKey = Character.toString(key)+1;
    }
  }
}

void mousePressed() {
  fill(random(80, 180), random(20, 120), random(80, 220), random(200, 220));
}

void keyPressed() {
  if (key == ENTER || key == RETURN) {
    println("saved");
    save("camille-"+ year() + month()+ day() + hour() + minute() + second()+".tiff");
  }
}


void rotLetter(String l, int x, int y, float ang) {
  pushMatrix(); // save state
  textAlign(CENTER); // center letter horiz
  translate(x, y); // move to position
  rotate(ang); // rotate
  // draw char centered on acsender
  // this will work for most Caps, and some lc letters
  // but it will not allways vert center letters
  text(l, 0, textAscent()/2);
  popMatrix(); // return to saved coordinate matrix
}


