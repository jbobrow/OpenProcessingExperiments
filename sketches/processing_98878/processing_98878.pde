
import processing.pdf.*;


PShape star;
float h, s, b;
PFont font; 


void setup() {
  size(600, 360, P2D);
  noStroke();
  colorMode(HSB, 255);
  font = createFont("OstrichSans-Black-48.vlw", 20, true);
}  

void makeStar() {
  star = createShape();
  star.beginShape();
  star.vertex(300, 120);
  star.vertex(319, 160);
  star.vertex(362, 165);
  star.vertex(330, 196);
  star.vertex(338, 239);
  star.vertex(300, 219);
  star.vertex(261, 239);
  star.vertex(269, 196);
  star.vertex(238, 165);
  star.vertex(281, 159);
  star.endShape();
}


void makeCircle() {
  ellipseMode(CENTER);
}

void keyPressed() {
  h = random(0, 255);
  s = random(0, 255);
  b = random(0, 255);
  fill(h, s, b);
  println(" hue =" + h + " saturation =" + s + " brightness =" + b);

  // --- plain
  if (key == 'a' || key == 'A') {

    rect(0, 0, width, height);
  }
  // -- 3*vertical
  if (key == 's' || key == 'S') {
    for (int x = 0; x < width; x = x + width/3) {
      fill(random(0, 255), random(0, 255), random(0, 255));

      rect(x, 0, width/3, height);
    }
  }
  // -- 3*horizontal
  if (key == 'd' || key == 'D') {
    for (int y = 0; y < height; y = y + 120) {
      fill(random(0, 255), random(0, 255), random(0, 255));

      rect(0, y, width, height/3);
    }
  }
  // --Scandinavian
  if (key == 'f' || key == 'F' ) {
    rect(0, 0, width, height);
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect (0, 140, width, 40);
    rect (100, 0, 40, height);
  }
  // -- Triangle
  if (key == 'g' || key == 'G') {
    rect(0, 0, width, 360);
    fill(random(0, 255), random(0, 255), random(0, 255));
    triangle(0, 0, 250, 180, 0, height);
  }
  //Commonwealth
  if (key == 'y' || key == 'Y' ) {
    fill(random(0, 255), random(0, 255), random(0, 255));
    for (int y = 0; y < height; y = y+(height/7)*2) {
      rect(0, y, width, height/7);
    }
  }
  // star
  if (key == 'q' || key == 'Q') {
    noStroke();
    makeStar();
    star.scale(0.5);
    shapeMode(CORNERS);
    shape(star, mouseX-150, mouseY-90);
  }
  //circle
  if (key == 'w' || key == 'W') {
    ellipseMode(CENTER);
    ellipse(mouseX, mouseY, 160, 160);
  }
  // HORIZONTAL LINE
  if (key == 'e' || key == 'E') {
    rect(0, mouseY-30, width, 60);
  }
  //veritcal line
  if (key == 'r' || key == 'R') {
    rect(mouseX-30, 0, 60, height);
  }
  //square
  if (key == 't' || key == 'T') {
    rect(0, 0, (width/7)*3, (height/9)*4.5);
  }
  if (key == 'Z' || key == 'z') {

    String[] nouns = loadStrings("nouns.txt");
    String[] other = loadStrings("conjonctions.txt");
    int nounIndex = int(random(nouns.length));
    int nounIndex2 = int(random(nouns.length));
    int nounIndex3 = int(random(nouns.length));
    int otherIndex = int(random(other.length)); 
    String motto =  (nouns[nounIndex] +", "+  nouns[nounIndex2] + ", "  + other[otherIndex] + " " + nouns[nounIndex3]);
    textFont(font, 24);
    fill(0, 0, 255);
    textAlign(CENTER);
    text(motto, mouseX, mouseY);
  }
  if (key == 'X' || key == 'x') {
    String[] nouns = loadStrings("nouns.txt");
    String[] other = loadStrings("conjonctions.txt");
    int nounIndex = int(random(nouns.length));
    int nounIndex2 = int(random(nouns.length));
    int nounIndex3 = int(random(nouns.length));
    int otherIndex = int(random(other.length)); 
    String motto =  (nouns[nounIndex] +", "+  nouns[nounIndex2] + ", "  + other[otherIndex]+" " + nouns[nounIndex3]);
    textFont(font, 20);
    float r = 100;
    translate(width / 2, height / 2);
    noFill();
    noStroke();
    ellipse(mouseX, mouseY, r*2, r*2);

    // We must keep track of our position along the curve
    float arclength = 0;

    // For every box
    for (int i = 0; i < motto.length(); i++)
    {
      // Instead of a constant width, we check the width of each character.
      char currentChar = motto.charAt(i);
      float w = textWidth(currentChar);

      // Each box is centered so we move half the width
      arclength += w/2;
      // Angle in radians is the arclength divided by the radius
      // Starting on the left side of the circle by adding PI
      float theta = PI + arclength / r;    

      pushMatrix();
      // Polar to cartesian coordinate conversion
      translate(r*cos(theta), r*sin(theta));
      // Rotate the box
      rotate(theta+PI/2); // rotation is offset by 90 degrees
      // Display the character
      fill(0, 0, 255);
      text(currentChar, 0, 0);
      popMatrix();
      // Move halfway again
      arclength += w;
    }
  }
}

void mousePressed() {
  saveFrame ("flag-###.jpg");
}

void draw() {
}



